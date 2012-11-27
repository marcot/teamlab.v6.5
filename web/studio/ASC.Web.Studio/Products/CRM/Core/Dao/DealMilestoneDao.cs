﻿#region Import

using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using ASC.Collections;
using ASC.Common.Data.Sql;
using ASC.Common.Data.Sql.Expressions;
using ASC.Core;
using ASC.Core.Tenants;
using ASC.CRM.Core.Entities;
using System.Drawing;
using ASC.Files.Core;
using ASC.FullTextIndex;
using ASC.Web.Files.Api;
using AjaxPro;
using OrderBy = ASC.CRM.Core.Entities.OrderBy;

#endregion

namespace ASC.CRM.Core.Dao
{
    public class CachedDealMilestoneDao : DealMilestoneDao
    {
        private readonly HttpRequestDictionary<DealMilestone> _dealMilestoneCache =
            new HttpRequestDictionary<DealMilestone>("crm_deal_milestone");

        public CachedDealMilestoneDao(int tenantID, string storageKey)
            : base(tenantID, storageKey)
        {

        }

        private void ResetCache(int id)
        {
            _dealMilestoneCache.Reset(id.ToString());
        }

        public override int Create(DealMilestone item)
        {
            item.ID = base.Create(item);

            _dealMilestoneCache.Add(item.ID.ToString(), item);

            return item.ID;
        }

        public override void Delete(int id)
        {
            ResetCache(id);

            base.Delete(id);
        }

        public override void Edit(DealMilestone item)
        {
            ResetCache(item.ID);

            base.Edit(item);
        }


        private DealMilestone GetByIDBase(int id)
        {
            return base.GetByID(id);
        }
        
        public override DealMilestone GetByID(int id)
        {
            return _dealMilestoneCache.Get(id.ToString(), () => GetByIDBase(id));
        }

        public override void Reorder(int[] ids)
        {
            _dealMilestoneCache.Clear();

            base.Reorder(ids);
        }
    }

    public class DealMilestoneDao : AbstractDao
    {

        #region Constructor

        public DealMilestoneDao(int tenantID, String storageKey)
            : base(tenantID, storageKey)
        {


        }

        #endregion
        
        public virtual void Reorder(int[] ids)
        {
            using (var tx = DbManager.BeginTransaction())
            {
                for (int index = 0; index < ids.Length; index++)
                    DbManager.ExecuteNonQuery(Update("crm_deal_milestone")
                                             .Set("sort_order", index)
                                             .Where(Exp.Eq("id", ids[index])));

                tx.Commit();
            }
        }

        public int GetCount()
        {

            return DbManager.ExecuteScalar<int>(Query("crm_deal_milestone").SelectCount());
        }


        public Dictionary<int, int> GetRelativeItemsCount()
        {
            var sqlQuery = Query("crm_deal_milestone tbl_deal_milestone")
                          .Select("tbl_deal_milestone.id")
                          .OrderBy("tbl_deal_milestone.sort_order", true)
                          .GroupBy("tbl_deal_milestone.id");

            sqlQuery.LeftOuterJoin("crm_deal tbl_crm_deal",
                                      Exp.EqColumns("tbl_deal_milestone.id", "tbl_crm_deal.deal_milestone_id"))
                .Select("count(tbl_crm_deal.deal_milestone_id)");

            var queryResult = DbManager.ExecuteList(sqlQuery);

            return queryResult.ToDictionary(x => Convert.ToInt32(x[0]), y => Convert.ToInt32(y[1]));
        }

        public int GetRelativeItemsCount(int id)
        {

            var sqlQuery = Query("crm_deal")
                             .Select("count(*)")
                             .Where(Exp.Eq("deal_milestone_id", id));

            return DbManager.ExecuteScalar<int>(sqlQuery);
        }

        public virtual int Create(DealMilestone item)
        {

            if (String.IsNullOrEmpty(item.Title) || String.IsNullOrEmpty(item.Color))
                throw new ArgumentException();

            int id;

            using (var tx = DbManager.BeginTransaction())
            {
                if (item.SortOrder == 0)
                    item.SortOrder = DbManager.ExecuteScalar<int>(Query("crm_deal_milestone")
                                                            .SelectMax("sort_order")) + 1;

                id = DbManager.ExecuteScalar<int>(
                                  Insert("crm_deal_milestone")
                                 .InColumnValue("id", 0)
                                 .InColumnValue("title", item.Title)
                                 .InColumnValue("description", item.Description)
                                 .InColumnValue("color", item.Color)
                                 .InColumnValue("probability", item.Probability)
                                 .InColumnValue("status", (int)item.Status)
                                 .InColumnValue("sort_order", item.SortOrder)
                                 .Identity(1, 0, true));
                tx.Commit();
            }

            return id;

        }


        public virtual void ChangeColor(int id, String newColor)
        {
            DbManager.ExecuteNonQuery(Update("crm_deal_milestone")
                                      .Set("color", newColor)
                                      .Where(Exp.Eq("id", id)));
        }

        public virtual void Edit(DealMilestone item)
        {

            if (HaveContactLink(item.ID))
                throw new ArgumentException();

            DbManager.ExecuteNonQuery(Update("crm_deal_milestone")
                                     .Set("title", item.Title)
                                     .Set("description", item.Description)
                                     .Set("color", item.Color)
                                     .Set("probability", item.Probability)
                                     .Set("status", (int)item.Status)
                                     .Where(Exp.Eq("id", item.ID)));
        }

        public bool HaveContactLink(int dealMilestoneID)
        {
            SqlQuery sqlQuery = Query("crm_deal")
                                .Where(Exp.Eq("deal_milestone_id", dealMilestoneID));

            return DbManager.ExecuteScalar<int>(sqlQuery.SelectCount()) > 0;

        }
        
        public virtual void Delete(int id)
        {
            if (!HaveContactLink(id))
                DbManager.ExecuteNonQuery(Delete("crm_deal_milestone").Where(Exp.Eq("id", id)));

        }

        public virtual DealMilestone GetByID(int id)
        {
            var dealMilestones = DbManager.ExecuteList(GetDealMilestoneQuery(Exp.Eq("id", id))).ConvertAll(row => ToDealMilestone(row));

            if (dealMilestones.Count == 0)
                return null;

            return dealMilestones[0];

        }




        public List<DealMilestone> GetAll(int[] id)
        {
            return DbManager.ExecuteList(GetDealMilestoneQuery(Exp.In("id", id))).ConvertAll(row => ToDealMilestone(row));
        }

        public List<DealMilestone> GetAll()
        {
            return DbManager.ExecuteList(GetDealMilestoneQuery(null)).ConvertAll(row => ToDealMilestone(row));
        }

        private SqlQuery GetDealMilestoneQuery(Exp where)
        {
            SqlQuery sqlQuery = Query("crm_deal_milestone")
                .Select("id",
                        "title",
                        "description",
                        "color",
                        "probability",
                        "status",
                        "sort_order")
                        .OrderBy("sort_order", true);

            if (where != null)
                sqlQuery.Where(where);

            return sqlQuery;

        }

        private static DealMilestone ToDealMilestone(object[] row)
        {
            return new DealMilestone
            {
                ID = Convert.ToInt32(row[0]),
                Title = Convert.ToString(row[1]),
                Description = Convert.ToString(row[2]),
                Color = Convert.ToString(row[3]),
                Probability = Convert.ToInt32(row[4]),
                Status = (DealMilestoneStatus)Convert.ToInt32(row[5]),
                SortOrder = Convert.ToInt32(row[6])
            };
        }



    }
}
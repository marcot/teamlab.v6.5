﻿#region Import

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using ASC.Common.Security;

#endregion

namespace ASC.CRM.Core.Entities
{
    public class TaskTemplateContainer : DomainObject
    {

        public String Title { get; set; }

        public EntityType EntityType { get; set; }

    }

    public class TaskTemplate : DomainObject
    {
        public int ContainerID { get; set; }

        public String Title { get; set; }

        public String Description { get; set; }

        public Guid ResponsibleID { get; set; }

        public int CategoryID { get; set; }

        public bool isNotify { get; set; }

        public TimeSpan Offset { get; set; }

        public bool DeadLineIsFixed { get; set; }

        public Guid CreateBy { get; set; }

        public DateTime CreateOn { get; set; }    

    }
}
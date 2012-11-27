// // --------------------------------------------------------------------------------------------------------------------
// // <copyright company="Ascensio System Limited" file="Id.cs">
// //   
// // </copyright>
// // <summary>
// //   (c) Copyright Ascensio System Limited 2008-2012
// // </summary>
// // --------------------------------------------------------------------------------------------------------------------

#region file header

#endregion

using System;

namespace ASC.Xmpp.Core.protocol
{

    #region usings

    #endregion

    /// <summary>
    /// </summary>
    public enum IdType
    {
        /// <summary>
        ///   Numeric Id's are generated by increasing a long value
        /// </summary>
        Numeric,

        /// <summary>
        ///   Guid Id's are unique, Guid packet Id's should be used for server and component applications, or apps which very long sessions (multiple days, weeks or years)
        /// </summary>
        Guid
    }

    /// <summary>
    ///   This class takes care anout out unique Message Ids
    /// </summary>
    public class Id
    {
        /// <summary>
        /// </summary>
        private static long m_id;

        /// <summary>
        /// </summary>
        private static string m_Prefix = "agsXMPP_";

        /// <summary>
        /// </summary>
        private static IdType m_Type = IdType.Numeric;

        /// <summary>
        /// </summary>
        public static IdType Type
        {
            get { return m_Type; }

#if !CF
            // readyonly on CF1
            set { m_Type = value; }

#endif
        }

#if !CF

        /// <summary>
        /// </summary>
        /// <returns> </returns>
        public static string GetNextId()
        {
            if (m_Type == IdType.Numeric)
            {
                m_id++;
                return m_Prefix + m_id;
            }
            else
            {
                return m_Prefix + Guid.NewGuid();
            }
        }

#else
        
    
    
    // On CF 1.0 we have no GUID class, so only increasing numberical id's are supported
    // We could create GUID's on CF 1.0 with the Crypto API if we want to.
        public static string GetNextId()
        {            
            m_id++;
            return m_Prefix + m_id.ToString();
        }

#endif

        /// <summary>
        ///   Reset the id counter to agsXmpp_1 again
        /// </summary>
        public static void Reset()
        {
            m_id = 0;
        }

        /// <summary>
        ///   to Save Bandwidth on Mobile devices you can change the prefix null is also possible to optimize Bandwidth usage
        /// </summary>
        public static string Prefix
        {
            get { return m_Prefix; }

            set
            {
                if (value == null)
                {
                    m_Prefix = string.Empty;
                }
                else
                {
                    m_Prefix = value;
                }
            }
        }
    }
}
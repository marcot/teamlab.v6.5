// // --------------------------------------------------------------------------------------------------------------------
// // <copyright company="Ascensio System Limited" file="Invitation.cs">
// //   
// // </copyright>
// // <summary>
// //   (c) Copyright Ascensio System Limited 2008-2012
// // </summary>
// // --------------------------------------------------------------------------------------------------------------------

using ASC.Xmpp.Core.protocol.Base;

namespace ASC.Xmpp.Core.protocol.x.muc
{

    #region usings

    #endregion

    /// <summary>
    ///   A base class vor Decline and Invite We need From, To and SwitchDirection here. This is why we inherit from XmppPacket Base
    /// </summary>
    public abstract class Invitation : Stanza
    {
        #region Constructor

        /// <summary>
        /// </summary>
        public Invitation()
        {
            Namespace = Uri.MUC_USER;
        }

        #endregion

        #region Properties

        /// <summary>
        ///   A reason why you want to invite this contact
        /// </summary>
        public string Reason
        {
            get { return GetTag("reason"); }

            set { SetTag("reason", value); }
        }

        #endregion
    }
}
// // --------------------------------------------------------------------------------------------------------------------
// // <copyright company="Ascensio System Limited" file="Agents.cs">
// //   
// // </copyright>
// // <summary>
// //   (c) Copyright Ascensio System Limited 2008-2012
// // </summary>
// // --------------------------------------------------------------------------------------------------------------------

using ASC.Xmpp.Core.utils.Xml.Dom;

namespace ASC.Xmpp.Core.protocol.iq.agent
{
    // Send:<iq id='fullagents' to='myjabber.net' type='get'>
    //			<query xmlns='jabber:iq:agents'/>
    //		</iq>
    // Recv:<iq from="myjabber.net" id="fullagents" to="gnauck@myjabber.net/Office" type="result">
    //			<query xmlns="jabber:iq:agents">
    //				<agent jid="conference.myjabber.net"><name>Public Conferencing</name><service>public</service></agent>
    //				<agent jid="aim.myjabber.net"><name>AIM Transport</name><service>aim</service><transport>Enter ID</transport><register/></agent>
    //				<agent jid="yahoo.myjabber.net"><name>Yahoo! Transport</name><service>yahoo</service><transport>Enter ID</transport><register/></agent>
    //				<agent jid="icq.myjabber.net"><name>ICQ Transport</name><service>icq</service><transport>Enter ID</transport><register/></agent>
    //				<agent jid="msn.myjabber.net"><name>MSN Transport</name><service>msn</service><transport>Enter ID</transport><register/></agent>
    //			</query>
    //		</iq> 

    /// <summary>
    ///   Zusammenfassung f�r Agent.
    /// </summary>
    public class Agents : Element
    {
        public Agents()
        {
            TagName = "query";
            Namespace = Uri.IQ_AGENTS;
        }


        public ElementList GetAgents()
        {
            return SelectElements("agent");
        }
    }
}
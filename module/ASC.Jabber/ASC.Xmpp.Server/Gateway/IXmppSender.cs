﻿using System.Collections.Generic;
using ASC.Xmpp.Core.utils.Xml.Dom;
using ASC.Xmpp.Server.Session;
using ASC.Xmpp.Server.Streams;

namespace ASC.Xmpp.Server.Gateway
{
	public interface IXmppSender
	{
		void SendTo(XmppStream to, Node node);

		void SendTo(XmppStream to, string text);

		void SendTo(XmppSession to, Node node);

		void SendToAndClose(XmppStream to, Node node);

		bool Broadcast(ICollection<XmppSession> sessions, Node node);

		void CloseStream(XmppStream stream);

		void ResetStream(XmppStream stream);

		IXmppConnection GetXmppConnection(string connectionId);
	}
}

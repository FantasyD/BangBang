package com.system.talk;

import java.io.IOException;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/record/{str}")
public class RecordServer {
		public Session session;
		
		private String aab101 = null;
		private String aab102 = null;
		
		private boolean state = false;
		
		public boolean isOpen()
		{
			return this.state;
		}
		
		@OnOpen
		public void open(Session session, @PathParam("str")String str) 
		{
			this.state = true;
			this.session = session;
			int index = str.indexOf("_");
			this.aab101 = str.substring(0, index);
			this.aab102 = str.substring(index + 1);
			
			List<String> mailbox = Users.mailbox.get(this.aab102);
			List<String> mailbox_backup = Users.mailbox_backup.get(this.aab102);
			if(mailbox != null && mailbox_backup != null)
			{
				for(String s : mailbox_backup)
				{
					mailbox.add(s);
				}
				mailbox_backup.clear();
			}
			Users.userRecord.put(this.aab102, this);
		}
		
		
		@OnMessage
		public void message(String message) throws IOException 
		{
			List<String> mailbox_backup = Users.mailbox_backup.get(this.aab102);
			int index = 0;
			if(mailbox_backup != null)
			{
				while(index < mailbox_backup.size())
				{
					if(mailbox_backup.get(index).equals(message))
					{
						mailbox_backup.remove(index);
						continue;
					}
					index++;
				}
			}
		}
		
		
		@OnClose
		public void close(Session session)
		{
			System.out.println("close_recordServer");
			this.state = false;
		}
		
		
		@OnError
		public void error(Throwable t, Session session)
		{
			System.out.println(t.getMessage() + "recordServer");
			System.out.println("Error");
		}
}

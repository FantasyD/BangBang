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
			
			
			Users.userRecord.put(this.aab102, this);
		}
		
		
		@OnMessage
		public void message(String message) throws IOException 
		{
		}
		
		
		@OnClose
		public void close(Session session)
		{
			System.out.println("close");
			this.state = false;
		}
		
		
		@OnError
		public void error(Throwable t, Session session)
		{
			System.out.println(t.getMessage() + "recordServer");
			System.out.println("Error");
		}
}

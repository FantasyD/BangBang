package com.system.talk;
import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.services.impl.Ad01ServicesImpl;
import com.system.io.IOBase;

@ServerEndpoint(value = "/chat/{str}")
public class Server 
{
	private Session session;
	private String user = null;
	private String accept = null;
	
	private String path = "C:\\talkFile\\";
	
	private String chat_id = null;
	private String lastWord = null;
	
	private boolean state = false;
	
	public boolean isOpen()
	{
		return this.state;
	}
	
	
	@OnOpen
	public void open(Session session, @PathParam("str")String str) 
	{
		this.state = true;
		int index = str.indexOf("-");
		int index1 = str.indexOf("*");
		this.user = str.substring(0, index);
		this.accept = str.substring(index + 1, index1); 
		this.chat_id = str.substring(index1 + 1);
		this.session = session;
		Users.user.put(this.user, this);
		if(Users.usertalk.get(this.user + "_" + this.accept) == null && 
				Users.usertalk.get(this.accept + "_" + this.user) == null)
		{
			Users.usertalk.put(this.user + "_" + this.accept, new ArrayList<String>());
		}
		index = this.user.indexOf(".");
		String realUser = this.user.substring(0, index);
		if(Users.mailbox.get(realUser) == null)
		{
			Users.mailbox.put(realUser, new ArrayList<String>());
		}
		try
		{
			List<String> list = Users.usertalk.get(this.user + "_" + this.accept);
			if(list == null)
			{
				list = Users.usertalk.get(this.accept + "_" + this.user);
			}
			String context = null;
			if(IOBase.fileIsExists(path + this.user + "_" + this.accept))
			{
				context = IOBase.getAllString(path + this.user + "_" + this.accept);
			}
			else if(IOBase.fileIsExists(path + this.accept + "_" + this.user))
			{
				context = IOBase.getAllString(path + this.accept + "_" + this.user);
			}
			if(list.size() == 0 && context != null)
			{
				String[] strs = context.split("\n");
				for(String str1 : strs)
				{
					if(str1 == null || str1.equals(""))
					{
						continue;
					}
					list.add(str1);
				}
			}
			for(String s : list)
			{
				Users.user.get(this.user).session.getBasicRemote().sendText(s);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	@OnMessage
	public void message(String message) throws Exception 
	{
		List<String> list = Users.usertalk.get(this.user + "_" + this.accept);
		if(list == null)
		{
			list = Users.usertalk.get(this.accept + "_" + this.user);
		}
		if(!(Users.user.get(this.accept) == null) && Users.user.get(this.accept).isOpen())
		{
			Users.user.get(this.accept).session.getBasicRemote().sendText(message);
		}
		else
		{
			int index = this.accept.indexOf(".");
			String realAccept = this.accept.substring(0, index);
			List<String> mailbox = Users.mailbox.get(realAccept);
			if(mailbox == null)
			{
				mailbox = new ArrayList<String>();
				Users.mailbox.put(realAccept, mailbox);
			}
			mailbox.add(this.chat_id);
			
			String hasAcceptDel = Users.delState.get(this.chat_id);
			if(hasAcceptDel != null && hasAcceptDel.equals(realAccept))
			{
				Ad01ServicesImpl service = new Ad01ServicesImpl();
				service.unDel(this.chat_id);
			}
		}
		if(Users.user.get(this.user).isOpen())
		{
			list.add(message);
			Users.user.get(this.user).session.getBasicRemote().sendText(message);
		}
		lastWord = message;
	}
	
	/**
	 * 关闭
	 * @param session
	 */
	@OnClose
	public void close(Session session)
	{
		Ad01ServicesImpl service = new Ad01ServicesImpl();
		try 
		{
			List<String> list = Users.usertalk.get(this.user + "_" + this.accept);
			if(list == null)
			{
				list = Users.usertalk.get(this.accept + "_" + this.user);
			}
			if(!IOBase.fileIsExists(path + this.user + "_" + this.accept))
			{
				if(!IOBase.fileIsExists(path + this.accept + "_" + this.user))
				{
					IOBase.createFile(path, this.user + "_" + this.accept);
					IOBase.setString(path + this.user + "_" + this.accept, list.toArray(new String[0]));
				}
				else
				{
					IOBase.setString(path + this.accept + "_" + this.user, list.toArray(new String[0]));
				}
			}
			else
			{
				IOBase.setString(path + this.user + "_" + this.accept, list.toArray(new String[0]));
			}
			if(!(lastWord == null || lastWord.equals("")))
			{
				int index = lastWord.indexOf(":");
				service.updateChat(chat_id, lastWord.substring(index + 1));
			}
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		System.out.println("close");
		this.state = false;
	}
	
	
	@OnError
	public void error(Throwable t, Session session)
	{
		System.out.println(t.getMessage() + "server");
		System.out.println("Error");
	}
}
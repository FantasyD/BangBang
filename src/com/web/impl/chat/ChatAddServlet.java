package com.web.impl.chat;

public class ChatAddServlet extends Ad01ControllerSupport
{
	@Override
	public String execute() throws Exception {
		if(this.update("isChatExist", "��Ϣ����", "��Ϣ������"))
		{
			return "chatpage";
		}
		this.update("addChat", "���");
		return "chatpage";
	}
}

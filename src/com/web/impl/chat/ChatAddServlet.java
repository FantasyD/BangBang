package com.web.impl.chat;

public class ChatAddServlet extends Ad01ControllerSupport
{
	@Override
	public String execute() throws Exception {
		this.update("addChat", "Ìí¼Ó");
		this.QueryMapToSession("FindChat", "chat_ins");
		return "chatpage";
	}
}

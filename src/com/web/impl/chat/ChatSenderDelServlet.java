package com.web.impl.chat;

public class ChatSenderDelServlet extends Ad01ControllerSupport
{
	@Override
	public String execute() throws Exception {
		this.update("delSenderChat", "É¾³ý");
		return "center";
	}
}

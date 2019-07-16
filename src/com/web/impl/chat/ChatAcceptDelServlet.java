package com.web.impl.chat;

public class ChatAcceptDelServlet  extends Ad01ControllerSupport
{
	@Override
	public String execute() throws Exception {
		this.update("delAcceptChat", "É¾³ý");
		return "center";
	}
}

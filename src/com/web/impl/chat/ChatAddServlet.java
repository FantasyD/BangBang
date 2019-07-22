package com.web.impl.chat;

public class ChatAddServlet extends Ad01ControllerSupport
{
	@Override
	public String execute() throws Exception {
		if(this.update("isChatExist", "消息存在", "消息不存在"))
		{
			return "chatpage";
		}
		this.update("addChat", "添加");
		return "chatpage";
	}
}

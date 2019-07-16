package com.web.impl.chat;

public class ChatFindByIdServlet extends Ad01ControllerSupport
{
	/**
	 * 向session存入聊天数据
	 * @throws Exception
	 */
	@Override
	public String execute() throws Exception
	{
		this.QueryMapToSession("findById", "chat_ins", "find");;
		return "null";
	}
}

package com.web.impl.complain;

public class HandlingCommentComplainServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("handleCommentComplain", "用户留言处理");
		this.savePageData();
		return "adminComplain";
	}

}

package com.web.impl.complain;

public class HandlingCommentComplainServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("handleCommentComplain", "�û����Դ���");
		this.savePageData();
		return "adminComplain";
	}

}

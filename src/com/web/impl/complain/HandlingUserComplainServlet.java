package com.web.impl.complain;

public class HandlingUserComplainServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("handleUserComplain", "用户举报处理");
		this.savePageData();
		return "adminComplain";
	}

}

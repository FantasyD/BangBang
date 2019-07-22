package com.web.impl.complain;

public class HandleComplainStateServlet extends Af01ControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.update("updateComplainState", "举报处理");
		this.savePageData();
		return "adminComplain";
	}

}

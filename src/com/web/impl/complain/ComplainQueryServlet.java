package com.web.impl.complain;

public class ComplainQueryServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "manageComplain";
	}
}

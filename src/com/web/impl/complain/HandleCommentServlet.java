package com.web.impl.complain;

public class HandleCommentServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "HandleComment";
	}
}

package com.web.impl.complain;

public class ComplainAddServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComplain", "举报成功", "举报失败");
		return "complain";
	}
}

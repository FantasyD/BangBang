package com.web.impl.complain;

public class ComplainAddServlet extends Af01ControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComplain", "Ã·Ωª");
		return "complain";
	}
}

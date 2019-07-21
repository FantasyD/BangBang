package com.web.impl.group;

import com.services.impl.Ae02ServicesImpl;

public class AcceptInviteServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		int i=this.checkInfo("acceptInvite");
		this.setResponseAttribute("num", String.valueOf(i));
		return null;
	}
}

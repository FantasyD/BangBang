package com.web.impl;

public class InviteToGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("acceptInvite", "Ω” ‹");
		//this.update("inviteGroup", "—˚«Î");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}

}

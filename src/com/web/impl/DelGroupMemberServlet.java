package com.web.impl;

public class DelGroupMemberServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("quitGroup", "É¾³ý");
		this.savePageInstance();
		this.savePageDataForDelete();
		return "group";
	}
}

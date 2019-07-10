package com.web.impl;

public class FindUserByNumberServlet extends GroupMemberServlet
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "group";
	}

}

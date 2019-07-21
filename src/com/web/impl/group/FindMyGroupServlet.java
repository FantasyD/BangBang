package com.web.impl.group;

public class FindMyGroupServlet extends MyGroupsServlet
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "myGroups";
	}

}

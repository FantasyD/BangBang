package com.web.impl.group;

public class QuitGroupServlet extends MyGroupsServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("quitGroup", "�˳�");
		this.savePageData();
		return "myGroups";
	}
}

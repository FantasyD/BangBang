package com.web.impl.group;

public class GroupIsExistServlet extends MyGroupsServlet
{
	@Override
	public String execute() throws Exception
	{
		boolean tag=this.checkInfo("isExist")>0;
		this.setResponseAttribute("isExist", String.valueOf(tag));
		System.out.println(tag);
		return null;
	}

}

package com.web.impl.group;

public class FindUserByNameServlet extends GroupMemberServlet
{
	@Override
	public String execute() throws Exception
	{
		this.savePageDataToSession();
		return null;
	}

}

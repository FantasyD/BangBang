package com.web.impl.group;

public class QuitGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("quitGroup", "ÍË³ö");
		this.savePageInstance();
		this.savePageDataForDelete();
		return "groupDetail";
	}
}

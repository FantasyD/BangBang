package com.web.impl.email;

public class UpdateAllEmailServlet extends EmailServlet
{

	@Override
	public String execute() throws Exception
	{
		this.update("updateAllEmail", "ÐÞ¸Ä");
		return null;
	}

}

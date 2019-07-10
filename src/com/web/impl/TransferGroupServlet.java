package com.web.impl;

public class TransferGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("transferGroup", "×ªÈÃ");
		this.savePageInstance();
		this.savePageData();
		return "group";
	}
	
}

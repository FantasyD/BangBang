package com.web.impl.tiezi;

public class ModifyTieziServlet extends TieziControlletSupport
{
	@Override
	public String execute() throws Exception
	{
		this.update("modifyTiezi","Ìû×ÓÐÞ¸Ä");
		this.savePageData();
		return "myPost";
	}
}

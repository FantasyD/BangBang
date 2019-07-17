package com.web.impl.tiezi;

import com.services.impl.Ac04ServicesImpl;
import com.web.support.ControllerSupport;

public class QueryTieziServlet extends ControllerSupport 
{	
	public QueryTieziServlet()
	{
		this.setServices(new Ac04ServicesImpl());
	}
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "queryTiezi";
	}
}

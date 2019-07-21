package com.web.impl.search;

import com.services.impl.SearchServicesImpl;
import com.web.support.ControllerSupport;

public class SearchServlet extends ControllerSupport 
{

	public SearchServlet() 
	{
		this.setServices(new SearchServicesImpl());
	}

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "result";
	}

}

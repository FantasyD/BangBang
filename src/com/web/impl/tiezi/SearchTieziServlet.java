package com.web.impl.tiezi;

import com.services.impl.Ac06ServicesImpl;
import com.web.support.ControllerSupport;

public class SearchTieziServlet extends ControllerSupport 
{

	public SearchTieziServlet() 
	{
		this.setServices(new Ac06ServicesImpl());
	}

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "index";
	}

}

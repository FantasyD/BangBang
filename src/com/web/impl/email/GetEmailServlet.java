package com.web.impl.email;

import com.services.impl.GetAh01ServiceImpl;
import com.web.support.ControllerSupport;

public class GetEmailServlet extends EmailServlet
{
	@Override
	public String execute() throws Exception
	{
		this.savePageData();
		return "email";
	}

}

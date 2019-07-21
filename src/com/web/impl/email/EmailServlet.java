package com.web.impl.email;

import com.services.impl.GetAh01ServiceImpl;
import com.web.support.ControllerSupport;

public abstract class EmailServlet extends ControllerSupport
{
	public EmailServlet()
	{
		this.setServices(new GetAh01ServiceImpl());
	}
}

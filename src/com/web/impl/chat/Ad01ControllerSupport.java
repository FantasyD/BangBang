package com.web.impl.chat;

import com.services.impl.Ad01ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class Ad01ControllerSupport extends ControllerSupport 
{
	public Ad01ControllerSupport() 
	{
		this.setServices(new Ad01ServicesImpl());
	}
}

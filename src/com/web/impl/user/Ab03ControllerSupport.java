package com.web.impl.user;

import com.services.impl.Ab03ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class Ab03ControllerSupport  extends ControllerSupport 
{
	public Ab03ControllerSupport() 
	{
		this.setServices(new Ab03ServicesImpl());
	}
}
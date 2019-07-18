package com.web.impl.user;

import com.services.impl.Ab01ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class Ab01ControllerSupport  extends ControllerSupport 
{
	public Ab01ControllerSupport() 
	{
		this.setServices(new Ab01ServicesImpl());
	}
}

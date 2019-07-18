package com.web.impl.complain;

import com.services.impl.Af01ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class Af01ControllerSupport extends ControllerSupport 
{
	public Af01ControllerSupport() 
	{
		this.setServices(new Af01ServicesImpl());
	}
}

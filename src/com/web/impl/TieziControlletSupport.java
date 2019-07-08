package com.web.impl;

import com.services.impl.Ac01ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class TieziControlletSupport  extends ControllerSupport 
{

	public TieziControlletSupport() 
	{
		// TODO Auto-generated constructor stub
		this.setServices(new Ac01ServicesImpl());
	}
}

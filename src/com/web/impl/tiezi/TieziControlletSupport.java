package com.web.impl.tiezi;

import com.services.impl.Ac01ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class TieziControlletSupport  extends ControllerSupport 
{

	public TieziControlletSupport() 
	{
		this.setServices(new Ac01ServicesImpl());
	}
}

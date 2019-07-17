package com.web.impl.placement;

import java.util.List;
import java.util.Map;

import com.services.impl.Ac03ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class PlacementControllerSupport extends ControllerSupport 
{
	public PlacementControllerSupport() 
	{
		this.setServices(new Ac03ServicesImpl());
	}
}

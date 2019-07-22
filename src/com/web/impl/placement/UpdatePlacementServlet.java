package com.web.impl.placement;

import com.services.impl.Ac03ServicesImpl;
import com.web.support.ControllerSupport;

public class UpdatePlacementServlet extends ControllerSupport 
{
	public UpdatePlacementServlet()
	{
		this.setServices(new Ac03ServicesImpl());
	}
	
	@Override
	public String execute() throws Exception 
	{
		this.update("updatePlacementState", "״̬�޸�");
		this.savePageData();
	
		return "adminPost";
	}
}

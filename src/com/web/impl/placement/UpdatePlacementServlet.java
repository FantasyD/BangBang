package com.web.impl.placement;

import com.services.impl.Ac03ServicesImpl;
import com.services.impl.Ah01ServiceImpl;
import com.web.support.ControllerSupport;

public class UpdatePlacementServlet extends ControllerSupport 
{
	public UpdatePlacementServlet()
	{
		this.setServices(new Ah01ServiceImpl(new Ac03ServicesImpl(),"aab101","aab101"));
	}
	
	@Override
	public String execute() throws Exception 
	{
		this.update("updatePlacementState", "×´Ì¬ÐÞ¸Ä");
		this.savePageData();
		
		this.update("sendEmail", "·¢ËÍ");
		return "queryPlacement";
	}
}

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
	
	protected final void savePageDataPlacement() throws Exception
	{
		List<Map<String, String>> rows = new Ac03ServicesImpl().queryPlacement();
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
			//this.saveAttribute("aab101", this.dto.get("aab101"));
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}
	
	protected final void savePageDataPlacementByState() throws Exception
	{
		List<Map<String, String>> rows = new Ac03ServicesImpl().queryPlacementByState();
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
			//this.saveAttribute("aab101", this.dto.get("aab101"));
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}
}

package com.web.impl.placement;

public class QueryPlacementServlet extends PlacementControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageDataPlacement();
		return "queryPlacement";
	}
}

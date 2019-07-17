package com.web.impl.placement;

public class QueryPlacementByStateServlet extends PlacementControllerSupport
{
	public String execute() throws Exception 
	{
		this.savePageData();;
		return "topPostPage";
	}
}

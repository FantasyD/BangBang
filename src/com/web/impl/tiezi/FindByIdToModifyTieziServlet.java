package com.web.impl.tiezi;

public class FindByIdToModifyTieziServlet extends TieziControlletSupport{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "addTiezi";
	}

}

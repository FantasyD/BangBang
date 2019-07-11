package com.web.impl.tiezi;

public class QueryTieziByIdServlet extends TieziControlletSupport  {
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.savePageData();
		return "myTiezi";
	}
}

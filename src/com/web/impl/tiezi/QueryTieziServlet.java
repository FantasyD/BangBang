package com.web.impl.tiezi;

public class QueryTieziServlet extends TieziControlletSupport {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.savePageData();
		return "queryTiezi";
	}
}

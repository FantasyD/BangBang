package com.web.impl.tiezi;

public class FindByIdTieziServlet extends TieziControlletSupport
{

	@Override
	public String execute() throws Exception {
		this.savePageInstance();
		return "tieziDetails";
	}

}

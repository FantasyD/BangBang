package com.web.impl;

public class UploadImageServlet extends TieziControlletSupport  
{

	@Override
	public String execute() throws Exception {
		this.update("insertImg", "Í¼Æ¬Ìí¼Ó³É¹¦");
		return "imgTest";
	}
}

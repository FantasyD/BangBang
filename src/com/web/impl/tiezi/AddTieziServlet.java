package com.web.impl.tiezi;

import com.services.impl.Ac05ServicesImpl;
import com.web.support.ControllerSupport;

public class AddTieziServlet extends ControllerSupport  
{
	public AddTieziServlet()
	{
		this.setServices(new Ac05ServicesImpl());
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.update("addTiezi","�������");

		this.savePageInstance();
		/*
		this.setServices(new Ah01ServiceImpl(new Ac05ServicesImpl(),"aab101","aab101"));
		*/
		return "postDetails";
	}
}

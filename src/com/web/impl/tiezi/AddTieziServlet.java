package com.web.impl.tiezi;

import com.services.impl.Ac05ServicesImpl;
import com.services.impl.Ah01ServiceImpl;
import com.web.support.ControllerSupport;

public class AddTieziServlet extends ControllerSupport  
{
	public AddTieziServlet()
	{
		this.setServices(new Ah01ServiceImpl(new Ac05ServicesImpl(),"aab101","aab101"));
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		this.update("addTiezi","Ìí¼ÓÌû×Ó");

		this.savePageInstance();
		
		this.update("batchSendEmail", "·¢ËÍ");
		/*
		this.setServices(new Ah01ServiceImpl(new Ac05ServicesImpl(),"aab101","aab101"));
		*/
		return "tieziDetails";
	}
}

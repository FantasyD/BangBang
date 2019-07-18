package com.web.impl.comment;

import com.services.impl.Ac02ServicesImpl;
import com.services.impl.Ah01ServiceImpl;
import com.web.support.ControllerSupport;

public class AddCommentServlet extends ControllerSupport  
{
	public AddCommentServlet() 
	{
		this.setServices(new Ah01ServiceImpl(new Ac02ServicesImpl(),"aab101","aab101"));
	}
	
	
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment","¡Ù—‘∑¢≤º");
		this.savePageInstance();
		this.savePageData();
		
		
		this.update("sendEmail", "∑¢ÀÕ");
		
		return "tieziDetails";
	}
}

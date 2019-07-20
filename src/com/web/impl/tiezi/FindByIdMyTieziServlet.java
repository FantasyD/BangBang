package com.web.impl.tiezi;

import com.web.impl.comment.CommentControllerSupport;

public class FindByIdMyTieziServlet extends CommentControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		this.savePageInstance();
		return "postDetailsOfMy";
	}
}

package com.web.impl.comment;

public class AddCommentServlet extends CommentControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment","¡Ù—‘∑¢≤º");
		this.savePageInstance();
		this.savePageData();
		
		return "postDetails";
	}
}

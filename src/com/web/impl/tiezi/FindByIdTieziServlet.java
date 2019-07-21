package com.web.impl.tiezi;

import com.web.impl.comment.CommentControllerSupport;

public class FindByIdTieziServlet extends CommentControllerSupport
{

	@Override
	public String execute() throws Exception {
		this.savePageData();
		this.savePageInstance();
		return "postDetails";
	}

}

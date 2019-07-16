package com.web.impl.comment;

import com.services.impl.Ac02ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class CommentControllerSupport  extends ControllerSupport 
{
	public CommentControllerSupport() 
	{
		this.setServices(new Ac02ServicesImpl());
	}
}

package com.web.impl.comment;

import java.util.List;
import java.util.Map;

import com.services.impl.Ac01ServicesImpl;
import com.services.impl.Ac02ServicesImpl;
import com.web.support.ControllerSupport;

public abstract class CommentControllerSupport  extends ControllerSupport 
{
	public CommentControllerSupport() 
	{
		this.setServices(new Ac02ServicesImpl());
	}
	
	/**
	 * 帖子级联查询
	 * @throws Exception
	 */
	protected void savePageInstance2() throws Exception
	{
		Map<String, String> ins = this.getServices().findById();
		if (ins != null)
		{
			this.saveAttribute("ins", ins);
			this.saveAttribute("aab101", super.getDtoObject("aab101"));
			this.saveAttribute("type", super.getDtoObject("type"));
		}
		else
		{
			this.saveAttribute("msg", "提示:该数据已删除或禁止访问!");
		}
		List<Map<String, String>> rows = this.getServices().queryComment();
		if (rows.size() > 0)
		{
			this.saveAttribute("rows", rows);
		}
		else
		{
			this.saveAttribute("msg", "没有符合条件的数据!");
		}
	}
}

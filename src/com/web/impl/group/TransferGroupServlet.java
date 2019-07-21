package com.web.impl.group;

/**
 * @Description: 转让群组创建者身份
 * @author: 宁志豪
 */
public class TransferGroupServlet extends GroupServlet
{
	@Override
	public String execute() throws Exception
	{
		this.update("transferGroup", "转让");
		this.savePageInstance();
		this.savePageData();
		return "groupDetail";
	}
	
}

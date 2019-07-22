package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * 
 * @ClassName: Ab03ServicesImpl.java 
 * @Description: ��ab03��Ĳ���(��Ҫ�ǲ�ѯ����Ա)
 *
 * @author: xzc
 */

public class Ab03ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * ����Ա��¼��ѯ
	 */
	public Map<String, String> check()throws Exception
	{
		String sql="select a.aab301,a.aab302,a.aab303 from ab03 a where a.aab302=? and a.aab303=?";
		Object args[] = {this.get("adminId"),this.get("aab303")};
		Map<String, String> map = this.queryForMap(sql,args);
		if(map!=null)
		{
			return map;
		}
		return null;	
	}
}

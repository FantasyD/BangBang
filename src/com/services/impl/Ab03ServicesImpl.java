package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

/**
 * 
 * @ClassName: Ab03ServicesImpl.java 
 * @Description: 对ab03表的操作(主要是查询管理员)
 *
 * @author: xzc
 */

public class Ab03ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * @Description:查询管理员
	 */
	public Map<String, String> findById()throws Exception
	{
		String sql="select a.aab301,a.aab302,a.aab303 from ab03 a where a.aab302=? and a.aab303=?";
		Object args[] = {this.get("aab302"),this.get("aab303")};
		System.out.println("ins:"+this.queryForMap(sql, args));
		return this.queryForMap(sql, args);
	}
}

package com.services.impl;

import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

public class Ae02ServiceImpl extends JdbcServicesSupport
{
	/**
	 * @Description: 模糊查询
	 * @throws：sql语句执行出错
	 */
	public List<Map<String,String>> query()throws Exception
	{
		String sql="select aab101,aab102,aab115 from ab01 where aab102 like ?";
		Object name="%"+this.get("aab102")+"%";
		
		return this.queryForList(sql, name);
	}
	

	
}

package com.services.impl;

import java.util.List;
import java.util.Map;

import com.services.JdbcServicesSupport;

public class Ae03ServicesImpl extends JdbcServicesSupport
{
	
	public List<Map<String,String>> query()throws Exception
	{
		String sql="select ae02.aae101,aae102,aae103,aae105 from ae01,ae02 where ae01.aae101=ae02.aae101 and ae02.aab101=?";
		return this.queryForList(sql, this.get("aab101"));
	}
	
}

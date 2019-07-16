package com.services.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.services.JdbcServicesSupport;

public class Ac04ServicesImpl extends JdbcServicesSupport
{
	private List<Entry<String, Double>> getRate(List<Map<String,String>> readList)throws Exception
	{
		int sum=0;
		for(Map<String,String> map:readList)
		{
			sum+=Integer.parseInt(map.get("times"));
		}
		Map<String,Double> likeMap=new HashMap<>();
		for(Map<String,String> map:readList)
		{
			int i=Integer.parseInt(map.get("times"));
			double rate=new BigDecimal((float)i/sum).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			likeMap.put(map.get("aac103"), rate);
		}
		System.out.println(likeMap);
		return new ArrayList<>(likeMap.entrySet());
	}
	
	private List<Entry<String, Double>> getReadRate()throws Exception
	{
		StringBuilder sb=new StringBuilder()
				.append("SELECT g.aac101,c.aac103,COUNT(c.aac103) as times ")
				.append("	from ac01 c,ag01 g")
				.append(" where c.aac101=g.aac101")
				.append("   and g.aab101=?")
				.append("group by c.aac103")
				;
		Object id=this.get("aab101");
		
		return this.getRate(this.queryForList(sb.toString(), id));
	}
	
	public List<Map<String,String>> query()throws Exception
	{
		//帖子类型
		String type[]= {"01","02","03","04","05","06",};
		//单页显示帖子数
		int num=10;
		
		List<Entry<String, Double>> likeMap = this.getReadRate();
		// 定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106,")
				.append("             x.aac105,b.aab101,x.aac108")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode and a.fname = 'aac103' ")
				.append("   and x.aab101 = b.aab101 ")
				.append("	 and x.aac103=?")
				.append(" ORDER BY x.aac108 DESC")
				.append(" LIMIT ?,?")
				;
		int page=Integer.parseInt(this.get("pageNum").toString());
		List<Map<String,String>> showList=new ArrayList<>();
		//定义页面多余展示份额
		return showList;
	}
	
	private void pri()
	{
		List<String> ls=new ArrayList<>();
	}
	
}

package com.services.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.omg.IOP.ENCODING_CDR_ENCAPS;

import com.services.JdbcServicesSupport;

public class Ac04ServicesImpl extends JdbcServicesSupport
{
	
	/**
	 * @Description: 计算用户浏览过的帖子类型比例
	 * @param:用户浏览帖子记录
	 * @return:浏览帖子类型比例
	 * @throws: sql语句执行出错
	 */
	private List<Entry<String, Double>> getRate(List<Map<String,String>> readList)throws Exception
	{
		//帖子类型
		String types[]= {"01","02","03","04","05","06",};
		int sum=0;
		//计算浏览总数
		for(Map<String,String> map:readList)
		{
			sum+=Integer.parseInt(map.get("times"));
		}
		//添加用户所浏览的帖子类型对应的比例
		Map<String,Double> likeMap=new HashMap<>();
		for(Map<String,String> map:readList)
		{
			int i=Integer.parseInt(map.get("times"));
			double rate=new BigDecimal((float)i/sum).setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			likeMap.put(map.get("aac103"), rate);
		}
		//当用户浏览记录中不存在该类型时添加该类型推荐率为0.00
		for(String type:types)
		{
			boolean tag=true;
			for(String key:likeMap.keySet())
			{
				if(key.equals(type))
				{
					tag=false;
				}
			}
			if(tag)
			{
				likeMap.put(type, 0.0);
			}
		}
		return new ArrayList<>(likeMap.entrySet());
	}
	
	/**
	 * @Description: 查询数据库获取用户的浏览记录
	 * @return:用户浏览帖子的类型比例
	 * @throws: sql语句执行出错
	 */
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
	
	/**
	 * @Description: 
	 * 	查询
	 * @return:返回结果描述
	 * @throws:sql语句执行出错
	 */
	public List<Map<String,String>> query()throws Exception
	{
		// 定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,x.aac103,a.fvalue cnaac103,x.aac106,")
				.append("             x.aac105,b.aab101,x.aac108,x.aac108")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode and a.fname = 'aac103' ")
				.append("   and x.aab101 = b.aab101 ")
				.append(" ORDER BY x.aac110")
				;
		List<Map<String,String>> showList=this.sequnenceList(this.queryForList(sql.toString()),this.getReadRate());
		return showList;
	}
	
	private List<Map<String,String>> sequnenceList(List<Map<String,String>> list,List<Entry<String, Double>> likeMap) throws Exception
	{
		//单页显示帖子数
		int num=10;
		List<Map<String,String>> showList=new ArrayList<>();
		List<Entry<String, Double>> removeList=new ArrayList<>();
		for(Entry<String, Double> entry:likeMap)
		{
			int showNum=(int)(entry.getValue()*(num-likeMap.size()))+1;
			int addNum=0;
			int size=list.size();
			for(int i=0;i<size;i++)
			{
				if(list.get(i).get("aac103").equals(entry.getKey()))
				{
					showList.add(list.get(i));
					addNum++;
					if(addNum==showNum)
						break;
				}
			}
			if(addNum!=showNum)
			{
				removeList.add(entry);
			}
		}
		if(removeList.size()!=0)
		{
			likeMap.removeAll(removeList);
		}
		if(showList.size()!=list.size())
		{
			list.removeAll(showList);
			this.sequnenceList(list, likeMap);
		}
		
		return showList;
	}
	
}

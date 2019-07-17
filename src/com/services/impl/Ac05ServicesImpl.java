package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * @Description: 发布帖子
 */
public class Ac05ServicesImpl extends JdbcServicesSupport
{
	/**
	 * @Description: 
	 * 	获取所有需要发送邮件通知的用户列表
	 * 	包含所有群组同组成员以及关注该用户的用户
	 * @return:所有需要发送通知邮件的用户列表
	 * @throws:异常描述
	 */
	public List<Map<String, String>> query()throws Exception
	{
		List<Map<String,String>> list=new ArrayList<>();
		list.addAll(this.getGroupsId());
		list.addAll(this.getFollowId());
		return list;
	}
	
	/**
	 * @Description: 获取每个群组中的组员流水号
	 * @param:群组id
	 * @return:每个群组的组员流水号列表
	 * @throws: sql语句执行出错
	 */
	public List<Map<String,String>> getGroupsMembersId(Object...ids)throws Exception
	{
		String sql="select aab101 from ae02 where aab101<>? and aae101=?";
		return this.queryForList(sql, ids);
	}
	
	/**
	 * @Description: 获取用户的所有群组
	 * @return:用户的所有群组列表
	 * @throws: sql语句执行出错
	 */
	public List<Map<String,String>> getGroupsId()throws Exception
	{
		String sql="select aae101 from ae02 where aab101=?";
		Object id=this.get("aab101");
		List<Map<String,String>> groups=this.queryForList(sql, id);
		List<Map<String,String>> members=new ArrayList<>();
		for(Map<String,String> member:groups)
		{
			Object ids[]= {id,member.get("aae101")};
			members.addAll(this.getGroupsMembersId(ids));
		}
		return members;
	}
	
	/**
	 * @Description: 获取所有关注了该用户的用户流水号
	 * @return:关注该用户的用户列表
	 * @throws: sql语句执行出错
	 */
	public List<Map<String,String>> getFollowId()throws Exception
	{
		String sql="select aab101 from ab02 where ab0_aab101=?";
		Object id=this.get("aab101");
		return this.queryForList(sql, id);
	}
	
	
	public Map<String, String> findById() throws Exception
	{				
		StringBuilder str = new StringBuilder()
				.append("select x.aac101,b.aab102 cnaab102,x.aac102,a.fvalue cnaac103,x.aac106, ")
				.append("       x.aac105,x.aac104,x.aac109 imgPath,b.aab101")
				.append("  from syscode a,ac01 x,ab01 b")
				.append(" where x.aac103 = a.fcode  ")
			    .append("   and x.aab101 = b.aab101  " )
			    .append("   and a.fname = 'aac103' and x.aac101 = ? ") 
				;
		return this.queryForMap(str.toString(), (Tools.getSequenceWithoutAdd("aac101")));	
	}

}

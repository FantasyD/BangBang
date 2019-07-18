package com.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.services.BaseServices;
import com.services.JdbcServicesSupport;
import com.system.tools.Tools;

/**
 * @Description: 实现邮件模块所需的数据库操作支持
 * @author: 宁志豪
 */
public abstract class Ah01ServiceImpl extends JdbcServicesSupport
{
	/**
	 * @Description: 单一邮件发送入口
	 * @throws: sql语句执行出错
	 */
	public boolean sendEmail()throws Exception
	{
		return this.sendEmail(null);
	}
	
	/**
	 * @Description: 邮件批量插入入口
	 * @throws: sql语句执行出错
	 */
	public boolean batchSendEmail()throws Exception
	{
		List<Map<String,String>> list=this.query();
		System.out.println(list);
		if(list!=null && list.size()!=0) 
		{
			for(Map<String,String> map:list)
			{
				this.sendEmail(map.get("aab101"));
			}
			return true;
		}
		return false;
	}
	
	/**
	 * @Description: 向邮件表中插入邮件记录
	 * 	插入邮件所需的dto:
	 * 		aab101: 邮件接收人
	 * 		aah102: 邮件类型(0表示通知类，1表示链接类，2表示询问类)
	 * 		aah103: 邮件标题
	 * 		aah104: 邮件内容
	 * 		aah105: 邮件创建时间
	 * 		aah106: 邮件状态(0表示未读，1表示已读)
	 * 		aah202: 第一个链接(存放链接类和询问类邮件所需的必要链接)
	 * 				  通知类邮件不填
	 * 		aah203: 第二个链接(存放询问类邮件所需的链接)
	 * 				   通知类与链接类不填
	 * 		
	 * 	通知类邮件主要是给用户展示通知，不需要用户进行任何操作
	 * 	链接类邮件在向用户展示通知的同时会给予一个链接供用户操作
	 * 	询问类邮件主要是询问用户的意向，会有接受和拒绝两种选择
	 * @param: 邮件接收人
	 * @throws: sql语句执行出错
	 */
	private boolean sendEmail(Object aab101)throws Exception
	{
		//检测邮件接收方是否存在
		String str="select aab102 from ab01 where aab101=?";
		if(aab101==null)
		{
			aab101=this.get("aab101");
		}
		if(this.queryForList(str, aab101).size()==0)
		{
			return false;
		}
		
		StringBuilder sb=new StringBuilder()
				.append("insert into ah01(aah101,aab101,aah102,aah103,aah104,aah105,")
				.append("                                    aah106)")
				.append("                    values(?,?,?,?,?,CURRENT_TIMESTAMP,0)")
				;
		Object state= Tools.getSequence("aah101");
		
		Object idlist[]= {
				state,
				aab101,
				this.get("aah102"),
				this.get("aah103"),
				this.get("aah104")
				};
		this.appendSql(sb.toString(), idlist);
		
		int type=Integer.valueOf(this.get("aah102").toString());
		if(type==1) 
		{
			String sql="insert into ah02(aah101,aah202) values(?,?)";		
			Object ids[]= {state,this.get("aah202")};
			this.appendSql(sql, ids);
		}
		else if(type==2)
		{
			String sql="insert into ah02(aah101,aah202,aah203) values(?,?,?)";		
			Object ids[]= {state,this.get("aah202"),this.get("aah203")};
			this.appendSql(sql, ids);
		}
		return this.executeTransaction();
		
	}
	
	/**
	 * @Description: 修改邮件状态
	 * @throws: sql语句执行出错
	 */
	public boolean updateEmail()throws Exception
	{
		String sql="update ah01 set aah106 =? where aah101=?";
		Object idlist[]= {this.get("aah106"),this.get("aah101")};
		
		return this.executeUpdate(sql, idlist)>0;
	}
}

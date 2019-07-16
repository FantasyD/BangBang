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
public class Ah01ServiceImpl extends JdbcServicesSupport
{
	/************************************************************
	 * 			以下方法的目的在于抽象findById和query方法
	 * 			将具体的实现方法交由具体的Service方法实现
	 *************************************************************/
	private BaseServices baseServices;
	private String key;
	private String id;
	
	/**
	* @Description: 
	*	无参构造器
	*	如果不需要进行查询数据，则使用本构造器
	 */
	public Ah01ServiceImpl()
	{
	}
	
	/**
	* @Description: 
	* 	构造函数
	* 	需要进行查询操作时使用本构造器
	* 	初始化baseServices属性，决定使用的BaseServices实现类
	* 	创造与查询的dto
	* @param:
	* 	baseServices: BaseServices的实现类
	* 	key: 在当前dto中存放的用于查询的键值对的key
	* 	id: 具体查询时使用的键值对的key
	 */
	public Ah01ServiceImpl(BaseServices baseServices,String key,String id)
	{
		this.baseServices=baseServices;
		this.key=key;
		this.id=id;

	}
	
	/**
	 * @Description:单一实例查询，根据主键查询数据，具体实现交由具体类
	 * @throws: sql语句执行出错
	 */
	public Map<String, String> findById()throws Exception
	{
		//如果没有初始化baseService属性则不予执行单一实例查询
		if(this.isExited())
		{
			Map<String,String> result=this.baseServices.findById();
			return result;
		}
		else
			return null;
	}
	
	/**
	 * @Description: 数据批量查询
	 * @throws:sql语句执行出错
	 */
	public List<Map<String,String>> query()throws Exception
	{
		//如果没有初始化baseService属性则不予执行数据批量处理
		if(this.isExited())
			return this.baseServices.query();
		else
			return null;
	}
	
	/**
	 * @Description: 检测是否初始化baseServices属性
	 * @throws: sql语句执行出错
	 */
	public boolean isExited()
	{
		if(this.baseServices!=null)
		{
			Map<String,Object> map=new HashMap<>();
			map.put(id, this.get(key));
			this.baseServices.setMapDto(map);
			return true;
		}
		else
		{
			return false;
		}
	}
	
	/***************************************************************************
	 * 						以下方法为邮件的插入与查询方法
	 * 
	 ***************************************************************************/
	
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
	 * @throws：sql语句执行出错
	 */
	public boolean sendEmail()throws Exception
	{
		StringBuilder sb=new StringBuilder()
				.append("insert into ah01(aah101,aab101,aah102,aah103,aah104,aah105,")
				.append("                                    aah106)")
				.append("                    values(?,?,?,?,?,CURRENT_TIMESTAMP,0)")
				;
		Object state= Tools.getSequence("aah101");
		Object idlist[]= {
				state,
				this.get("aab101"),
				this.get("aah102"),
				this.get("aah103"),
				this.get("aah104")
				};
		this.apppendSql(sb.toString(), idlist);;
		
		int type=Integer.valueOf(this.get("aah102").toString());
		if(type==1) 
		{
			String sql="insert into ah02(aah101,aah202) values(?,?)";		
			Object ids[]= {state,this.get("aah202")};
			this.apppendSql(sql, ids);
		}
		else if(type==2)
		{
			String sql="insert into ah02(aah101,aah202,aah203) values(?,?,?)";		
			Object ids[]= {state,this.get("aah202"),this.get("aah203")};
			this.apppendSql(sql, ids);
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

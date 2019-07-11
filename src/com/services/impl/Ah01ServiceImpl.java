package com.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.services.BaseServices;
import com.services.JdbcServicesSupport;

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
	 * @throws：sql语句执行出错
	 */
	public boolean sendEmail()throws Exception
	{
		StringBuilder sb=new StringBuilder()
				.append("insert into ah01(aab101,aah102,aah103,aah104,aah105,")
				.append("                                    aah106,aah107)")
				.append("                    values(?,?,?,?,CURRENT_TIMESTAMP,0,?)")
				;
		Object id[]= {
				this.get("aab101"),
				this.get("aah102"),
				this.get("aah103"),
				this.get("aah104"),
				this.get("aah107")
				};
		return this.executeUpdate(sb.toString(), id)>0;
	}


}

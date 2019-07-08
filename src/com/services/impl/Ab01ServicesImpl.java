package com.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.services.JdbcServicesSupport;
import com.system.db.DBUtils;
import com.system.tools.Tools;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.bcel.internal.generic.RETURN;

public class Ab01ServicesImpl extends JdbcServicesSupport {
	

	public boolean update(String utype) throws Exception
	{
		if(utype.equalsIgnoreCase("addEmp"))
		{
			return this.addEmp();
		}
		else if (utype.equalsIgnoreCase("deleteById")) 
		{
			return this.deleteById();
		}
		else if (utype.equalsIgnoreCase("modifyEmp")) 
		{
			return this.updateById();
		}
		else if (utype.equalsIgnoreCase("batchDelete")) 
		{
			return this.delEmp();
		}
		else {
			throw new Exception("在类[Ab01ServicesImpl]中进行了未定义的动作调用,动作名称是" + utype);
		}
		
	}
	
	public boolean deleteById() throws Exception
	{
		String sql = "delete from ab01 where aab101 = ?";
		return this.executeUpdate(sql, this.get("aab101"))>0;
	}
	
	public boolean updateById() throws Exception 
	{
		StringBuilder str = new StringBuilder()
				.append("update ab01 ")
				.append("   set aab102 = ?,aab104 = ?,aab105 = ?,aab106 = ?,")
				.append("       aab107 = ?,aab108 = ?,aab109 = ?,aab110 = ?,aab111 = ?,")
				.append("       aab112 = ?,aab113 = ?")
				.append(" where aab101 = ?")
				;
		
		Object[] newState = {
				this.get("aab102"),
				this.get("aab104"),
				this.get("aab105"),
				this.get("aab106"),
				this.get("aab107"),
				this.get("aab108"),
				this.get("aab109"),
				this.get("aab110"),
				Tools.joinArray(this.get("aab111")),
				Tools.joinArray(this.get("aab112")),
				this.get("aab113"),
		};
		return this.batchUpdate(str.toString(), newState, this.get("aab101"));
	}
	
	public Map<String, String> findById() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append(" select a.aab102,a.aab103,a.aab104,a.aab105,a.aab106,")
				.append("        a.aab107,a.aab108,a.aab109,a.aab110,a.aab111,")
				.append("        a.aab112,a.aab113")
				.append("   from ab01 a")
				.append("  where a.aab101 = ?")
				;
		return this.queryForMap(str.toString(), this.get("aab101"));
	}
	
	/**
	 * 该方法用来执行多条件查询
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> query() throws Exception
	{
		//还原页面查询条件
		Object aab102 = this.get("qaab102");		//姓名 模糊查询
		Object aab103 = this.get("qaab103");		//编号
		Object aab105 = this.get("qaab105");		//性别
		Object aab106 = this.get("qaab106");		//民族
		Object baab104 = this.get("baab104");		//生日B(起始生日)
		Object eaab104 = this.get("eaab104");		//生日E(结束生日)
		
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select x.aab101,x.aab102,x.aab103,x.aab104,a.fvalue cnaab105,")
				.append("       b.fvalue cnaab106,x.aab108,x.aab109")
				.append("  from syscode a,syscode b,ab01 x")
				.append(" where x.aab105 = a.fcode and a.fname = 'aab105' and ")
				.append("       x.aab106 = b.fcode and b.fname = 'aab106'")
				;
		
		//参数列表
		List<Object> paramList = new ArrayList<Object>();
		//逐一判断查询条件是否录入,拼接AND条件
		if(this.isNotNull(aab102))
		{
			sql.append("and x.aab102 like ?");
			paramList.add("%"+aab102+"%");
		}
		if(this.isNotNull(aab103))
		{
			sql.append("and x.aab103 = ?");
			paramList.add(aab103);
		}
		if(this.isNotNull(aab105))
		{
			sql.append("and x.aab105 = ?");
			paramList.add(aab105);
		}
		if(this.isNotNull(aab106))
		{
			sql.append("and x.aab106 = ?");
			paramList.add(aab106);
		}
		if(this.isNotNull(baab104))
		{
			sql.append("and x.aab104 >= ?");
			paramList.add(baab104);
		}
		if(this.isNotNull(eaab104))
		{
			sql.append("and x.aab104 <= ?");
			paramList.add(eaab104);
		}
		return this.queryForList(sql.toString(), paramList.toArray());
	}
	
	
	/*
	 * 原始方法
	 * 
	public List<Map<String, String>> query() throws Exception 
	{
		
		
		//1.定义sql
		StringBuilder sql = new StringBuilder()
				.append("select aab101,aab102,aab103,aab104,aab105,")
				.append("       aab106,aab108,aab109")
				.append("  from ab01")
				;
		
		return this.queryForList(sql.toString());
		
		/**
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try
		{
			//1.定义sql
			StringBuilder sql = new StringBuilder()
					.append("select aab101,aab102,aab103,aab104,aab105,")
					.append("       aab106,aab108,aab109")
					.append("  from ab01")
					;
			
			pstm = DBUtils.prepareStatement(sql.toString());
			
			rs = pstm.executeQuery();
			//获取结果集描述对象
			ResultSetMetaData rsmd = rs.getMetaData();
			//查询的列数
			int count = rsmd.getColumnCount();
			//构造装载的list容器
			List<Map<String, String>> rows = new ArrayList<Map<String,String>>();
			//计算安全的初始容量
			int initSize = (int)(count/0.75) + 1;
			//定义实体用来存放数据库每一行的数据
			Map<String, String> ins = null;
			//循环结果集合
			while(rs.next())
			{
				//实例化当前行数据的承载容器
				ins = new HashMap<String, String>(initSize);
				//循环当前行数据的所有列
				for(int i = 1;i<=count;i++) {
					//完成列级映射
					ins.put(rsmd.getColumnLabel(i).toLowerCase(), rs.getString(i));
				}
				//向list中插入数据
				rows.add(ins);
			}
			//返回list数据
			return rows;
 		}
		finally 
		{
			DBUtils.close(rs);
			DBUtils.close(pstm);
		}
	}*/
	
	/**
	 * 删除Emp表格
	 * @return
	 * @throws Exception
	 */
	public boolean delEmp() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("delete from ab01 where aab101 = ?")
				;
		/*
		 * 以下方法可以进一步抽象到support中
		 * */
		/*String[] idlist = null;
		if(dto.get("idlist") instanceof String[]) {
			idlist = (String[])dto.get("idlist");
			return this.batchUpdate(sql.toString(), idlist);
		}
		else {
			String id = (String)dto.get("idlist");
			return this.executeUpdate(sql.toString(), id)>0;
		}*/
		String[] idlist = this.getIdList("idlist");
		
		return this.batchUpdate(sql.toString(), idlist);
	}
	
	
	public boolean addEmp() throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql = new StringBuilder()
				.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
    			.append("                 aab107,aab108,aab109,aab110,aab111,")
    			.append("                 aab112,aab113)")
    			.append("          values(?,?,?,?,?,")
    			.append("                 ?,?,?,?,?,")
    			.append("                 ?,?)")
				;
		
		//2.编写参数数组
		String aab103 = Tools.getEmpNumber();
		
		Object[] argsObjects = {
				this.get("aab102"),
				aab103,
				//this.dto.get("aab103"),
				//这个方法需要调用Tools里面的方法自动生成,
				this.get("aab104"),
				this.get("aab105"),
				this.get("aab106"),
				this.get("aab107"),
				this.get("aab108"),
				this.get("aab109"),
				this.get("aab110"),
				//这两个为可能为数组,因此我们向数据库中插入数据的时候需要进行一次类型转换
				Tools.joinArray(this.get("aab111")),
				Tools.joinArray(this.get("aab112")),
				//this.dto.get("aab111"),
				//this.dto.get("aab112"),
				this.get("aab113")
		};
		
		//同时为了在页面中显示我们需要的empNumber,我们需要重新将其赋值到dto里面
		this.put("aab103", aab103);
		
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}

}




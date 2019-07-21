package com.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.ast.ThisReference;

import com.services.JdbcServicesSupport;

public class Af01ServicesImpl extends JdbcServicesSupport
{
	/**
	 * 插入一条聊天信息      
	 * aad104  1表示用户已删除聊天记录，0表示用户未删除聊天记录
	 * @return boolean
	 * @throws Exception
	 */
	public boolean addComplain() throws Exception
	{
		//编写SQL语句--向数据库插入一条举报信息
		StringBuilder sql = new StringBuilder()
				.append("insert into af01(aab101, aaf103, aaf104, aaf105, aaf106, ")
				.append("                 aaf107, aaf109)")
    			.append("          values(?, ?, ?, ?, ?,")
    			.append("                 '0', current_timestamp)")
				;
		Object[] argsObjects = {
				this.get("aab101"),
				this.get("aaf103"),
				this.get("aaf104"),
				this.get("aaf105"),
				this.get("aaf106")
		};
		//执行插入SQL语句
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	/**
	 * 管理员查询所有关于用户的举报信息
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findUserComp() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select f.aaf101, b.aab102 complainer, b1.aab102 caller, sc.fvalue reason, ")
				.append("	    f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103,f.aaf107,f.aaf110 ")
				.append("  from ab01 b, af01 f, ab01 b1, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and b1.aab101 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '1'")
				;
		
		Object[] args = {this.get("aaf101")};
		
		if(this.get("aaf101")!=null) {
			str.append(" and aaf101 = ?");
			return this.queryForList(str.toString(),args);
		}else {
			return this.queryForList(str.toString());
		}
		
	}
	
	/**
	 * 管理员查询所有关于帖子的举报信息
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findTieComp() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select f.aaf101, b.aab102 complainer, c.aac102 title, sc.fvalue reason, ")
				.append("	    f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103,f.aaf107,f.aaf110, ")
				.append("       c.aac101,c.aac104,c.aac106,c.aac108,c.aac109 imgpath,b.aab101 ")
				.append("  from ab01 b, af01 f, ac01 c, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and c.aac101 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '2' ")
				;
		
		Object[] args = {this.get("aaf101")};
		
		if(this.get("aaf101")!=null) {
			str.append(" and aaf101 = ?");
			return this.queryForList(str.toString(),args);
		}else {
			return this.queryForList(str.toString());
		}
		
	}
	
	/**
	 * 管理员查询所有关于留言的举报信息
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findCommentComp() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select f.aaf101, b.aab102 complainer, c2.aac203 comment, sc.fvalue reason, ")
				.append("       f.aaf106, sc1.fvalue hstatus, f.aaf108, f.aaf109, f.aaf103,f.aaf107,f.aaf110,c2.aac201  ")
				.append("  from ab01 b, af01 f, ac02 c2, syscode sc, syscode sc1")
				.append(" where b.aab101 = f.aab101")
				.append("   and c2.aac201 = f.aaf104")
				.append("   and f.aaf105 = sc.fcode")
				.append("   and f.aaf107 = sc1.fcode")
				.append("   and sc.fname = 'aaf105'")
				.append("   and sc1.fname = 'aaf107'")
				.append("   and aaf103 = '3'")		
				;
		
		Object[] args = {this.get("aaf101")};
		
		if(this.get("aaf101")!=null) {
			str.append(" and aaf101 = ?");
			return this.queryForList(str.toString(),args);
		}else {
			return this.queryForList(str.toString());
		}
		
	}
	
	
	public Map<String,String> findById() throws Exception
	{
		String sql1 = "select aaf103 from af01 where aaf101 = ?";
		Object[] args1 = {this.get("aaf101")};		
		Map<String, String> ins = this.queryForMap(sql1, args1);
		
		if(ins.get("aaf103").equals("1"))
		{
			return findUserComp().get(0);
		}
		
		if(ins.get("aaf103").equals("2")) 
		{
			return findTieComp().get(0);
		}
		
		if(ins.get("aaf103").equals("3")) 
		{
			return findCommentComp().get(0);
		}	
		
		return null;
 	}
	
	
	public List<Map<String,String>> query() throws Exception
	{
		List<Map<String,String>> result = new ArrayList<>();
		for(Map<String,String> map : findUserComp())
		{
			result.add(map);
		}
		for(Map<String,String> map : findTieComp())
		{
			result.add(map);
		}
		for(Map<String,String> map : findCommentComp())
		{
			result.add(map);
		}
		return result;
	}
	
	/**
	 * 管理员处理举报信息——举报用户
	 * @return
	 * @throws Exception
	 */
	public boolean handleUserComplain() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update ab01 ")
				.append("   set aab113 = aab113 - 10")
				.append(" where aab101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), this.get("aab101")) > 0;
	}
	
	/**
	 * 管理员处理举报信息——举报帖子
	 * @return
	 * @throws Exception
	 */
	public boolean handleTieComplain() throws Exception
	{
		//删除帖子和对应的留言
		String sql = "update ac01 set is_deleted = 1 where aac101 = ?";
		String sql2 = "update ac02 set is_deleted = 1 where aac101 = ?";
		Object[] args = {this.get("aac101")};
		this.batchUpdate(sql2, args);
		this.batchUpdate(sql, args);
		this.executeTransaction();
		//更改举报处理表
		boolean temp = this.finishHandle("该帖子已被删除");
		this.put("aaf101", null);
		return temp;	
	}
	
	/**
	 * 管理员处理举报信息——举报留言
	 * @return
	 * @throws Exception
	 */
	public boolean handleCommentComplain() throws Exception
	{
		String sql = "update ac02 set is_deleted = 1 where aac201 = ?";
		this.executeUpdate(sql, this.get("aac201"));
		
		boolean temp = this.finishHandle("该留言已被删除");
		this.put("aaf101", null);
		
		return temp;
	}
	
	/**
	 * 管理员完成处理举报操作
	 * @return
	 * @throws Exception
	 */
	public boolean finishHandle(String msg) throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("update af01 ")
				.append("   set aaf107 = '1', aaf108 = current_timestamp,aaf110=?")
				.append(" where aaf101 = ?")
				;
		
		return this.executeUpdate(sql.toString(), msg,this.get("aaf101")) > 0;
	}
	
	public boolean updateComplainState() throws Exception
	{
		boolean temp = this.finishHandle("经过管理员审核,该举报无效,举报对象正常");
		this.put("aaf101", null);
		return temp;
	}
}

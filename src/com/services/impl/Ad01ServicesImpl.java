package com.services.impl;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.services.JdbcServicesSupport;
import com.system.talk.Users;

public class Ad01ServicesImpl extends JdbcServicesSupport
{
	/**
	 * 插入一条聊天信息      
	 * aad104  1表示用户已删除聊天记录，0表示用户未删除聊天记录
	 * @return boolean
	 * @throws Exception
	 */
	public boolean addChat() throws Exception
	{
		//编写SQL语句--向数据库插入一条新聊天记录
		StringBuilder sql = new StringBuilder()
				.append("insert into ad01(aab101,aac101,aad102,aad103,aad104,")
				.append("                 aad105,aad106)")
    			.append("          values(?, ?, '', current_timestamp, 0, ")
    			.append("                 current_timestamp, 0)")
				;
		Object[] argsObjects = {
				this.get("aab101"),
				this.get("aac101")
		};
		//执行插入SQL语句
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	public Map<String, String> FindChat() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select b.aab101 maab101, b.aab102 maab102, b1.aab101 naab101, b1.aab102 naab102, d.aad101, c.aac101, b.aab101")
				.append("  from ac01 c, ab01 b, ab01 b1, ad01 d")
				.append(" where c.aab101 = b1.aab101")
				.append("   and d.aac101 = c.aac101")
				.append("   and d.aab101 = b.aab101")
				.append("   and b.aab101 = ?")
				.append("   and c.aac101 = ?")
				;
		Object[] argsObjects = {
				this.get("aab101"),
				this.get("aac101")
		};
		//执行查询SQL语句
		return this.queryForMap(sql.toString(), argsObjects);
		
	}
	
	/**
	 * 回帖者通过聊天信息流水号删除聊天信息（隐式删除，更改显示标记）
	 * @return boolean
	 * @throws Exception
	 */
	public boolean delSenderChat() throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql = new StringBuilder()
				.append("update ad01 ")
				.append("   set aad104 = 1")
				.append(" where aad101 = ?")
				;
		
		Object[] argsObjects = {
				this.get("aad101")
		};
		
		
		String name= URLDecoder.decode((String)this.get("aab102"),"UTF-8");
		Users.delState.put((String)this.get("aad101"), name);
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	/**
	 * 帖主通过聊天信息流水号删除聊天信息（隐式删除，更改显示标记）
	 * @return boolean
	 * @throws Exception
	 */
	public boolean delAcceptChat() throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql = new StringBuilder()
				.append("update ad01 ")
				.append("   set aad106 = 1")
				.append(" where aad101 = ?")
				;
		
		Object[] argsObjects = {
				this.get("aad101")
		};

		String name= URLDecoder.decode((String)this.get("aab102"),"UTF-8");
		Users.delState.put((String)this.get("aad101"), name);
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	
	
	public boolean unDel(String aad101) throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql = new StringBuilder()
				.append("update ad01 ")
				.append("   set aad104 = 0, aad106 = 0")
				.append(" where aad101 = ?")
				;
		
		Object[] argsObjects = {
				aad101
		};
		
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
	/**
	 * 通过聊天信息流水号查询到某一个帖子
	 * @return Map<String, String>
	 * @throws Exception
	 */
	public Map<String, String> findById() throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select d.aac101,b.aab101 maab101, b.aab102 maab102,b1.aab101 naab101, b1.aab102 naab102, d.aad101")
				.append("  from ad01 d, ab01 b, ab01 b1, ac01 c")
				.append(" where c.aab101 = b1.aab101")
				.append("   and c.aac101 = d.aac101")
				.append("   and d.aab101 = b.aab101")
				.append("   and d.aad101 = ?")
				;
		Map<String, String> map = this.queryForMap(str.toString(), this.get("aad101"));
		map.put("aab101", (String)this.get("aab101"));
		return map;
	}
	
	/**
	 * 通过用户流水号查询到其所有聊天记录
	 * @return List<Map<String,String>>
	 * @throws Exception
	 */
	public List<Map<String,String>> findByUserId(String aab101) throws Exception
	{
		StringBuilder str = new StringBuilder()
				.append("select d.aad101, d.aac101, d.aad105, b.aab102, 1 as 'sign'")
				.append("  from ab01 b, ad01 d, ac01 c")
				.append(" where c.aab101 = b.aab101")
				.append("   and d.aac101 = c.aac101")
				.append("   and d.aad104 = 0")
				.append("   and d.aab101 = ?")
				;
		return this.queryForList(str.toString(), aab101);
	}
	
	/**
	 * 通过用户流水号查询到其发布的帖子，再查询到所有在其帖子下回复的有关聊天信息
	 * @return List<Map<String, String>>
	 * @throws Exception
	 */
	public List<Map<String, String>> findByUserId_Tie(String aab101) throws Exception
	{
		//定义SQL主体
		StringBuilder sql = new StringBuilder()
				.append("select d.aad101, d.aab101, d.aac101, d.aad105, 2 as 'sign',")
				.append("       b1.aab102 ")
				.append("  from ab01 b, ac01 c, ad01 d, ab01 b1")
				.append(" where d.aab101 = b1.aab101")
				.append("   and c.aab101 = b.aab101")
				.append("   and d.aac101 = c.aac101")
				.append("   and d.aad106 = 0 ")
				.append("   and b.aab101 = ? ")
				;
		
		return this.queryForList(sql.toString(), aab101);
	}

	public List<Map<String,String>> query(String aab101) throws Exception
	{
		List<Map<String,String>> result = new ArrayList<>();
		for(Map<String,String> map : findByUserId(aab101))
		{
			result.add(map);
		}
		for(Map<String,String> map : findByUserId_Tie(aab101))
		{
			result.add(map);
		}
		return result;
	}
	/**
	 * 保存当前聊天的最后一条信息，用于聊天界面显示
	 * @return boolean
	 * @throws Exception
	 */
	public boolean updateChat(String aad101, String aad102) throws Exception
	{
		//1.编写SQL语句
		StringBuilder sql = new StringBuilder()
				.append("update ad01 ")
				.append("   set aad102 = ?, ")
				.append("       aad105 = current_timestamp")
				.append(" where aad101 = ?")
				;
		
		Object[] argsObjects = {
				aad102, 
				aad101
		};
		
		return this.executeUpdate(sql.toString(), argsObjects)>0;
	}
}

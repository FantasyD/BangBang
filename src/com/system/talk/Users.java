package com.system.talk;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//所有用户
public class Users 
{
	//保存用户
	public static Map<String, Server> user = new HashMap<String, Server>();

	//保存1对1用户组__消息缓存队列
	public static Map<String, List<String>> usertalk = new HashMap<>();
	
	//将用户与记录服务器绑定
	public static Map<String, RecordServer> userRecord = new HashMap<String, RecordServer>();
	
	//保存每组聊天的更新状态
	public static Map<String, List<String>> mailbox = new HashMap<>();
	
	//保存聊天记录删除状态
	public static Map<String, String> delState = new HashMap<>();
}
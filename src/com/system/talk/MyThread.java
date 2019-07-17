package com.system.talk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

//loadOnStartup标记为Servlet不是为了其被访问，而是为了便于伴随Tomcat一起启动
@WebServlet(urlPatterns ="/MyThread",loadOnStartup=1)
public class MyThread extends HttpServlet implements Runnable{
	public void init(ServletConfig config)
	{
		new Thread(this).start();
	}

	@Override
	public void run() {
		Map<String, List<String>> map = null;
		Set<Entry<String, List<String>>> entrySet = null;
		while (true) {
			try {
				map = Users.mailbox;
				entrySet = map.entrySet();
				List<String> list = null;
				List<String> backup_list = null;
				for(Entry<String, List<String>> li : entrySet)
				{
					list = li.getValue();
					if(list.size() != 0)
					{
						//System.out.println(list.toString());
						if(!(Users.userRecord.get(li.getKey()) == null) && Users.userRecord.get(li.getKey()).isOpen())
						{
							String str = list.toString().replace("[", "").replace("]", "");
							Users.userRecord.get(li.getKey()).session.getBasicRemote().sendText(str);
							
							backup_list = Users.mailbox_backup.get(li.getKey());
							if(backup_list == null)
							{
								Users.mailbox_backup.put(li.getKey(), new ArrayList<String>());
								backup_list = Users.mailbox_backup.get(li.getKey());
							}
							for(String s : list)
							{
								backup_list.add(s);
							}
							list.clear();
						}
					}
				}
				Thread.sleep(2000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
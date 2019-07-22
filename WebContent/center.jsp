<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
<script type="text/javascript" src="https://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>

	
	<link href="css/style1.css" rel="stylesheet">
<script type="text/javascript">
var this_aab101 = "${sessionScope.userId }";
var this_aab102 = "${sessionScope.userName }";
var path = "<%=path%>/";
</script>

<script type="text/javascript" src="js/chat_action.js"></script>
</head>
<body class="box" onload="LoadPage()">
  <div class="centerit">
	  <div class="chat-container">
	    <aside class="aside"> 
	      <div class="top-bar">
	        <div class="menu-burger-container">
	          <div class="menu-burger"></div>
	        </div>
	        <div class="new-conversation">我的聊天</div>
	      </div>
	      <div class="conversations">
	      
	      <h3 align="center" class = "sender_h">我回复别人的</h3>
	      <div id="record1"></div>
		  
		  <h3 align="center" class = "accept_h">别人回复我的</h3>
		  <div id="record2"></div>
	    </div>
	
	    </aside>
	    <main  id ="mainbody"></main>
	  </div>
  </div>
</body>
</html>

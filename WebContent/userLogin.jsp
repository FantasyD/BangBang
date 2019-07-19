<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>


<style type="text/css">
	td{
	height: 30px;
	}
	msg{
	color: red;
	}
	form {
	width: 160px;
	}
</style>
</head>
<body>
${msg }
<br>	
<br>	
<form id="myform" role="form" method="post" class="center-block">
	<div class="form-group">
	<label>用户名</label>
	<input type="text" class="form-control" name="userID" placeholder="请输入学号或邮箱" required="required">	
	</div>
	<div class="form-group">
	<label>密码</label>
	<input id="pwd" type="password" class="form-control" name="aab103" placeholder="请输入密码" required="required">
	<a href="findPwd.jsp">忘记密码</a>
	</div>
	<div>
	<button class="btn-btn-default" type="submit" name="next" formaction="<%=path %>/user_userLogin.html">登陆</button>
	<button class="btn-btn-default" type="submit" name="next" formaction="<%=path %>/register.jsp" formnovalidate="formnovalidate">注册</button>
	</div>
</form>		
</body>
</html>
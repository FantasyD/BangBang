<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>用户注册</title>
<style type="text/css">
	td{
		height: 30px;
	}
	msg{
		color:red;
	}
</style>
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>  
<script type="text/javascript" src="js/sendEmail.js"></script>
<script type="text/javascript">
	function register() 
	{
		
		var vform=document.getElementById("myform");
		var username=document.getElementById("userName").value;
		var pwd=document.getElementById("pwd").value;
		var num=document.getElementById("num").value;
		var reg1=/^[\u4e00-\u9fa5_a-zA-Z0-9_]{1,15}$/;
		var reg2=/^\w{6,18}$/;
	
			if (reg1.test(username)&&typeof(username)!="undefined") 
			{
				//<!--alert(reg1.test(username));
				if (reg2.test(pwd)&&typeof(pwd)!="undefined") 
				{
						vform.action= "<%=path %>/user_register.html";
						vform.submit();
				}
				else 
				{
					alert("密码不合法，密码由6-18位的数字、字母、下划线组成!");
				}
			}
			else 
			{
				alert("用户名不合法，用户名由1-15位的中文、字母、数字以及下划线组成!");
			}
	}
</script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform"  method="post">
<table border="1" align="center" width="35%">
	<caption>
		用户注册
		<hr width="160">
	</caption>
	<tr>
		<td>用户名</td>
		<td>
			<e:text id="userName" name="aab102" required="true" autofocus="true"/>
		</td>
	</tr>
	<tr>
		<td>密码</td>
		<td>
			<e:text id="pwd" name="aab103" required="true" />
		</td>
	</tr>
	<tr>
		<td>姓名</td>
		<td>
			<e:text name="aab104" required="true" />
		</td>
	</tr>
	<tr>
		<td>学校</td>
		<td>
			<e:text name="aab110" required="true" />
		</td>
	</tr>
	<tr>
		<td>学号</td>
		<td>
			<e:text name="aab107" required="true" />
		</td>
	</tr>
	<tr>
		<td>邮箱</td>
		<td>
			<e:email id="mail" name="aab108" required="true" />
		</td>
	</tr>
	<tr>
		<td>验证码</td>
		<td>
			<e:text id="num" name="ver" required="true" placeholder="请输入邮箱验证码"/>
			<input name="next" type="button" value="发送验证码" onclick="SendEmail(1, '<%=path %>')" formnovalidate="formnovalidate">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" name="next" value="注册" onclick="register()" >
		</td>
	</tr>
</table>
</form>	
		<div align="center">
		<a href="userLogin.jsp">
		<button>返回</button>
		</a>
		</div>	
</body>
</html>
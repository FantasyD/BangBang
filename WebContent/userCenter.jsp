<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>个人信息中心</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
${msg }	
<br>
<br>

<form method="post" align="center">
	<div class="form-group">
	<label>用户名</label>
	<br>
	<e:text name="aab102" value="${ins.aab102 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>姓名</label>
	<br>
	<e:text name="aab104" value="${ins.aab104 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>性别</label>
	<br>
	<e:text name="aab105" value="${ins.aab105 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>学号</label>
	<br>
	<e:text name="aab107" value="${ins.aab107 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>邮箱</label>
	<br>
	<e:text name="aab108" value="${ins.aab108 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>民族</label>
	<br>
	<e:text name="aab109" value="${ins.aab109 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>学校</label>
	<br>
	<e:text name="aab110" value="${ins.aab110 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>手机号</label>
	<br>
	<e:text name="aab111" value="${ins.aab111 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>用户标签</label>
	<br>
	<e:text name="aab112" value="${ins.aab112 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>用户信誉分</label>
	<br>
	<e:text name="aab113" value="${ins.aab113 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>用户签名</label>
	<br>
	<e:text name="aab114" value="${ins.aab114 }" readonly="true"/>
	</div>
	<div class="form-group">
	<label>头像</label>
	<br>
	<e:text name="aab115" value="${ins.aab115 }" readonly="true"/>
	</div>
	<div>
	<input type="submit" name="next" value="修改个人信息"
			formaction="<%=path%>/user_toModify.html?aab101=${sessionScope.userID}" formnovalidate="formnovalidate">
	<input type="submit" name="next" value="修改密码"
			formaction="<%=path%>/modifyPwd.jsp" formnovalidate="formnovalidate">
	<input type="submit" name="next" value="修改注册邮箱"
			formaction="<%=path%>/modifyEmail.jsp" formnovalidate="formnovalidate">
	</div>
</form>
	<div>
		<a href="userIndex.jsp">
		<button>返回</button>
		</a>
	</div>
</body>
</html>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>修改个人信息</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<br>
<br>

<form method="post" align="center" enctype="multipart/form-data"> 
	<div class="form-group">
	<label>用户名</label>
	<br>
	<e:text name="aab102" defval="${ins.aab102 }"/>
	</div>
	<div class="form-group">
	<label>姓名</label>
	<br>
	<e:text name="aab104" readonly="true" defval="${ins.aab104 }"/>
	</div>
	<div class="form-group">
	<label>性别</label>
	<br>
	<e:radio name="aab105" value="男:1,女:2,秀吉:3" defval="3"/>
	</div>
	<div class="form-group">
	<label>学号</label>
	<br>
	<e:text name="aab107"  readonly="true" defval="${ins.aab107 }"/>
	</div>
	<div class="form-group">
	<label>民族</label>
	<br>
	<e:text name="aab109" defval="${ins.aab109 }"/>
	</div>
	<div class="form-group">
	<label>学校</label>
	<br>
	<e:text name="aab110"  readonly="true" defval="${ins.aab110 }"/>
	</div>
	<div class="form-group">
	<label>手机号</label>
	<br>
	<e:text name="aab111" defval="${ins.aab111 }"/>
	</div>
	<div class="form-group">
	<label>用户标签</label>
	<br>
	<e:text name="aab112" defval="${ins.aab112 }"/>
	</div>
	<div class="form-group">
	<label>用户签名</label>
	<br>
	<e:text name="aab114" defval="${ins.aab114 }"/>
	</div>
	<div class="form-group">
	<label>头像</label>
	<br>
	<input type="file" name="photo"/>
	<e:text name="aab115" defval="${ins.aab115 }"/>
	</div>
	<input type="hidden" name="aab101" value="${sessionScope.userID }">
	<div>
	<input type="submit" name="next" value="确定提交"
			formaction="<%=path%>/user_modifyUser.html">
	</div>	
</form>
</body>
</html>
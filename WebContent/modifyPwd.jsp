<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
function comfirmPwd()
{
	
}
</script>
</head>
<body>
<br>
<br>

<form method="post" align="center" enctype="multipart/form-data"> 
	<div class="form-group">
	<label>原来的密码：</label>
	<br>
	<e:text name="aab103"/>
	</div>
	<div class="form-group">
	<label>新的密码：</label>
	<br>
	<e:text name="Naab103" id="newPwd"/>
	</div>
	<div class="form-group">
	<label>确认新的密码：</label>
	<br>
	<e:text name="Caab103" id="comfirmPwd"/>
	</div>
	<input id="msg">
	<input type="hidden" name="aab101" value="${sessionScope.userID }">
	<div>
	<input type="submit" name="next" value="确定提交"
			formaction="<%=path%>/user_modifyPwd.html">
	</div>	
</form>
</body>
</html>
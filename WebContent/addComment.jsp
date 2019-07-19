<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri = "http://org.wangxg/jsp/extl" prefix="e"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>留言</title>
</head>
<body>
<div style="text-align: center">
<form action="<%=path%>/comment_addComment.html" method = "post">
	<br>
	帖子留言:
	<br>
	<e:textarea rows = "5" cols = "45" required="true" name = "aac203" />
	<br>
	<input type="hidden" name = "type" value = "${type }">
	<input type="submit" name="next" class="btn btn-default" value="添加留言"
					formaction= "<%=path%>/comment_addComment.html">
	<br>
	<input type="submit" name="next" class="btn btn-default" value="返回"
					formaction= "<%=path%>/tiezi_findByIdTiezi.html"
					formnovalidate="formnovalidate">

<input type="hidden" name="aac101" value="${aac101 }">
<input type="hidden" name="aab101" value="${aab101 }">

	
<input type="hidden" name="aah102" value="1">
<input type="hidden" name="aah103" value="留言发布">
<input type="hidden" name="aah104" value="有人回复了您的帖子">
</form>
</div>
</body>
</html>
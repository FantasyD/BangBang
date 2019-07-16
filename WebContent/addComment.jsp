<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri = "http://org.wangxg/jsp/extl" prefix="e"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>аТят</title>
</head>
<body>
<div style="text-align: center">
<form action="<%=path%>/comment_addComment.html" method = "post">
	<br>
	лШвсаТят:
	<br>
	<e:textarea rows = "5" cols = "45" required="true" name = "aac203" />
	<br>
	<input type="hidden" name = "type" value = "${type }">
	<input type="submit" name="next" class="btn btn-default" value="лМ╪саТят"
					formaction= "<%=path%>/comment_addComment.html">
	<br>
	<input type="submit" name="next" class="btn btn-default" value="╥╣╩ь"
					formaction= "<%=path%>/tiezi_findByIdTiezi.html"
					formnovalidate="formnovalidate">

<input type="hidden" name="aac101" value="${aac101 }">
<input type="hidden" name="aab101" value="${aab101 }">
</form>
</div>
</body>
</html>
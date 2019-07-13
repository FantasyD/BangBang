<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ö÷Ò³</title>
</head>
<body>
<br>
<br>
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post">
		<input type = "submit" name = "next" value = "²é¿´Ìû×Ó">
	</form>	
<br>
<br>
	<form action = "<%=path%>/tiezi_queryTieziById.html" method = "post">
		<input type="hidden" name="aab101" value="2">
		<input type = "submit" name = "next" value = "ÎÒµÄÌû×Ó">
	</form>
</body>
</html>
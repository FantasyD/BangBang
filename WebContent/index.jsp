<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Ö÷Ò³</title>
</head>
<body>
${msg }
<br>
<br>
<div style="text-align:center">
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post">
		<input type = "submit" name = "next"  value = "²é¿´Ìû×Ó"  class="btn btn-default" >
	</form>	
<br>
<br>
	<form action = "<%=path%>/tiezi_queryTieziById.html" method = "post">
		<input type="hidden" name="aab101" value="2">
		<input type = "submit" name = "next" value = "ÎÒµÄÌû×Ó"   class="btn btn-default"  >
	</form>
</body>
</div>
</html>
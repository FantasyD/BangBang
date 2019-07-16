<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
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
	<form action = "<%=path%>/tiezi_recommendTiezi.html" method = "post">
		<e:hidden name="aab101" value="2"/>
		<e:hidden name="pageNum" value="1"/>
		<input type = "submit" name = "next"  value = "²é¿´Ìû×Ó"  class="btn btn-default" >
	</form>	
<br>
<br>
	<form action = "<%=path%>/tiezi_queryTieziById.html" method = "post">
		<input type="hidden" name="aab101" value="2">
		<input type = "submit" name = "next" value = "ÎÒµÄÌû×Ó"   class="btn btn-default"  >
	</form>
<br>
<br>
	<form action = "<%=path%>/placement_queryPlacement.html" method = "post">
		<input type="hidden" name="aab101" value="2">
		<input type = "submit" name = "next" value = "¹ÜÀíÔ±ÖÃ¶¥ÉóºËÒ³Ãæ"   class="btn btn-default"  >
	</form>
<br>
<br>
	<form action = "<%=path%>/placement_queryPlacementByState.html" method = "post">
		<input type="hidden" name="aab101" value="2">
		<input type = "submit" name = "next" value = "ÖÃ¶¥Ìû×ÓÒ³"   class="btn btn-default"  >
	</form>
<br>
</body>
</div>
</html>
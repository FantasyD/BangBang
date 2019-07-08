<%@ page language="java" pageEncoding="GBK"%>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
${ins }
<body>
	Ìû×Ó±àºÅ:${ins.aac101 }
	<br>
	Ìû×Ó±êÌâ:${ins.aac102 }
	<br>
	·¢ÌûÈË:${ins.cnaab102 }
	<br>
	Ìû×ÓÀàÐÍ:${ins.cnaac103 }
	<br>
	Ìû×ÓÄÚÈÝ:${ins.aac104 }
	<br>
	Ìû×Ó¼Û¸ñ:${ins.aac105 }
	<br>
	Ìû×Ó±êÇ©:${ins.aac106 }
	<br>
	Ìû×ÓÍ¼Æ¬:
	<img src = "${ins.imgpath }">
	
	<form action = "<%=path%>/queryTiezi.html" method = "post">
		<input type = "submit" name = "next" value = "·µ»Ø">
	</form>	
</body>
</html>
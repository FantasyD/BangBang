<%@ page language="java" pageEncoding="GBK"%>
<%@taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%String path=request.getContextPath(); 
		session.setAttribute("userId", "3");
		session.setAttribute("userName","蒙多");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>弹出层</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></link>
<script src="<%=path %>/js/jquery.min.js" type="text/javascript"></script>
<style>
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 10%;
	left: 10%;
	width: 80%;
	height: 80%;
	border: 16px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

.white_content_small {
	display: none;
	position: absolute;
	top: 20%;
	left: 30%;
	width: 40%;
	height: 50%;
	border: 16px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
<script type="text/javascript">
//弹出隐藏层
function ShowDiv(show_div,bg_div){
		 document.getElementById(show_div).style.display='block';
 		document.getElementById(bg_div).style.display='block' ;
		 var bgdiv = document.getElementById(bg_div);
 		bgdiv.style.width = document.body.scrollWidth; 
 		// bgdiv.style.height = $(document).height();
		 $("#"+bg_div).height($(document).height());
};
//关闭弹出层
function CloseDiv(show_div,bg_div)
{
 		document.getElementById(show_div).style.display='none';
 		document.getElementById(bg_div).style.display='none';
};
</script>
</head>
<body>
	<input id="Button1" type="button" value="点击弹出层"
		onclick="ShowDiv('MyDiv','fade')" class="btn btn-default" />
	<form action="<%=path %>/group_findGroup.html" method="post">
		<input type="submit" name="aae101" value="6" class="btn btn-default" />
	</form>
	<form action="<%=path %>/email_getEmail.html" method="post">
		<input type="submit" name="aab101" value="${userId }" class="btn btn-default" />
	</form>
	
	
	<!--弹出层时背景层DIV-->
	<div id="fade" class="black_overlay"></div>
	<div id="MyDiv" class="white_content">
		<div style="text-align: left; cursor: default; height: 40px;">
			<form method="post">
				<table border="1" align="center" width="50%">
					<caption>
						群组信息
						<hr width="160px">
					</caption>
					<tr>
						<td>群组名:</td>
						<td><e:text name="aae102" required="true" autofocus="true"
								maxlength="30" /></td>
					</tr>
					<tr>
						<td>群组签名:</td>
						<td><e:text name="aae103" maxlength="50" /></td>
					</tr>
					<tr>
						<td>群组详细描述:</td>
						<td><e:textarea rows="10" cols="25" name="aae107" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							name="next" value="新建"  class="btn btn-default"  formaction="<%=path %>/group_newGroup.html"/>
							<button onclick="CloseDiv('MyDiv','fade')" class="btn btn-default">取消</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
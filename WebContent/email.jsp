<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>站内邮箱</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	/**
	*			点击邮件标题后改变邮件的颜色
	*			点击邮件标题后改变邮件状态为已读
	*/
	function updateEmail(aah101)
	{
			var aLink=document.getElementById(aah101+"a");
			aLink.style="color:#777";
				$.ajax({
				    type: "POST",
				    url: "<%=path%>/email_updateEmail.html",
					data : {'aah101' : aah101},
					/* dataType: "json", */
					/* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
					success : function(data) {
						${msg}
					},
					error : function(data) {
					},
				});
	}
</script>
</head>
<body>
${userId }
	<div class="col-md-offset-5">
		<c:forEach items="${rows }" var="row" varStatus="vs">
			<div class="accordion-heading">
				<h4>
					<a class="accordion-toggle" href="#" data-toggle="collapse"
						data-target="#${row.aah101 }"
						style="color:${row.aah106==0?'#ff0000':'#777' }"
						onclick="updateEmail('${row.aah101}')" id="${row.aah101 }a">
						${row.aah103 } </a>
				</h4>
			</div>
			<div id="${row.aah101 }" class="collapse navbar-collapse">
				<p>${row.aah104 }</p>
				<c:choose>
					<c:when test="${row.aah102==1 }">
						<a href="${row.aah202 }">点此查看</a>
					</c:when>
					<c:when test="${row.aah102==2 }">
						<a href="${row.aah202 }" class="btn btn-default">同意</a>
						<a href="${row.aah203 }" class="btn btn-default">拒绝</a>
					</c:when>
				</c:choose>
			</div>
		</c:forEach>
	</div>

</body>
</html>
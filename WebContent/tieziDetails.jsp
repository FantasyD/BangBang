<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>帖子详情</title>
<script>
	function onDel(vaac101)
	{
		var vform = document.getElementById("aform");
		vform.action="<%=path%>/comment_delByIdComment.html?aac201="+vaac101;
		vform.submit();
	} 
	
	function goback()
	{
		var vtype = document.getElementById("type").value;
		var vform = document.getElementById("returnForm");
		if(vtype == 1)
		{
			vform.action="<%=path%>/tiezi_queryTiezi.html";
			vform.submit();
		}
		else if(vtype == 2)
		{
			vform.action="<%=path%>/tiezi_queryTieziById.html";
			vform.submit();
		}
		else if(vtype == 3)
		{
			vform.action="<%=path%>/placement_queryPlacementByState.html";
			vform.submit();
		}
		else if(vtype == 4)
		{
			vform.action="<%=path%>/placement_queryPlacement.html";
			vform.submit();
		}
	}
</script>
</head>
<body>
<input type="hidden" name="type" value="${type }" id = "type">
<div style="text-align:center">
	帖子编号:${ins.aac101 }
	<br>
	帖子标题:${ins.aac102 }
	<br>
	发帖人:${ins.cnaab102 }
	<br>
	帖子类型:${ins.cnaac103 }
	<br>
	帖子内容:${ins.aac104 }
	<br>
	帖子价格:${ins.aac105 }
	<br>
	帖子标签:${ins.aac106 }
	<br>
	帖子图片:
	<c:if test="${ins.imgpath != null }">
		<img src = "${ins.imgpath }" style = "width:300px;height:150px">
	</c:if>
	<c:if test="${ins.imgpath == null }">
		本帖暂无图片
	</c:if>

	<br><br><br>
	
	<form id = "aform" method="post">
	<input type="hidden" name="aac101" value="${aac101 }">
	<input type="hidden" name="aab101" value="${aab101 }">
		<c:if test="${rows!=null }">
			<!-- 以下为留言区域,展示所有用户对该帖子发表的留言 -->
			<table border="1" width="95%" align="center" class="table table-striped">
				<tr>
				    <td>序号</td>
				    <td>留言用户</td>
				    <td>留言内容</td>
				    <td>留言日期</td>
				    <c:if test="${ins.aab101 == aab101 }">
						<td></td>
					</c:if>
			  	</tr>
			  	
			   	<c:choose>
			     <c:when test="${rows!=null }">
			         <!-- 显示实际查询到的数据 -->
				     <c:forEach items="${rows }" var="comment" varStatus="vs" >
			    	   	  <tr>
						    <td>${vs.count }</td>
							<td>${comment.cnaab102 }</td>
							<td>${comment.aac203 }</td>
							<td>${comment.aac202 }</td>
							<c:if test="${ins.aab101 == aab101 }">
								<td>
	
									<a href="#" onclick="onDel('${comment.aac201}')">删除</a>
								
								</td>
							</c:if>
						  </tr>
				      </c:forEach>
			     </c:when>
			   </c:choose>
			</table>
		</c:if>
	</form>
	<c:if test="${rows == null }"> 本帖暂无留言</c:if>
	
	<br>
	<form action="<%=path %>/addComment.jsp?type=${type}&" method = "post">
		<input type = "submit" name = "next" class="btn btn-default" value = "留言">
		<input type="hidden" name="aab101" value="${ins.aab101 }">
	</form>
	<br>
	<form action="" method = "post" name="returnForm" id = "returnForm">
		<input type = "submit" name = "next" onclick="goback()" class="btn btn-default" value = "返回" formnovalidate="formnovalidate">
		<input type="hidden" name="aac101" value="${ins.aac101 }">
		<input type="hidden" name="aab101" value="${ins.aab101 }">
	</form>
	<!-- 以下方法采用浏览器自带的回退方法,但是和留言模块有冲突 -->
	
</div>
<c:set var="aac101" scope="session" value="${ins.aac101 }"></c:set>
<c:set var="type" scope="session" value="${type }"></c:set>
<c:set var="aab101" scope="session" value="${ins.aab101 }"></c:set>
</body>
</html>
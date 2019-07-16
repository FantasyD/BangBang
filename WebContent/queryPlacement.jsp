<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>管理员帖子置顶审核</title>
<script>
	var count = 0;

	function onEdit(vaac101,vaab101)
	{
		var vform = document.getElementById("myform");
		vform.action = "<%=path%>/tiezi_findByIdTiezi.html?aac101=" + vaac101 + "&aab101=" + vaab101;
		vform.submit();
	}
	
	function onUpdateState(vaac301,vState)
	{
		var vform = document.getElementById("myform");
		vform.action = "<%=path%>/placement_updatePlacement.html?aac301=" + vaac301 + "&aac305=" + vState;
		vform.submit();
	}
</script>
</head>
<body>
<br>
<br>
<form id = "myform" action="<%=path%>/tiezi_queryTiezi.html" method="post">
	<!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               置顶审核
	    <hr width="160">
	  </caption>
	</table>
	
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center" class="table table-striped">
		<tr>
		    <td>序号</td>
		    <td>帖子ID</td>
		    <td>发帖人</td>
		    <td>帖子置顶申请日期</td>
		    <td>帖子置顶审核日期</td>
		    <td>帖子处理状态</td>
		    <td></td>
	  	</tr>
	  	
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>
				    	<!--  # 表示空锚 -->
				    	<a href="#" onclick = "onEdit('${ins.aac101 }','${ins.aab101 }')">${ins.aac101 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aac302 }</td>   			    
					<td>${ins.aac303 }</td>
					<c:if test = "${ins.aac305 == 0 }">
						<td>待处理</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',1)">置顶</a>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',3)">拒绝</a>
						</td>
					</c:if>
					
					<c:if test = "${ins.aac305 == 1 }">
						<td>已置顶</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',2)">取消</a>					
						</td>
					</c:if>
					
					<c:if test = "${ins.aac305 == 2 }">
						<td>取消置顶</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',1)">重新置顶</a>		
						</td>
					</c:if>
					
					<c:if test = "${ins.aac305 == 3 }">
						<td>拒绝置顶</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',1)">重新置顶</a>							
						</td>
					</c:if>
				  </tr>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center" >
	  <tr>
	    <td align="center">
	         <input type = "submit" name = "next" value = "返回"    class="btn btn-default"
       			formaction="<%=path%>/index.jsp"
       			formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>
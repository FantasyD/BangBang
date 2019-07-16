<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>置顶帖子</title>
	<script>
		function onEdit(vaac101,vaab101)
		{
			var vform = document.getElementById("myform");
			vform.action = "<%=path%>/tiezi_findByIdTiezi.html?aac101=" + vaac101 + "&aab101=" + vaab101;
			vform.submit();
		}
	</script>
</head>
<body>
<br>
<br>
<form id = "myform" action="" method="post">
	<!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
		<div align="center">
		               置顶帖
		    <hr width="160">
	    </div>
	</table>
	
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center" class="table table-striped">
		<tr>
		    <td>序号</td>
		    <td>帖子标题</td>
		    <td>发帖人</td>
		    <td>帖子类型</td>
		    <td>帖子酬劳</td>
	  	</tr>
	  	
		   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>
				    	<!--  # 表示空锚 -->
				    	<a href="#" onclick = "onEdit('${ins.aac101 }','${ins.aab101 }')">${ins.aac102 }</a>
				    </td>
				    <td>${ins.cnaab102 }</td>
				    <td>${ins.cnaac103 }</td>   			    
					<td>${ins.aac105 }</td>
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
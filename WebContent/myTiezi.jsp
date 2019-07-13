<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>我的帖子</title>
	<script>
		var count = 0;
		
		function onEdit(vaac101)
		{
			var vform = document.getElementById("myform");
			vform.action = "<%=path%>/tiezi_findByIdTiezi.html?aac101=" + vaac101;
			vform.submit();
		}
		
		function onDel(vaac101)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/tiezi_delByIdTiezi.html?aac101="+vaac101;
			vform.submit();
		} 
		
		function onModify(vaac101)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/tiezi_findByIdToModifyTiezi.html?aac101="+vaac101;
			vform.submit();
		} 
	</script>
</head>
<body>
${msg }
<br>
<br>
<form id = "myform" action="<%=path%>/tiezi_queryTiezi.html" method="post">	
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
		<tr>
		    <td>序号</td>
		    <td>帖子标题</td>
		    <td>发帖人</td>
		    <td>帖子类型</td>
		    <td>价格</td>
		    <td></td>
		    <td></td>
	  	</tr>
	  	
		   <c:choose>
	     <c:when test="${rows!=null }">
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>
				    	<!--  # 表示空锚 -->
				    	<a href="#" onclick = "onEdit('${ins.aac101 }')">${ins.aac102 }</a>
				    </td>
				    <td>${ins.cnaab102 }</td>
				    <td>${ins.cnaac103 }</td>  
				    <c:if test="${ins.aac105 !=null }">
				    	<td>${ins.aac105 }</td>
				    </c:if> 			    
					<c:if test="${ins.aac105==null }">
						<td>无</td>
					</c:if>
			      	<td>
				      <a href="#" onclick="onModify('${ins.aac101}')">修改</a>
				    </td>
					 <td>
				      <a href="#" onclick="onDel('${ins.aac101}')">删除</a>
				    </td>

				  </tr>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="发布帖子" 
	              formaction="<%=path%>/addTiezi.jsp">
	         <input type = "submit" name = "next" value = "返回"
       			formaction="<%=path%>/index.jsp"
       			formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
	
<input type="hidden" name="aab101" value="${aab101 }">
<c:set var="aab101" scope="session" value="${aab101 }"></c:set>
</form>
</body>
</html>
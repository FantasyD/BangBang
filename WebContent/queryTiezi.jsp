<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>帖子数据查询及分页测试</title>
	<script>
		var count = 0;
		
		function onEdit(vaac101)
		{
			var vform = document.getElementById("myform");
			vform.action = "<%=path%>/findByIdTiezi.html?aac101=" + vaac101;
			vform.submit();
		}
	</script>
</head>
<body>
<br>
<br>
<form id = "myform" action="<%=path%>/queryTiezi.html" method="post">
	<!-- 查询条件区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               帖子
	    <hr width="160">
	  </caption>
	  <tr>
	    <td colspan="4">查询条件</td>
	  </tr>
	  <tr>
	    <td>帖子标题</td>
	    <td>
	      <e:text name="qaac102"/>
	    </td>
	  </tr>
	  <tr>
	    <td>帖子类型</td>
	    <td>
	      <e:radio name="qaac103" value="求购:01,代取:02,求信息:03,出售:04,求学习资料:05,其他:06,不限定:''" defval=""/>
	    </td>
	  </tr>
	</table>
	
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
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
				    	<a href="#" onclick = "onEdit('${ins.aac101 }')">${ins.aac102 }</a>
				    </td>
				    <td>${ins.cnaab102 }</td>
				    <td>${ins.cnaac103 }</td>   			    
					<td>${ins.aac105 }</td>
				  </tr>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
</form>
</body>
</html>
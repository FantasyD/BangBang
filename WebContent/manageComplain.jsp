<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
   <title>Insert title here</title>
   <style type="text/css">
     tr
     {
        height:25px;
     }
     #title{
     	background : #EE82EE;
     }
   </style>
   <script  type="text/javascript">
   function onHandleUser(aaf101)
   {
	   var vform = document.getElementById("myform");
	   vform.action="<%=path%>/complain_HandleUser.html?aaf101="+aaf101;
	   vform.submit();
   }
   function onHandleTie(aaf101)
   {
	   var vform = document.getElementById("myform");
	   vform.action="<%=path%>/complain_HandleTie.html?aaf101="+aaf101;
	   vform.submit();
   }
   function onHandleComment(aaf101)
   {
	   var vform = document.getElementById("myform");
	   vform.action="<%=path%>/complain_HandleComment.html?aaf101="+aaf101;
	   vform.submit();
   }
   </script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/complain_ComplainQuery.html" method="post">
	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center">
	  <caption>
	               处理举报
	    <hr width="160">
	  </caption>
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <tr id = "title">
			    <td>序号</td>
			    <td>举报人姓名</td>
			    <td>被举报人姓名</td>
			    <td>举报类型</td>
			    <td>举报原因</td>
			    <td>处理状态</td>
			    <td>举报时间</td>
			    <td>处理时间</td>
			    <td></td>
			  </tr>
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
			     <c:if test="${ins.aaf103 == '1'}">
				   <tr>
					    <td>${vs.count }        </td>
					    <td>${ins.complainer }  </td>
					    <td>${ins.caller }      </td>
					    <td>${ins.reason }      </td>
					    <td>${ins.aaf106 }      </td>
					    <td>${ins.hstatus }     </td>
					    <td>${ins.aaf109 }      </td>
					    <td>${ins.aaf108 }      </td>
					    <td>
					      <a href="#" onclick="onHandleUser('${ins.aaf101}')">处理</a>
					    </td>
					  </tr>
				  </c:if>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	    <c:choose>
	     <c:when test="${rows!=null }">
	         <tr id = "title">
			    <td>序号</td>
			    <td>举报人姓名</td>
			    <td>帖子标题</td>
			    <td>举报类型</td>
			    <td>举报原因</td>
			    <td>处理状态</td>
			    <td>举报时间</td>
			    <td>处理时间</td>
			    <td></td>
			  </tr>
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
		     	  <c:if test="${ins.aaf103 == '2'}">
				      <tr>
					    <td>${vs.count }        </td>
					    <td>${ins.complainer }  </td>
					    <td>${ins.title }      </td>
					    <td>${ins.reason }      </td>
					    <td>${ins.aaf106 }      </td>
					    <td>${ins.hstatus }     </td>
					    <td>${ins.aaf109 }      </td>
					    <td>${ins.aaf108 }      </td>
					    <td>
					      <a href="#" onclick="onHandleTie('${ins.aaf101}')">处理</a>
					    </td>
					  </tr>
				  </c:if>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	    <c:choose>
	     <c:when test="${rows!=null }">
	         <tr id = "title">
			    <td>序号</td>
			    <td>举报人姓名</td>
			    <td>留言内容</td>
			    <td>举报类型</td>
			    <td>举报原因</td>
			    <td>处理状态</td>
			    <td>举报时间</td>
			    <td>处理时间</td>
			    <td></td>
			  </tr>
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
		     	  <c:if test="${ins.aaf103 == '3'}">
				      <tr>
					    <td>${vs.count }        </td>
					    <td>${ins.complainer }  </td>
					    <td>${ins.comment }      </td>
					    <td>${ins.reason }      </td>
					    <td>${ins.aaf106 }      </td>
					    <td>${ins.hstatus }     </td>
					    <td>${ins.aaf109 }      </td>
					    <td>${ins.aaf108 }      </td>
					    <td>
					      <a href="#" onclick="onHandleComment('${ins.aaf101}')">处理</a>
					    </td>
					  </tr>
				  </c:if>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="查询">
	       </input>
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>����Ա�����ö����</title>
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
	<!-- ��ѯ������ -->
	<table border="1" width="95%" align="center">
	  <caption>
	               �ö����
	    <hr width="160">
	  </caption>
	</table>
	
	<!-- ���ݵ����� -->
	<table border="1" width="95%" align="center" class="table table-striped">
		<tr>
		    <td>���</td>
		    <td>����ID</td>
		    <td>������</td>
		    <td>�����ö���������</td>
		    <td>�����ö��������</td>
		    <td>���Ӵ���״̬</td>
		    <td></td>
	  	</tr>
	  	
	   <c:choose>
	     <c:when test="${rows!=null }">
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				    <td>${vs.count }</td>
				    <td>
				    	<!--  # ��ʾ��ê -->
				    	<a href="#" onclick = "onEdit('${ins.aac101 }','${ins.aab101 }')">${ins.aac101 }</a>
				    </td>
				    <td>${ins.aab102 }</td>
				    <td>${ins.aac302 }</td>   			    
					<td>${ins.aac303 }</td>
					<c:if test = "${ins.aac305 == 0 }">
						<td>������</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',1)">�ö�</a>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',3)">�ܾ�</a>
						</td>
					</c:if>
					
					<c:if test = "${ins.aac305 == 1 }">
						<td>���ö�</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',2)">ȡ��</a>					
						</td>
					</c:if>
					
					<c:if test = "${ins.aac305 == 2 }">
						<td>ȡ���ö�</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',1)">�����ö�</a>		
						</td>
					</c:if>
					
					<c:if test = "${ins.aac305 == 3 }">
						<td>�ܾ��ö�</td>
						<td>
							<a href="#" onclick = "onUpdateState('${ins.aac301 }',1)">�����ö�</a>							
						</td>
					</c:if>
				  </tr>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	
	<!-- ���ܰ�ť�� -->
	<table border="1" width="95%" align="center" >
	  <tr>
	    <td align="center">
	         <input type = "submit" name = "next" value = "����"    class="btn btn-default"
       			formaction="<%=path%>/index.jsp"
       			formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
</form>
</body>
</html>
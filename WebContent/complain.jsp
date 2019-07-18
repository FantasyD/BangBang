<%@ page  language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!DOCTYPE>
<html>
<head>
<title>Inserthere</title>
</head>
<body>
${msg }
<br/>
<br/>
<form action="<%=path%>/complain_ComplainAdd.html" method = "post">
<table border = "1">

   <tr>
     <td colspan="2">举报内容</td>
   </tr>
   <tr>
     <td>类型</td>
     <td>
       <e:select name="aaf105" 
       			 value="存在违反国家法律法规的内容:01,存在泄露他人隐私信息的内容:02,存在辱骂、中伤、诽谤他人的内容:03,存在夸大、过度宣传等内容:04,存在色情、淫秽、低俗等不适内容:05" 
       			 required="true" />
     </td>
   </tr>
   
   <tr>
     <td>原因</td>
     <td>
       <e:textarea rows="5" cols="45" name="aaf106" required="true" />
     </td>
   </tr>
   <tr>
     <td colspan="2" align="center">
		<input type = "submit" value = "提交"></input>
     </td>
   </tr>
   
   
</table>

<input name="aab101" value="<%=request.getParameter("aab101") %>">
<input name="aaf103" value="<%=request.getParameter("aaf103") %>">
<input name="aaf104" value="<%=request.getParameter("aaf104") %>">

</form>
</body>
</html>


<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri = "http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<title>
${empty param.aac101?'发布帖子':'帖子内容修改' }
</title>
<style>
	td{
		height:30px;
	}
	msg{
		color:#ff0000;
	}
</style>
${msg}
</head>
<body>
<br>
<br>
<form action="<%=path%>/tiezi_addTiezi.html" method = "post" enctype="multipart/form-data">
<table border = "1" align = "center" width = "45%">
    <caption>
       	${empty param.aac101?'发布帖子':'帖子内容修改' }
      <hr width="160">
    </caption>
   <tr>
     <td>帖子标题</td>
     <td>
       <e:text name = "aac102" required = "true" autofocus = "true" defval = "${ins.aac102 }"/>
     </td>
   </tr>   


   <tr>
     <td>帖子类型</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
       <e:select name = "aac103" required = "true" value = "求购:01,代取:02,求信息:03,出售:04,求学习资料:05,其他:06"  defval="${ins.aac103 }"/>
     </td>
   </tr>
 
   <tr>
     <td>酬劳</td>
     <td>
        <e:text name = "aac105" defval="${ins.aac105 }"/>
     </td>
   </tr>
   
    <tr>
     <td>帖子标签</td>
     <td>
       <e:text name = "aac106"  required = "true" defval = "${ins.aac106 }"/>
     </td>
   </tr>   

   <tr>
     <td>帖子内容</td>
     <td>
       <e:textarea rows = "5" cols = "45" required="true" name = "aac104" defval = "${ins.aac104 }"/>
     </td>
   </tr>
    <tr>
     <td>帖子图片路径</td>
     <td>
                   文件:<input type="file" name="photo"/><br/>
     </td>
   </tr>   
   
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="${empty param.aac101?'发布帖子':'修改帖子' }"
       			 formaction = "<%=path%>/${empty param.aac101?'tiezi_addTiezi.html':'tiezi_modifyTiezi.html?' }">
       <input type = "submit" name = "next" value = "返回"
       			formaction="<%=path%>/index.jsp"
       			formnovalidate="formnovalidate">
       			
     </td>
   </tr>
	
</table>
<input type="hidden" name="aac101" value="${ins.aac101 }">
<input type="hidden" name="aab101" value="${aab101 }">
</form>
</body>
</html>
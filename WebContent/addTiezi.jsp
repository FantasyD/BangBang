<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri = "http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<title>发布帖子</title>
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
<form action="<%=path%>/addTiezi.html" method = "post">
<table border = "1" align = "center" width = "45%">
    <caption>
       	发布帖子
      <hr width="160">
    </caption>
   <tr>
     <td>帖子标题</td>
     <td>
       <e:text name = "aac102" required = "true" autofocus = "true"/>
     </td>
   </tr>   


   <tr>
     <td>帖子类型</td>
     <td>
       <!--
                         按照name属性自动分组,组内单选 
        -->
       <e:radio name = "aac103" required = "true" value = "求购:01,代取:02,求信息:03,出售:04,求学习资料:05,其他:06" />
     </td>
   </tr>
 
   <tr>
     <td>酬劳</td>
     <td>
        <e:text name = "aac105" />
     </td>
   </tr>
   
    <tr>
     <td>帖子标签</td>
     <td>
       <e:text name = "aac106"  required = "true" />
     </td>
   </tr>   

   <tr>
     <td>帖子内容</td>
     <td>
       <e:textarea rows = "5" cols = "45" required="true" name = "aac104"/>
     </td>
   </tr>
   
    <tr>
     <td>帖子图片路径</td>
     <td>
       <e:text name = "aac109"  required = "true" />
     </td>
   </tr>   
   
   <tr>
     <td colspan="2" align="center">
       <input type="submit" name="next" value="添加"
       			 formaction = "<%=path%>/addTiezi.html">
       <input type = "submit" name = "next" value = "返回"
       			formaction="<%=path%>/queryTieziById.html"
       			formnovalidate="formnovalidate">
       			
     </td>
   </tr>
	
</table>
<input type="hidden" name="aab101" value="${aab101}">
</form>
</body>
</html>
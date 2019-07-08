<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!doctype html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/signin.css" rel="stylesheet">
    <title>${ins.aae102 }的主页</title>
    
    
    <style type="text/css">
    	#updateInfo
    	{
    			display:none;
    	}
    </style>
    <script type="text/javascript">
    	function updateIsClick()
    	{
    			var infoForm=document.getElementById("updateInfo");
    			infoForm.style.display="block";
    	}
    	function closeDiv()
		{
    			var infoForm=document.getElementById("updateInfo");
				infoForm.style.display="none";
		}
    	</script>
  </head>
  <body>
  	<div class="col-md-8" >
  		<div class="panel panel-default">  
        <div class="panel-body">  
          <table class="table">  
            <caption>${ins.aae102 }</caption>  
            <tbody>
              <tr>
              	<td>${ins.aae103!=null && ins.aae103!=''?ins.aae103:'该群组暂时没有签名'}</td>
              </tr>    
              <tr>  
               	<td>${ins.aae104}</td>
              </tr>  
              <tr>  
                <td>${ins.aae105}</td>
              </tr>  
              <tr>  
                <td>${ins.aae107!=null&& ins.aae107!=''?ins.aae107:'该群组暂时没有描述'}</td>
              </tr>
              <tr>
              	<td>
              		<input type="button" id="update" value="修改" onclick="updateIsClick()"/>
              	</td>
              </tr>
              </tbody>  
          </table>  
        </div>  
      </div> 
  	</div>    
  	
  	<div class="col-md-4">  
      <div class="panel panel-default">  
        <div class="panel-body">  
          <table class="table">  
            <caption>群组成员</caption>  
            <thead>  
              <tr>
              	<th>序号</th>  
                <th>身份</th>  
                <th>组员名称</th>  
              </tr>  
            </thead>  
            <tbody>  
            	<c:forEach items="${rows }"  var="row" varStatus="vs">
            		<tr>
            				<td>${vs.count }</td>
            				<c:choose>
            					<c:when test="${row.ab101==ins.aab101 }">
            						<td>创建者</td>
            					</c:when>
            					<c:otherwise>
            						<td>组员</td>
            					</c:otherwise>
            				</c:choose>
                			<td>${row.ab102 }</td>  
            		</tr>
            	</c:forEach>
            </tbody>  
          </table>  
        </div>  
      </div>  
    </div>  
    
    <div id="updateInfo" >
    <form action="<%=path %>/updateGroup.html" method="post" >
		<table border="1" align="center" width="50%">
				<caption>
						群组信息
						<hr width="160px">
				</caption>
				<tr>
						<td>群组名:</td>
						<td>
								<e:text  name="aae102"  required="true"  defval="${ins.aae102 }" autofocus="true"  maxlength="30" />
						</td>
				</tr>
				<tr>
						<td>群组签名:</td>
						<td>
								<e:text  name="aae103" defval="${ins.aae103 }"  maxlength="30"/>
						</td>
				</tr>
				<tr>
						<td>群组名:</td>
						<td>
								<e:text  name="aae105" defval="${ins.aae105 }"/>
						</td>
				</tr>
				<tr>
						<td>群组详细描述:</td>
						<td>
								<e:textarea rows="10" cols="25" name="aae107" defval="${ins.aae107 }"/>
						</td>
				</tr>
				<e:hidden name="aae101" value="${aae101 }"/>
				<tr>
						<td  colspan="2"  align="center">
								<input  type="submit"  name="next"  value="修改"  >
								<button onclick="closeDiv()">取消</button>
						</td>
				</tr>
		</table>
		</form>
    </div>
    
  </body>
</html>

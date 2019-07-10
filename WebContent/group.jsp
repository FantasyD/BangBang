<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	Map<String, String> ins = (Map<String, String>) request.getAttribute("ins");
	boolean isCreater = (session.getAttribute("aab101").equals(ins.get("aab101")));
%>
<!doctype html>
<html>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/signin.css" rel="stylesheet">
<title>${ins.aae102 }的主页</title>
<style type="text/css">
#updateInfo {
	display: none;
}

#numberForm {
	display: none;
}
</style>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript">
    	//显示隐藏的修改DIV
    	function updateIsClick()
    	{
    			var infoForm=document.getElementById("updateInfo");
    			infoForm.style.display="block";
    	}
    	//隐藏修改DIV
    	function closeDiv()
		{
    			var infoForm=document.getElementById("updateInfo");
				infoForm.style.display="none";
		}
    	//转让创建者身份
    	function transfered(aab101)
    	{
    			var trans=document.getElementById("empty");
    			trans.action="<%=path%>/transferGroup.html?aab101="+aab101;
    			trans.submit();
    	}
    	//删除组员
    	function delMember(aab101)
    	{
    			var dels=document.getElementById("empty");
    			dels.action="<%=path%>/delGroupMember.html?aab101="+aab101;
    			dels.submit();
    	}
    	//退出该群组
    	function quitIsClick(aae101)
    	{
    			if(confirm("您确定要退出该群组吗？"))
    			{
    					var quitBtn=document.getElementById("quit");
	    				quitBtn.action="<%=path%>/quitGroup.html";
						quitBtn.submit();
				}
		}
    	//解散该群组
    	function delGroupIsClick()
    	{
    			if(confirm("您确定要解散该群组"))
    			{
    				var delBtn=document.getElementById("quit");
    				delBtn.action="<%=path%>/delGroup.html";
					delBtn.submit();
    			}
    	}
		//显示隐藏的修改DIV
		function inviteIsClicked() {
			var infoForm = document.getElementById("numberForm");
			infoForm.style.display = "block";
		}
		//隐藏修改DIV
		function closeInviteDiv() {
			var infoForm = document.getElementById("numberForm");
			infoForm.style.display = "none";
		}
</script>
</head>

<body>
	${msg }
	<div class="col-md-8">
		<div class="panel panel-default">
			<div class="panel-body">
				<table class="table">
					<caption>
						<img class="img-circle"
							src="${ins.aae105!=null && ins.aae105!=''?ins.aae105:'upload/index.jpg'}"
							width="30px" height="30px" alt="头像" /> ${ins.aae102 }
					</caption>
					<tbody>
						<tr>
							<td>${ins.aae103!=null && ins.aae103!=''?ins.aae103:'该群组暂时没有签名'}</td>
						</tr>
						<tr>
							<td>${ins.aae104}</td>
						</tr>
						<tr>
							<td>${ins.aae107!=null&& ins.aae107!=''?ins.aae107:'该群组暂时没有描述'}</td>
						</tr>
						<tr>
							<td><input type="button" id="update" value="修改"
								onclick="updateIsClick()" /> <input type="button" value="邀请"
								onclick="inviteIsClicked()" />
								<form id="quit" method="post">
									<e:hidden name="aae101" value="${ins.aae101 }" />
								</form> <c:forEach items="${rows }" var="row" varStatus="vs">
									<c:if test="${row.ab101==ins.aab101 }">
										<c:choose>
											<c:when test="<%=isCreater %>">
												<button onclick="delGroupIsClick()">解散群组</button>
											</c:when>
											<c:otherwise>
												<button onclick="quitIsClick('${ins.aae101}')">退出群组</button>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach></td>
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
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${rows }" var="row" varStatus="vs">
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
								<td><c:if test="${row.ab101!=ins.aab101 }">
										<c:if test="<%=isCreater%>">
											<form id="empty" method="post">
												<e:hidden name="aae101" value="${ins.aae101 }" />
											</form>
											<a herf="#" onclick="transfered('${row.ab101}')">转让</a>
											<a herf="#" onclick="delMember('${row.ab101}')">删除</a>
										</c:if>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<div id="updateInfo">
		<form action="<%=path%>/updateGroup.html" method="post">
			<table border="1" align="center" width="50%">
				<caption>
					群组信息
					<hr width="160px">
				</caption>
				<tr>
					<td>群组名:</td>
					<td><e:text name="aae102" required="true"
							defval="${ins.aae102 }" autofocus="true" maxlength="30" /></td>
				</tr>
				<tr>
					<td>群组签名:</td>
					<td><e:text name="aae103" defval="${ins.aae103 }"
							maxlength="30" /></td>
				</tr>
				<tr>
					<td>群组详细描述:</td>
					<td><e:textarea rows="10" cols="25" name="aae107"
							defval="${ins.aae107 }" /></td>
				</tr>
				<e:hidden name="aae101" value="${aae101 }" />
				<tr>
					<td colspan="2" align="center"><input type="submit"
						name="next" value="修改">
						<button onclick="closeDiv()">取消</button></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="invite">
		<form action="<%=path%>/inviteToGroup.html" id="numberForm">
			请输入你想邀请的用户名: <input type="text" id="invitedNumber" name="aab101">
			<e:hidden name="aae101" value="${ins.aae101 }" />
			<input type="submit" value="确定">
			<button onclick="closeInviteDiv()">取消</button>
		</form>
	</div>

</body>
</html>

<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel='stylesheet' href='css/owl.carousel.min.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/fontello.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/nicetheme.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/reset.css' type='text/css' media='all' />
<link rel='stylesheet' href='css/style.css' type='text/css' media='all' />
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
		
		function onTop(vaac101)
		{
			var vform = document.getElementById("myform");
			vform.action="<%=path%>/placement_addPlacement.html?aac101=" + vaac101;
			vform.submit();
			alert("帖子置顶申请已发送");
		} 
	</script>
</head>
<body>
<br>
<br>
<form id = "myform" action="<%=path%>/tiezi_queryTiezi.html" method="post">	
<c:set var="type" scope="session" value="2"></c:set>
	<table border="1" width="95%" align="center" class="table">
		<caption align="center">
	              	 我的帖子
	    	<hr width="160">
	  	</caption>
	</table>

	<div class="main-content">
		<div class="container">
			<div class="row">
				<div class="article col-xs-12 col-sm-8 col-md-8">
					<div class="ajax-load-box posts-con">
						<div class="ajax-load-con content wow fadeInUp">
							<div class="content-box posts-gallery-box">
									
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
							<td>
							<a href = "#" onclick = "onTop('${ins.aac101}')">申请置顶</a>
							</td>
							</tr>
							</c:forEach>
							</c:when>
							</c:choose>
								<div class="posts-gallery-img"> <a href="#" title="帖子图片无法显示" target="_blank"> <img class="lazy" src="images/1.jpg" width="231" height="173" alt="mawiss WordPress博客杂志的主题" /> </a> </div>
								<div class="posts-gallery-content">
									<h2><a href="#" title="mawiss WordPress博客杂志的主题">mawiss WordPress博客杂志的主题</a></h2>
									<div class="posts-gallery-text">mawiss–WordPress博客杂志的主题是一种优质的WordPress博客主题，简洁的设计和完全响应式布局。这个主题是有用的许多网页的风格、滑块式、主题选项，自定义侧边栏和更多!&hellip;</div>
									<div class="posts-default-info posts-gallery-info">
										<ul>
										<li class="post-author hidden-xs">
										<div class="avatar"><img alt='maolai' src="images/wo.jpg" height='96' width='96' /></div>
										<a href="#" target="_blank">maolai</a></li>
										<li class="postoriginal hidden-xs"><span><i class="icon-cc-1"></i>原创</span></li>
										<li class="ico-cat"><i class="icon-list-2"></i> <a href="#">wordpress主题</a></li>
										<li class="ico-time"><i class="icon-clock-1"></i> 2017-10-25</li>
										<li class="ico-eye hidden-xs"><i class="icon-eye-4"></i> 10,763</li>
										<li class="ico-like hidden-xs"><i class="icon-heart"></i> 213</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 数据迭代区 -->
	<table border="1" width="95%" align="center" class="table table-striped">

	  	
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
					<td>
						<a href = "#" onclick = "onTop('${ins.aac101}')">申请置顶</a>
					</td>
				  </tr>
		      </c:forEach>
	     </c:when>
	   </c:choose>
	</table>
	
	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center" class="table table-striped">
	  <tr>
	    <td align="center">
	       <input type="submit" name="next" value="发布帖子"   class="btn btn-default"
	              formaction="<%=path%>/addTiezi.jsp">
	         <input type = "submit" name = "next" value = "返回"    class="btn btn-default"
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


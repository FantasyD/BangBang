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
<title>帖子数据查询</title>
	<script>
		var count = 0;

		function onEdit(vaac101,vaab101)
		{
			var vform = document.getElementById("myform");
			vform.action = "<%=path%>/tiezi_findByIdTiezi.html?type=1&aac101=" + vaac101 + "&aab101=" + vaab101;
			vform.submit();
		}
	</script>
</head>
<body>
<br>
<br>
<form id = "myform" action="<%=path%>/tiezi_queryTiezi.html" method="post">
	<div class="main-content">
		<div class="container">
			<div class="row">
				<div class="article col-xs-12 col-sm-8 col-md-8">
					<div class="ajax-load-box posts-con">						
						<c:choose>
							<c:when test="${rows!=null }">
								<c:forEach items="${rows }" var="ins" varStatus="vs">
								<div class="ajax-load-con content wow fadeInUp">
									<div class="content-box posts-gallery-box">
									<c:if test="${ins.imgpath!=null }">
										<div class="posts-gallery-img"> <a href="#" title="帖子图片无法显示"  onclick = "onEdit('${ins.aac101 }','${ins.aab101 }')" > <img class="lazy" src="${ins.imgpath }" width="231" height="173"/> </a> </div>
									</c:if>	
									<c:if test="${ins.imgpath==null }">
										<div class="posts-gallery-img"> <a href="#" title="帖子图片无法显示"  onclick = "onEdit('${ins.aac101 }','${ins.aab101 }')" > <img class="lazy" src="images/20.jpg" width="231" height="173"/> </a> </div>
									</c:if>				
									<div class="posts-gallery-content">
										<h2><a href="#" onclick = "onEdit('${ins.aac101 }','${aab101 }')" title="mawiss WordPress博客杂志的主题">${ins.aac101}${ins.aac102 }</a></h2>
										<div class="posts-gallery-text">mawiss–WordPress博客杂志的主题是一种优质的WordPress博客主题，简洁的设计和完全响应式布局。这个主题是有用的许多网页的风格、滑块式、主题选项，自定义侧边栏和更多!&hellip;</div>
										<div class="posts-default-info posts-gallery-info">
											<ul>
											<li class="post-author hidden-xs">
											<div class="avatar"><img alt='maolai' src="images/wo.jpg" height='96' width='96' /></div>
											<a href="#" target="_blank">${ins.cnaab102 }</a></li>									
											<li class="ico-cat"><i class="icon-list-2"></i> <a href="#">${ins.cnaac103 }</a></li>
											<li class="ico-time"><i class="icon-clock-1"></i> ${ins.aac108 }</li>
											<li class="ico-eye hidden-xs"><i class="icon-eye-4"></i> ${ins.aac110 }</li>							
											</ul>
										</div>
									</div>		
									</div>
								</div>			
								</c:forEach>
							</c:when>	
						</c:choose>							
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 功能按钮区 -->
	<table border="1" width="95%" align="center" >
	  <tr>
	    <td align="center">
	         <input type = "submit" name = "next" value = "返回"    class="btn btn-default"
       			formaction="<%=path%>/index.jsp"
       			formnovalidate="formnovalidate">
	    </td>
	  </tr>
	</table>
</form>
<script type='text/javascript' src='js/plugins.min.js'></script> 
<script type='text/javascript' src='js/lmlblog.js'></script> 
<script type='text/javascript' src='js/owl.carousel.min.js'></script> 
<script type='text/javascript' src='js/wow.min.js'></script>
</body>
</html>
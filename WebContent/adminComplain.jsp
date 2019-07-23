<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>管理员置顶申请审核</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="apple-touch-icon" href="apple-touch-icon.png">
	<link rel="icon" href="images/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/scrollbar.css">
	<link rel="stylesheet" href="css/fontawesome/fontawesome-all.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/tipso.css">
	<link rel="stylesheet" href="css/chosen.css">
	<link rel="stylesheet" href="css/prettyPhoto.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/basictable.css">
	<link rel="stylesheet" href="css/dashboard.css">
	<link rel="stylesheet" href="css/color.css">
	<link rel="stylesheet" href="css/transitions.css">
	<link rel="stylesheet" href="css/responsive.css">
	<link rel="stylesheet" href="css/dbresponsive.css">
	<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
</head>
<body class="wt-login">
	<!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
	<!-- Preloader Start -->
	<div class="preloader-outer">
		<div class="loader"></div>
	</div>
	<!-- Preloader End -->
	<!-- Wrapper Start -->
	<div id="wt-wrapper" class="wt-wrapper wt-haslayout">
		<!-- Content Wrapper Start -->
		<div class="wt-contentwrapper">
			<!-- Header Start -->			
			<!-- Header End -->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout">
				<!--Sidebar Start-->
				<jsp:include page="adminBtn.jsp"></jsp:include>
				<!--Sidebar Start-->
				<!--Register Form Start-->
				<section class="wt-haslayout wt-dbsectionspace">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 float-right">
							<div class="wt-dashboardbox wt-dashboardinvocies">
								<div class="wt-dashboardboxtitle wt-titlewithsearch">
									<h2>对用户的举报</h2>
									<form class="wt-formtheme wt-formsearch">
										<fieldset>
											<div class="form-group">			
											</div>
										</fieldset>
									</form>
								</div>
								<div class="wt-dashboardboxcontent wt-categoriescontentholder wt-categoriesholder">
									<table class="wt-tablecategories">
										<thead>
											<tr>
												<th>序号</th>
												<th>举报人姓名</th>
												<th>被举报人姓名</th>
												<th>举报类型</th>
												<th>处理状态</th>
												<th>举报时间</th>
												<th>处理时间</th>
												<th>操作</th>		
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
														<c:if test="${ins.aaf103 == '1'}">
														<tr>
															<td>${vs.count }        </td>
														    <td>${ins.complainer }  </td>
														    <td>${ins.caller }      </td>
														    <td>${ins.reason }      </td>
														    <td>${ins.hstatus }     </td>
														    <td>${ins.aaf109 }      </td>
														    <td>${ins.aaf108 }      </td>
															 <c:if test="${ins.hstatus eq '未处理' }">
														    	<td>
														   			<a href="#" onclick="onHandleUser('${ins.aaf101}')">处理</a>
														    	</td>
														    </c:if>
														    <c:if test="${ins.hstatus eq '已处理' }">
														    	<td>
														   			<a href="#" onclick="onHandleUser('${ins.aaf101}')">查看记录</a>
														    	</td>
														    </c:if>		
														</tr>	
														</c:if>												
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
									
									
								</div>
							</div>
						</div>
						</div>
						
						<br>
						
						<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 float-right">
							<div class="wt-dashboardbox wt-dashboardinvocies">
								<div class="wt-dashboardboxtitle wt-titlewithsearch">
									<h2>对帖子的举报</h2>
									<form class="wt-formtheme wt-formsearch">
										<fieldset>
											<div class="form-group">
												
											</div>
										</fieldset>
									</form>
								</div>
								<div class="wt-dashboardboxcontent wt-categoriescontentholder wt-categoriesholder">
									<table class="wt-tablecategories">
										<thead>
											<tr>
												<th>序号</th>
												<th>举报人姓名</th>
												<th>帖子标题</th>
												<th>举报类型</th>
												<th>处理状态</th>
												<th>举报时间</th>
												<th>处理时间</th>
												<th>操作</th>							
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:if test="${ins.aaf103 == '2'}">
														<tr>
															<td>${vs.count }        </td>
														    <td>${ins.complainer }  </td>
														    <td>${ins.title }      </td>
														    <td>${ins.reason }      </td>
														    <td>${ins.hstatus }     </td>
														    <td>${ins.aaf109 }      </td>
														    <td>${ins.aaf108 }      </td>
														    <c:if test="${ins.hstatus eq '未处理' }">
														    	<td>
														   			<a href="#" onclick="onHandleTie('${ins.aaf101}')">处理</a>
														    	</td>
														    </c:if>
														    <c:if test="${ins.hstatus eq '已处理' }">
														    	<td>
														   			<a href="#" onclick="onHandleTie('${ins.aaf101}')">查看记录</a>
														    	</td>
														    </c:if>														    
														</tr>	
													</c:if>												
													</c:forEach>
												</c:when>
											</c:choose>
										
										</tbody>
									</table>
									
									
								</div>
							</div>
						</div>				
						</div>
						
						
						<br>
						
						<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 float-right">
							<div class="wt-dashboardbox wt-dashboardinvocies">
								<div class="wt-dashboardboxtitle wt-titlewithsearch">
									<h2>对留言的举报</h2>
									<form class="wt-formtheme wt-formsearch">
										<fieldset>
											<div class="form-group">
												
											</div>
										</fieldset>
									</form>
								</div>
								<div class="wt-dashboardboxcontent wt-categoriescontentholder wt-categoriesholder">
									<table class="wt-tablecategories">
										<thead>
											<tr>
												<th>序号</th>
												<th>举报人姓名</th>
												<th>留言内容</th>
												<th>举报类型</th>											
												<th>处理状态</th>
												<th>举报时间</th>
												<th>处理时间</th>
												<th>操作</th>							
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
													<c:if test="${ins.aaf103 == '3'}">
														<tr>
															<td>${vs.count }        </td>
														    <td>${ins.complainer }  </td>
														    <td>${ins.comment }      </td>
														    <td>${ins.reason }      </td>	 
														    <td>${ins.hstatus }     </td>
														    <td>${ins.aaf109 }      </td>
														    <td>${ins.aaf108 }      </td>														    
														     <c:if test="${ins.hstatus eq '未处理' }">
														    	<td>
														   			<a href="#" onclick="onHandleComment('${ins.aaf101}')">处理</a>
														    	</td>
														    </c:if>
														    <c:if test="${ins.hstatus eq '已处理' }">
														    	<td>
														   			<a href="#" onclick="onHandleComment('${ins.aaf101}')">查看记录</a>
														    	</td>
														    </c:if>	
														</tr>	
													</c:if>												
													</c:forEach>
												</c:when>
											</c:choose>
										
										</tbody>
									</table>
									
									
								</div>
							</div>
						</div>				
						</div>
					
				</section>
				<!--Register Form End-->
			</main>
			<!--Main End-->	
		</div>
		<!--Content Wrapper End-->
	</div>
	
	<form id = "myform"  method="post">
		<input type="hidden" name="aah102" value="0">
		<input type="hidden" name="aah103" value="置顶帖子审核请求处理">
	</form>
	
	<!--Wrapper End-->
	<script src="js/vendor/jquery-3.3.1.js"></script>
	<script src="js/vendor/jquery-library.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="http://ditu.google.cn/maps/api/js?key=AIzaSyCR-KEWAVCn52mSdeVeTqZjtqbmVJyfSus&language=en"></script>
	<script src="js/jquery.basictable.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.sortable.js"></script>
	<script src="js/chosen.jquery.js"></script>
	<script src="js/tilt.jquery.js"></script>
	<script src="js/scrollbar.min.js"></script>
	<script src="js/prettyPhoto.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/readmore.js"></script>
	<script src="js/countTo.js"></script>
	<script src="js/appear.js"></script>
	<script src="js/tipso.js"></script>
	<script src="js/gmap3.js"></script>
	<script src="js/jRate.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
		const menu_icon = document.querySelector('.menu-icon');
		function addClassFunThree() {
	        this.classList.toggle("click-menu-icon");
	    }
	    menu_icon.addEventListener('click', addClassFunThree);
	     $('.wt-tablecategories').basictable({
		    breakpoint: 767,
		});
	     
	     
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
</body>
</html>
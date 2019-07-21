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
			<jsp:include page="head.jsp"></jsp:include>
			<!-- Header End -->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout">
				<!--Sidebar Start-->
				<jsp:include page="userBtn.jsp"></jsp:include>
				<!--Sidebar Start-->
				<!--Register Form Start-->
				<section class="wt-haslayout wt-dbsectionspace">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 float-right">
							<div class="wt-dashboardbox wt-dashboardinvocies">
								<div class="wt-dashboardboxtitle wt-titlewithsearch">
									<h2>置顶申请</h2>
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
												<th>帖子标题</th>
												<th>发帖人</th>
												<th>帖子置顶申请日期</th>
												<th>申请审核日期</th>
												<th>帖子审核状态</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${rows!=null }">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
														<tr>
															<td>${vs.count }</td>
															<td>
														    	<a href="#" onclick = "onEdit('${ins.aac101 }','${ins.aab101 }')">${ins.aac102 }</a>
														    </td>
															<td>${ins.cnaab102 }</td>
															<td>${ins.aac302 }</td>   			    
															<td>${ins.aac303 }</td>
															<c:if test = "${ins.aac305 == 0 }">
																<td>待处理</td>
																<td>
																<div class="wt-actionbtn">
																	<a href="#"  class="wt-addinfo wt-skillsaddinfo"  onclick = "onUpdateState('${ins.aac301 }',1,'${ins.aab101 }')">置顶</a>
																	<a href="#"  class="wt-deleteinfo"  onclick = "onUpdateState('${ins.aac301 }',3,'${ins.aab101 }')">拒绝</a>
																</div>
																</td>
															</c:if>
															
															<c:if test = "${ins.aac305 == 1 }">
																<td>已置顶</td>
																<td>
																<div class="wt-actionbtn">
																	<a href="#"  class="wt-addinfo wt-skillsaddinfo"  onclick = "onUpdateState('${ins.aac301 }',2,'${ins.aab101 }')">取消</a>					
																</div>
																</td>
															</c:if>
															
															<c:if test = "${ins.aac305 == 2 }">
																<td>取消置顶</td>
																<td>
																<div class="wt-actionbtn">
																	<a href="#"  class="wt-addinfo wt-skillsaddinfo"  onclick = "onUpdateState('${ins.aac301 }',1,'${ins.aab101 }')">重新置顶</a>		
																</div>
																</td>
															</c:if>
															
															<c:if test = "${ins.aac305 == 3 }">
																<td>拒绝置顶</td>
																<td>
																	<div class="wt-actionbtn">
																	<a href="#" class="wt-addinfo wt-skillsaddinfo"  onclick = "onUpdateState('${ins.aac301 }',1,'${ins.aab101 }')">重新置顶</a>							
																	</div>
																</td>
															</c:if>
															
														</tr>													
													</c:forEach>
												</c:when>
											</c:choose>
											
										
										
										</tbody>
									</table>
									
									
								</div>
							</div>
						</div>
						
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-3">
							<aside id="wt-sidebar" class="wt-sidebar wt-dashboardsave">
								<div class="wt-proposalsr">
									<div class="wt-proposalsrcontent">
										<figure>
											<img src="images/thumbnail/img-17.png" alt="image">
										</figure>
										<div class="wt-title">
											<h3>${fn:length(rows)}</h3>
											<span>置顶帖子申请总数</span>
										</div>
									</div> 
								</div>																			
							</aside>					
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
	     
	   
		function onEdit(vaac101,vaab101)
		{
			var vform = document.getElementById("myform");
			vform.action = "<%=path%>/tiezi_findByIdTiezi.html?aac101=" + vaac101 + "&aab101=" + vaab101;
			vform.submit();
		}
		
		function onUpdateState(vaac301,vState,vaab101)
		{
			var vform = document.getElementById("myform");
			vform.action = "<%=path%>/placement_updatePlacement.html?aac301=" + vaac301 + "&aac305=" + vState +"&aab101=" + vaab101;
			vform.submit();
		}
	</script>
</body>
</html>
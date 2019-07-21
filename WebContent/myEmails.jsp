<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>我的邮件</title>
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
<link rel="stylesheet" href="css/dashboard.css">
<link rel="stylesheet" href="css/color.css">
<link rel="stylesheet" href="css/transitions.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/dbresponsive.css">
<style type="text/css">
.faccepted{
	display:none;
}
.srefused{
	display:none;
}
</style>
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
			<!--Header End-->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout"> <!--Sidebar Start-->
			<jsp:include page="userBtn.jsp"></jsp:include> <!--Sidebar Start--> <!--Register Form Start-->
			<section class="wt-haslayout">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-9">
						<div class="wt-haslayout wt-dbsectionspace">
							<div class="wt-dashboardbox wt-dashboardtabsholder">
								<div class="wt-dashboardboxtitle">
									<h2>我的邮件</h2>
								</div>
								<div class="wt-dashboardtabs"></div>
								<div class="wt-tabscontent tab-content">
									<div class="wt-addprojectsholder wt-tabsinfo">
										<div class="wt-tabscontenttitle wt-addnew">
											<h2>所有邮件</h2>
											<a href="#" onclick="updateAllEmail()">全部标为已读</a>
										</div>
										<ul class="wt-experienceaccordion accordion">
											<c:forEach items="${rows }" var="row" varStatus="vs">
												<li>
													<div class="wt-accordioninnertitle accordion-heading">
														<div class="wt-projecttitle accordion-toggle"
															data-toggle="collapse" data-target="#${row.aah101 }">
															<a style="color:${row.aah106==0?'#ff0000':'#777' }"
																onclick="updateEmail('${row.aah101}')"
																id="${row.aah101 }a"> ${row.aah103 } </a> 
														</div>
													</div>
													<div class="wt-collapseexp collapse navbar-collapse"
														id="${row.aah101 }" aria-labelledby="accordioninnertitle"
														data-parent="#accordion">
														<form class="wt-formtheme wt-userform wt-formprojectinfo">
														<div class="form-group form-group-half">
														<p>${row.aah104 }</p>
														</div>
														<div class="form-group form-group-half">
														<c:choose>
															<c:when test="${row.aah102==1 }">
																<a href="${row.aah202 }">点此查看</a>
															</c:when>
															<c:when test="${row.aah102==2 }">
																<c:if test="${row.aah204==0 }">
																	<div id="first${row.aah201 }">
																		<a onclick="accept('${row.aah201 }','${row.aah202 }')" href="#" class="wt-btn">同意</a>
																		<a onclick="refuse('${row.aah201 }','${row.aah203 }','${userId}')"  href="#" class="wt-btn">拒绝</a>
																	</div>	
																	<div id="second${row.aah201 }" class="faccepted"><span>已接受</span></div>
																	<div id="third${row.aah201 }"  class="srefused"><span>已拒绝</span></div>
																</c:if>
																<c:if test="${row.aah204==1 }">
																	<span>已接受</span>
																</c:if>
																<c:if test="${row.aah204==2 }">
																	<span>已拒绝</span>
																</c:if>
																<div></div>
															</c:when>
														</c:choose>
														</div>
														</form>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--Register Form End--> </main>
			<!--Main End-->
		</div>
		<!--Content Wrapper End-->
	</div>
	<!--Wrapper End-->
	<script src="js/vendor/jquery-3.3.1.js"></script>
	<script src="js/vendor/jquery-library.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script
		src="http://ditu.google.cn/maps/api/js?key=AIzaSyCR-KEWAVCn52mSdeVeTqZjtqbmVJyfSus&language=en"></script>
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
	<script type="js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript">
	//拒绝
	function refuse(aah201,aah203,aab101)
	{
		$.ajax({
			type: "POST",
			url: aah203,
			data : {
				'aah201' : aah201,
				'aa' : aab101
			},
			success : function(data) {
				document.getElementById("first"+aah201).style.display="none";
				document.getElementById("third"+aah201).style.display="block";
			},
			error : function(data) {
			},
		});
	}
	
	//接受
	function accept(aah201,aah202)
	{
		$.ajax({
			type: "POST",
			url: aah202,
			data : {
				'aab101' : '14',
				'aah201' : aah201
			},
			success : function(data) {
					if(data==0)
					{
						alert("您已在群组中!");
					}
					else if(data==1)
					{
						alert("加入成功")	
					}
					else if(data==2)
					{
						alert("该群组已解散!");
					}
					document.getElementById("first"+aah201).style.display="none";
					document.getElementById("second"+aah201).style.display="block";
			},
			error : function(data) {
			},
		});
	}
	
	/**
	*			点击邮件标题后改变邮件的颜色
	*			点击邮件标题后改变邮件状态为已读
	*/
	function updateAllEmail()
	{
		 <c:forEach items="${rows}" var="item" varStatus="status" >  
			 var aLink=document.getElementById(${item.aah101 }+"a");
			aLink.style="color:#777";
 		</c:forEach>   
 		$.ajax({
		    type: "POST",
		    url: "<%=path%>/email_updateAllEmail.html",
		data : {
			'aab101' : ${userId }
		},
		/* dataType: "json", */
		/* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
		success : function(data) {
		},
		error : function(data) {
		},
	});
	}
	
	function updateEmail(aah101)
	{
			var aLink=document.getElementById(aah101+"a");
			aLink.style="color:#777";
				$.ajax({
				    type: "POST",
				    url: "<%=path%>/email_updateEmail.html",
				data : {
					'aah101' : aah101
				},
				/* dataType: "json", */
				/* contentType: "application/x-www-form-urlencoded; charset=utf-8", */
				success : function(data) {
				},
				error : function(data) {
				},
			});
		}
	</script>
	<script>
		const menu_icon = document.querySelector('.menu-icon');
		function addClassFunThree() {
			this.classList.toggle("click-menu-icon");
		}
		menu_icon.addEventListener('click', addClassFunThree);
	</script>
</body>
</html>
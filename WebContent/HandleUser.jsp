<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath();%>
<html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<!-- 在这里输入用户名 -->
	<title>用户信息</title>
	
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
	
	<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/sendEmail.js"></script>
	<script type="text/javascript">
	var path = "<%=path %>";
	
	</script>
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
			<jsp:include page="head.jsp"></jsp:include>
			<!--Inner Home Banner Start-->
			<div class="wt-haslayout wt-innerbannerholder wt-innerbannerholdervtwo">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
						</div>
					</div>
				</div>
			</div>
			<!--Inner Home End-->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout wt-innerbgcolor">
			<!--Sidebar Start-->
				<!--Sidebar Start-->
				<div class="wt-main-section wt-paddingtopnull wt-haslayout">
					<!-- User Profile Start-->
					<div class="container">
						<div class="row">
							<div id="wt-twocolumns" class="wt-twocolumns wt-haslayout">
								<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 col-xl-8 float-left">
									<div class="wt-usersingle">
										
										<div class="wt-widget">
											<div class="wt-widgettitle">
												<h1><b>${ins.aab102 }的信息</b></h1>
											</div>
											<div class="wt-userprofile">
												<figure>
												<c:if test="${ins.aab115!=null }">
													<img src="${ins.aab115 }" alt="img description">
												</c:if>
												<c:if test="${ins.aab115==null }">
													<img alt="img description" src="images/wo.jpg">
												</c:if>
												</figure>
												<div class="wt-title">
													<h3 id="aab102">${ins.aab102 }</h3>
													<span>
														<p>------------------------------------------------</p>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab104">真实姓名：${ins.aab104 }</p></li>
															<li><p id="aab107">学号：${ins.aab107 }</p></li>
															<li><p id="aab113">信誉分：${ins.aab113 }</p></li>
														</ul>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab105">性别：${ins.cnaab105 }</p></li>
															<li><p id="aab109">民族：${ins.aab109 }</p></li>
															<li><p id="aab110">学校：${ins.aab110 }</p></li>
														</ul>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab111">联系号码：${ins.aab111 }</p></li>
															<li><p id="aab108">邮箱：${ins.aab108 }</p></li>
														</ul>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab114">我的签名:<span font="20">${ins.aab114 }</span></p></li>
														</ul>
														
													</span>
												</div>
												<div class="wt-description">																														
													<p> 举报人昵称:${ins.complainer } </p>
													<p> 举报类型:${ins.reason }  </p>
													<p> 举报理由:${ins.aaf106 }  </p>
													<p> 处理状态:${ins.hstatus }  </p>
													<p> 举报时间:${ins.aaf109 }</p>
												
													<c:if test="${ins.aaf108 == null }">																																	
														<p> 处理时间:未处理</p>																		
													</c:if>	
													<c:if test="${ins.aaf108 != null }">																																	
														<p> 处理时间:${ins.aaf108}</p>																		
													</c:if>	
													
													<c:if test="${ins.aaf107 == 1 }">																																	
														<p> 处理结果:${ins.aaf110 }</p>																		
													</c:if>	
										
												</div>
												
												<div class="wt-replaybox">	
													<c:if test="${ins.aaf107 == 0 }">																																
														<div class="form-group">
															<button class="wt-btn" type="submit" onclick="reducingUserCredit()">降低用户信誉积分</button>
														</div>	
														<div class="form-group">
															<button class="wt-btn" type="submit" onclick="changComplain()">举报非法</button>
														</div>																
													</c:if>												
																																		
													<div class="form-group">
														<button class="wt-btn" type="submit" onclick="returnAdminComplain()">返回</button>
													</div>																						
																					
												</div>
											</div>
										</div>
										
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-4 float-left">
									<aside id="wt-sidebar" class="wt-sidebar">
										
										<div class="wt-widget">
											<div class="wt-widgettitle">
												<h2>${ins.aab102 }的标签</h2>
											</div>
											<div class="wt-widgetcontent">
												<div class="wt-widgettag wt-widgettagvtwo">
													<a href="javascript:void(0);">${ins.aab112 }</a>
												</div>
											</div>
										</div>
									
									
										
									</aside>
								</div>
							</div>
						</div>
					</div>
					<!-- User Profile End-->
				</div>
			</main>
			<!--Main End-->
		</div>
		<!--Content Wrapper End-->
	</div>
	<!--Wrapper End-->
	
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post" id="handleForm">
		<input type="hidden" name="aaf101" id="aaf101" value="${ins.aaf101 }">
		<input type="hidden" name="aab101" id="aab101">
		<input type="hidden" name="aac101" id="aac101" value="${ins.aac101 }">	
	</form>	
	
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post" id="queryComplainForm">	
	</form>	

	<script src="js/vendor/jquery-3.3.1.js"></script>
	<script src="js/vendor/jquery-library.js"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/chosen.jquery.js"></script>
	<script src="js/tilt.jquery.js"></script>
	<script src="js/scrollbar.min.js"></script>
	<script src="js/prettyPhoto.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/readmore.js"></script>
	<script src="js/countTo.js"></script>
	<script src="js/appear.js"></script>
	<script src="js/tipso.js"></script>
	<script src="js/jRate.js"></script>
	<script src="js/main.js"></script>
	
	
	<script type="text/javascript">				
		function reducingUserCredit()
		{
			var vform = document.getElementById("handleForm");
			vform.action = "<%=path%>/complain_handlingUserComplain.html";
			vform.submit();
		}
		
		function changComplain()
		{
			var vform = document.getElementById("handleForm");
			vform.action = "<%=path%>/complain_handleComplainState.html";
			vform.submit();
		}
		
		function returnAdminComplain()
		{
			var vform = document.getElementById("queryComplainForm");
			vform.action = "<%=path%>/complain_complainQuery.html";
			vform.submit();
		}
	</script>
</body>
</html>

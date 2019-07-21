<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<!-- 在这里输入帖子名 -->
	<title>帖子举报处理</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="apple-touch-icon" href="apple-touch-icon.png">
	<link rel="icon" href="images/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/scrollbar.css">
	<link rel="stylesheet" href="css/fontawesome/fontawesome-all.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/tipso.css">
	<link rel="stylesheet" href="css/chosen.css">
	<link rel="stylesheet" href="css/prettyPhoto.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/color.css">
	<link rel="stylesheet" href="css/transitions.css">
	<link rel="stylesheet" href="css/responsive.css">
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
			<!--Inner Home Banner Start-->
			<div class="wt-haslayout wt-innerbannerholder">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
							<div class="wt-innerbannercontent">
								<div class="wt-title"><h2>留言举报处理</h2></div>							
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Inner Home End-->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout wt-innerbgcolor">
				<!--Categories Start-->
				<div class="wt-haslayout wt-main-section">
					<div class="container">
						<div class="row justify-content-md-center">
							<div class="col-12 col-sm-12 col-md-12 col-lg-12 float-left">
								<div class="wt-articlesingle-holder wt-bgwhite">
									<div class="wt-articlesingle-content">
										<div class="wt-title">
											<h2>留言内容:${ins.comment }</h2>
										</div>									
										<div class="wt-description">																														
											<p> 举报人昵称:${ins.complainer } </p>
											<p> 举报类型:${ins.reason }  </p>
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
													<button class="wt-btn" type="submit" onclick="deleteComment()">删除留言</button>
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
					</div>
				</div>
				<!--Limitless Experience End-->
			</main>
			<!--Main End-->
		</div>
		<!--Content Wrapper End-->
	</div>
	
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post" id="handleForm">
		<input type="hidden" name="aaf101" id="aaf101" value="${ins.aaf101 }">
		<input type="hidden" name="aab101" id="aab101">
		<input type="hidden" name="aac101" id="aac201" value="${ins.aac201 }">	
	</form>	
	
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post" id="queryComplainForm">	
	</form>	
	
	
	<!--Wrapper End-->
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
		function deleteComment()
		{
			var vform = document.getElementById("handleForm");
			vform.action = "<%=path%>/complain_handlingCommentComplain.html";
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
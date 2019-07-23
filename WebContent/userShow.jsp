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
	
	<!-- �����������û��� -->
	<title>�û���Ϣ</title>
	
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
	#complain_submit{
		color:orange;
	}
	#complain_submit:hover{
		color:white;
	}
	</style>
	<script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/sendEmail.js"></script>
	<script type="text/javascript">
	var path = "<%=path %>";
	function complainUser()
	{
		var http_request = getHttp_request();
	    
	    http_request.onreadystatechange = function(){
	        if (http_request.readyState == 4 )
	        {
	        	var result = http_request.responseText;
	        	if(result == "true")
	        	{
	        		alert("�ٱ��ɹ���");
	        	}
	        	else
	        	{
	        		alert("�ٱ�ʧ�ܣ�");
	        	}
	        }
	    }
	    var aab101 = "${userId }";
	    var aaf103 = "1";
	    var aaf104 = "${ins.aab101 }";
	    var aaf105 = $("#sel option:selected").val();
	    var aaf106 = encodeURI(encodeURI($("#complain_reason").val()));
	    http_request.open("POST", path + "/complain_ComplainAdd.html", true);
	    http_request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	    http_request.send("aab101=" + aab101 + "&aaf103=" + aaf103 + "&aaf104=" + aaf104 + "&aaf105=" + aaf105 + "&aaf106=" + aaf106);
	}
	
	
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
												<h1><b>${ins.aab102 }����Ϣ</b></h1>
											</div>
											<div class="wt-userprofile">
												<figure>
												<c:if test="${ins.aac115!=null }">
													<img src="${ins.aac115 }" alt="img description">
												</c:if>
												<c:if test="${ins.aac115==null }">
													<img alt="img description" src="images/wo.jpg">
												</c:if>
												</figure>
												<div class="wt-title">
													<h3 id="aab102">${ins.aab102 }</h3>
													<span>
														<p>------------------------------------------------</p>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab104">��ʵ������${ins.aab104 }</p></li>
															<li><p id="aab107">ѧ�ţ�${ins.aab107 }</p></li>
															<li><p id="aab113">�����֣�${ins.aab113 }</p></li>
														</ul>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab105">�Ա�${ins.cnaab105 }</p></li>
															<li><p id="aab109">���壺${ins.aab109 }</p></li>
															<li><p id="aab110">ѧУ��${ins.aab110 }</p></li>
														</ul>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab111">��ϵ���룺${ins.aab111 }</p></li>
															<li><p id="aab108">���䣺${ins.aab108 }</p></li>
														</ul>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><p id="aab114">�ҵ�ǩ��:<span font="20">${ins.aab114 }</span></p></li>
														</ul>
														<c:if test="${sessionScope.userId!=ins.aab101 }">
															<p>------------------------------------------------</p>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><b onclick="display(this, 'complain_')" class="wt-reportuser" 
																	onmousemove="onMoveIn(this)" onmouseout="onMoveOut(this)">�ٱ�</b></li>
														</ul>
														</c:if>
													</span>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-4 float-left">
									<aside id="wt-sidebar" class="wt-sidebar">
										
										<div class="wt-widget">
											<div class="wt-widgettitle">
												<h2>${ins.aab102 }�ı�ǩ</h2>
											</div>
											<div class="wt-widgetcontent">
												<div class="wt-widgettag wt-widgettagvtwo">
													<a href="javascript:void(0);">${ins.aab112 }</a>
												</div>
											</div>
										</div>
										
										<div id="complain_" class="wt-widget wt-reportjob" style="display:none">
											<div class="wt-widgettitle">
												<h2>�ٱ������û�</h2>
											</div>
											<div class="wt-widgetcontent">
												<form class="wt-formtheme wt-formreport">
													<fieldset>
														<div class="form-group">
															<span class="wt-select">
																<select id="sel">
																	<option value="01">����Υ�����ҷ��ɷ��������</option>
																	<option value="02">����й¶������˽��Ϣ������</option>
																	<option value="03">����������ˡ��̰����˵�����</option>
																	<option value="04">���ڿ�󡢹�������������</option>
																	<option value="05">����ɫ�顢���ࡢ���׵Ȳ�������</option>
																</select>
															</span>
														</div>
														<div class="form-group">
															<textarea type="text" id="complain_reason" class="form-control" placeholder="��д�ٱ�ԭ��"></textarea>
														</div>
														<div class="form-group wt-btnarea">
															<input type="button" onclick="complainUser()" class="wt-btn" id="complain_submit" value="�ύ"></input>
														</div>
													</fieldset>
												</form>
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
</body>
</html>
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
	<title>�û���ҳ</title>
	
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
	#modifyPwd_submit{
		color:orange;
	}
	#modifyPwd_submit:hover{
		color:white;
	}
	#modifyEmail_submit{
		color:orange;
	}
	#modifyEmail_submit:hover{
		color:white;
	}
	#modifyUser_submit{
		color:orange;
	}
	#modifyUser_submit:hover{
		color:white;
	}
	</style>
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
			
			
			
				<jsp:include page="userBtn.jsp"></jsp:include>
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
												<h1><b>�ҵ���Ϣ</b></h1>
											</div>
											<div class="wt-userprofile">
												<figure>
													<form action="user_uploadUserImage.html" name="userForm" id="userForm" method = "post" enctype="multipart/form-data">
														<label for="photo">
															<c:if test="${ins.imgpath == null }">
																<img src="images/profile/img-01.jpg" alt="img description" id="preview">
															</c:if>
															<c:if test="${ins.imgpath != null }">
																<img src="${ins.imgpath }" alt="img description" id="preview">
															</c:if>																									
												      		<input style="display: none;" type="file" name="photo" id = "photo" accept="image/png, image/jpeg, image/gif, image/jpg"/><br/>
												      		<input type="hidden" name="aab101" value="${sessionScope.userId }"> 
													      	
														</label>
													</form>
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
														<p>------------------------------------------------</p>
														<ul class="wt-userlisting-breadcrumb wt-userlisting-breadcrumbvtwo">
															<li><b onclick="display(this, 'modifyPwd')" class="wt-reportuser" 
																	onmousemove="onMoveIn(this)" onmouseout="onMoveOut(this)">�޸�����</b></li>
															<li><b onclick="display(this, 'modifyEmail')" class="wt-reportuser" 
																	onmousemove="onMoveIn(this)" onmouseout="onMoveOut(this)">���°�����</b></li>
															<li><b onclick="display(this, 'modifyUser')" class="wt-reportuser" 
																	onmousemove="onMoveIn(this)" onmouseout="onMoveOut(this)">�޸��ҵ���Ϣ</b></li>
														</ul>
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
												<h2>�ҵı�ǩ</h2>
											</div>
											<div class="wt-widgetcontent">
												<div class="wt-widgettag wt-widgettagvtwo">
													<a href="javascript:void(0);">${ins.aab112 }</a>
												</div>
											</div>
										</div>
										
										<div id="modifyPwd" class="wt-widget" style="display:none">
											<div class="wt-widgettitle">
												<h2>�޸�����</h2>
											</div>
											<div class="wt-widgetcontent">
												<form class="wt-formtheme wt-formreport" method="post">
													<fieldset>
														<div class="form-group">
															<input type="password" class="form-control" name="aab103" id="Pwd" placeholder="ԭʼ����"
																   onkeyup="checkPwd(this, 'modifyPwd_submit', 'alert_')"></input>
														</div>
														<p id="alert_" align="center"></p>
														<div class="form-group">
															<input type="password" class="form-control" name="Naab103" id="newPwd" placeholder="�µ�����"
															       onkeyup="checkPwd(this, 'modifyPwd_submit', 'alert_modify')"></input>
														</div>
														<p id="alert_modify" align="center"></p>
														<div class="form-group">
															<input type="password" class="form-control" name="Caab103" id="comfirmPwd" placeholder="ȷ���µ�����"
																   onkeyup="checkComfirmPwd(this, 'newPwd', 'modifyPwd_submit', 'alert_register_comfirm')"></input>
														</div>
														<p id="alert_register_comfirm" align="center"></p>
														<div class="form-group wt-btnarea">
															<input type="button" onclick="modifyPwd('${sessionScope.userId }')" class="wt-btn" id="modifyPwd_submit" value="�ύ"></input>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
								
										<div id="modifyEmail" class="wt-widget" style="display:none">
											<div class="wt-widgettitle">
												<h2>���°�����</h2>
											</div>
											<div class="wt-widgetcontent">
												<form class="wt-formtheme wt-formreport">
													<fieldset>
														<div class="form-group">
															<input type="email" id="New_mail" name="aab108" class="form-control" placeholder="�µ������ַ"></input>
														</div>
														<p align="center" id="send_code" onclick="SendEmail('New_mail', 1, '<%=path %>')">������֤��</p>
														<div class="form-group">
															<input type="text" name="ver" id="sec_code" class="form-control" placeholder="������֤��"></input>
														</div>
														<div class="form-group wt-btnarea">
															<input type="button" onclick="modifyEmail('${sessionScope.userId }')" class="wt-btn" id="modifyEmail_submit" value="�ύ"></input>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
										
										<div id="modifyUser" class="wt-widget" style="display:none">
											<div class="wt-widgettitle">
												<h2>�޸��ҵ���Ϣ</h2>
											</div>
											<div class="wt-widgetcontent">
											
												<form class="wt-formtheme wt-formreport">
													<fieldset>
														<div class="form-group">
															<input class="form-control" id="aab102_" placeholder="�����ǳ�"></input>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab104_" placeholder="������ʵ����"></input>
														</div>
														<div class="form-group">
															<span class="wt-select">
																<select id="aab105_">
																	<option value="1">�����е�</option>
																	<option value="2">����Ů��</option>
																	<option value="3">�Ҳ�ȷ��</option>
																</select>
															</span>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab107_" placeholder="����ѧ��"></input>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab109_" placeholder="����"></input>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab110_" placeholder="����ѧУ"></input>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab111_" placeholder="�����ֻ���"></input>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab112_" placeholder="��ϣ��չʾ�ı�ǩ"></input>
														</div>
														<div class="form-group">
															<input class="form-control" id="aab114_" placeholder="����ǩ��"></input>
														</div>
														<div class="form-group wt-btnarea">
															<input type="button" onclick="modifyUser('${sessionScope.userId }')" class="wt-btn" id="modifyUser_submit" value="�ύ"></input>
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
	
	<script type="text/javascript">
		var file=$("#photo");
		file.change(function () {
		    var vform = document.getElementById("userForm");
		    vform.submit();
		});
		
		function getObjectURL(file) {
		    var url = null;
		   	/* window.URL = window.URL || window.webkitURL;*/
		    if (window.createObjcectURL != undefined) {
		        url = window.createOjcectURL(file);
		    } else if (window.URL != undefined) {
		        url = window.URL.createObjectURL(file);
		    } else if (window.webkitURL != undefined) {
		        url = window.webkitURL.createObjectURL(file);
		    }
		    return url;
		}
	</script>
	
</body>
</html>
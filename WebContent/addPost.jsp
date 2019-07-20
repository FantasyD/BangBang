<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri = "http://org.wangxg/jsp/extl" prefix="e"%>
<%String path = request.getContextPath(); %>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>发布帖子</title>
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
	<!--Wrapper Start-->
	<div id="wt-wrapper" class="wt-wrapper wt-haslayout">
		<!--Content Wrapper Start-->
		<div class="wt-contentwrapper">
			<!--Header Start-->
			<jsp:include page="head.jsp"></jsp:include>
			<!--Header End-->
			<!--Inner Home Banner Start-->
			<div class="wt-haslayout wt-innerbannerholder">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
							<div class="wt-innerbannercontent">
							<div class="wt-title"><h2>${empty param.aac101?'帖子发布':'帖子修改' }</h2></div>
							<ol class="wt-breadcrumb">
								<li><a href="javascript:void(0);">主页</a></li>
								<li><a href="javascript:void(0);">帖子</a></li>
								<li><a href="javascript:void(0);">帖子详情</a></li>
								<li class="wt-active">${empty param.aac101?'帖子发布':'帖子修改' }</li>
							</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Inner Home End-->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout wt-innerbgcolor">
				<div class="wt-haslayout wt-main-section">
					<!-- User Listing Start-->
					<div class="container">
						<div class="row justify-content-md-center">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 push-lg-2">
								<div class="wt-jobalertsholder">
									<ul class="wt-jobalerts">
										
									</ul>
								</div>
								<div class="wt-proposalamount-holder">
									
									<div class="wt-title">
										<h2>帖子</h2>
									</div>
									<form class="wt-formtheme wt-formproposal"  action="<%=path%>/tiezi_addTiezi.html" name="vform" id="vform" method = "post" enctype="multipart/form-data">
										<fieldset>
											<div class="form-group">
												<input type="text" style="width: 100%" name = "aac102" placeholder="请输入帖子标题" value="${ins.aac102 }" required="required">
											</div>
											<input type="hidden" name="aac103" id="aac103Input" value="${ins.aac103}">									
											<div class="form-group">
												<span class="wt-select">										
													<select id="aac103" name="aac103">
														<option value="01">求购</option>
														<option value="02">代取</option>
														<option value="03">求信息</option>
														<option value="04">出售</option>
														<option value="05">求学习资料</option>
														<option value="06">其他</option>
													</select>
												</span>
											</div>
											
											<div class="form-group">
												<input type="number" style="width: 100%" name = "aac105" placeholder="请输入帖子酬劳" value="${ins.aac105 }">
											</div>	
											
											<div class="form-group">
												<input type="text" style="width: 100%" name = "aac106" placeholder="请输入帖子标签" value="${ins.aac106 }" required="required">
											</div>	
											
											<div class="form-group">
												<textarea class="form-control" name = "aac104" id="aac104" placeholder="请输入帖子内容" required="required" ></textarea>
											</div>
										</fieldset>
										<fieldset>
											<div class="wt-attachments wt-attachmentsvtwo">
												<div class="wt-title">
													<h3>Upload File (Optional)</h3>
													<label for="photo">
														<span><i class="lnr lnr-link"></i> Attach File(s)</span>
												      	<input type="file" name="photo" id = "photo"/><br/> 
													</label>
												</div>
												<img id="preview" src="" style = "width:192px;height:108px"/>
												<div class="wt-btnarea">
													<a href="#" onclick="deliverPost()" class="wt-btn">${empty param.aac101?'发布帖子':'修改帖子' }</a>
												</div>
											</div>
										</fieldset>
										
										<input type="hidden" name="aab101" value="${sessionScope.userId }">
										<input type="hidden" name="aac101" id="aac101" value="${ins.aac101 }">
										<input type="hidden" name="aah102" value="1">
										<input type="hidden" name="aah103" value="帖子推送">
										<input type="hidden" name="aah104" value="您关注的用户已经发送了帖子">
										
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- User Listing End-->
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
		$("#preview").hide();
		file.change(function () {
			$("#preview").show();
		    $("#preview").attr("src",getObjectURL(file[0].files[0]));
		});
		
		window.onload = function(){
			document.getElementById("aac103").value="${ins.aac103}";
			document.getElementById("aac104").value="${ins.aac104}";
			document.getElementById("aac104").innerHTML="${ins.aac104}";
	    }
		
		
		
		
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
		
		
		function deliverPost(){
			var aac101=document.getElementById("aac101").value;
			var vform=document.getElementById("vform");
			if(aac101==null||aac101==""){
				vform.action="<%=path%>/tiezi_addTiezi.html";
				vform.submit();
			}else{
				vform.action="<%=path%>/tiezi_modifyTiezi.html?";
				vform.submit();
			}
		}
	</script>
</body>
</html>
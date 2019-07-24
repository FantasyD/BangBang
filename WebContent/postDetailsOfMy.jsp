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
	<title>帖子详情</title>
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
		
		<jsp:include page="head.jsp"></jsp:include>
			<!--Inner Home Banner Start-->
			<div class="wt-haslayout wt-innerbannerholder">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
							<div class="wt-innerbannercontent">
								<div class="wt-title"><h2>帖子详情</h2></div>
								<ol class="wt-breadcrumb">
									<li>主页</li>
									<li><a href="#" onclick="returnQueryPost()">帖子</a></li>
									<li class="wt-active">帖子详情</li>
								</ol>
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
											<h2>${ins.aac102 }</h2>
										</div>
										<ul class="wt-postarticlemeta">
											<li>
												<a href="javascript:void(0);">
													<i class="lnr lnr-calendar-full"></i>
													<span>${ins.aac108 }</span>
												</a>
											</li>
											<li>
												<a href="javascript:void(0);">
													<i class="lnr lnr-user"></i>
													<span>${ins.cnaab102 }</span>
												</a>
											</li>
											<li>
												<c:if test="${ins.aac106 !=null }">
													<a href="javascript:void(0);">
														<i class="lnr lnr-tag"></i>
														<span>${ins.aac106 }</span>
													</a>
												</c:if>											
											</li>
											<li>
												<a href="javascript:void(0);">
													<i class="lnr lnr-tag"></i>
													<span>${ins.cnaac103 }帖</span>
												</a>
											</li>
										</ul>
										<div class="wt-description">	
											<div style="font-size: 23px;">							
											    ${ins.aac104 }
											</div>
											
											<br>
											<br>
											<c:if test="${ins.aac109!=null }">
												<figure class="wt-blogdetailimgvtwo wt-articlessingleone">
													<img src="${ins.aac109 }" id="postImage" class="test" style="width: 30%;" alt="image description">
													<div id="image-cover-modal" class="image-cover-modal">
													  <img id="image-cover-image" class="image-cover-modal-content" src="${ins.aac109 }">
													  <div id="image-cover-caption"></div>
													</div>
												</figure>
											</c:if>
											
										</div>
										<div class="wt-tagsshare">
											<div class="wt-tag wt-widgettag">
												<span>酬劳:</span>
												
													<a href="javascript:void(0);">${ins.aac105 }</a>
												
											</div>
											<ul class="wt-socialiconssimple wt-blogsocialicons">
												<li class="wt-sharejob"><span>分享帖子</span></li>
												<li class="wt-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook-f"></i></a></li>
												<li class="wt-twitter"><a href="javascript:void(0);"><i class="fab fa-twitter"></i></a></li>
												<li class="wt-linkedin"><a href="javascript:void(0);"><i class="fab fa-linkedin-in"></i></a></li>
												<li class="wt-clone"><a href="javascript:void(0);"><i class="far fa-clone"></i></a></li>
											</ul>
										</div>
										
										<c:choose>
											<c:when test="${rows!=null }">
												<c:forEach items="${rows }" var="comment" varStatus="vs" >
													<div class="wt-author">
														<div class="wt-authordetails">
															<figure>
																<c:if test="${comment.aab115==null }">
																	<a href="user_userDetails.html?aab101=${comment.aab101 }"><img src="images/author/img-01.jpg"  style="width:60px;height:60px;" alt="image description"></a>
																</c:if>
																<c:if test="${comment.aab115!=null }">
																	<a href="user_userDetails.html?aab101=${comment.aab101 }"><img src="${comment.aab115 }" style="width:60px;height:60px;" alt="image description"></a>
																</c:if>		
															</figure>
															<div class="wt-authorcontent">
																<div class="wt-authorhead">
																	<div class="wt-boxleft">
																		<h3><a href="user_userDetails.html?aab101=${comment.aab101 }">${comment.cnaab102}</a></h3>
																		<div style="font-size: 20px;">${comment.aac203 }</div>
																	</div>
																	<div class="wt-boxright">																
																		<a class="wt-btnreply" href="#" onclick="onDel(${comment.aac201})"><span class="wt-clickreply">删除</span><i class="fa fa-mail-reply"></i></a>																	
																	</div>
																</div>
																<div class="wt-description">
																	<span><i class="lnr lnr-clock"></i> <font size="50" color="grey">日期: ${comment.aac202 }</font></span>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:when>
										</c:choose>
						
										
										<div class="wt-replaybox">
											<h2>留言</h2>
											<form class="wt-formtheme wt-formleavecomment" action="<%=path%>/comment_addComment.html" method="post">
												<fieldset>
													<div class="form-group">
														<textarea name="aac203" class="form-control" placeholder="在这里输入您的留言"></textarea>
													</div>
													<div class="form-group">
														<button class="wt-btn" type="submit">发布</button>
													</div>
												</fieldset>
												
												<input type="hidden" name="type" value="${type }">									
												<input type="hidden" name="aac101" value="${ins.aac101 }">
												<input type="hidden" name="aab101" value="${sessionScope.userId }">										
												<input type="hidden" name="aah102" value="1">
												<input type="hidden" name="aah103" value="留言发布">
												<input type="hidden" name="aah104" value="有人回复了您的帖子">
											</form>
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
	
	<form action = "<%=path%>/tiezi_queryTiezi.html" method = "post" id="myForm">
		<e:hidden name="aab101" value="${sessionScope.userId }"/>
		<e:hidden name="pageNum" value="1"/>
		<input type="hidden" name="aac201" id="aac201">
		<input type="hidden" name="aac101" value="${ins.aac101 }">
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
		function returnQueryPost()
		{
			var vform = document.getElementById("myForm");
			vform.action = "<%=path%>/tiezi_queryTiezi.html";
			vform.submit();
		}
		
		function onDel(vaac101)
		{
			var vform = document.getElementById("myForm");
			document.getElementById("aac201").value=vaac101;
			vform.action="<%=path%>/comment_delByIdComment.html";
			vform.submit();
		} 
		
		
		// Get the DOM
		var modal = document.getElementById('image-cover-modal');
		var modalImg = document.getElementById("image-cover-image");
		var captionText = document.getElementById("image-cover-caption");
		var span = document.getElementsByClassName("image-cover-close")[0];

		// When the user clicks on <span> (x), close the modal
		modal.onclick = function() {
		    this.classList.remove("model-shown");
		}

	    var img = document.getElementById("postImage");

	    img.onclick = function(){
	        modal.classList.add("model-shown");
	        modalImg.src = this.src;
	        captionText.innerHTML = this.alt;
	    }
	</script>
	
	<style type='text/css'>
		.image-cover-modal {
		    display: flex;
		    align-items: center;
		    justify-content: center;
		    opacity: 0;
		    position: fixed;
		    z-index: 30;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgb(0,0,0);
		    background-color: rgba(0,0,0,0.9);
		    transition: opacity ease 0.3s;
		    pointer-events: none;
		}
		
		.model-shown {
		    pointer-events: all;
		    opacity: 1;
		}
		
		.image-cover-modal-content {
		    display: block;
		    max-width: 80%;
		    max-height: 80%;
		}
		
		#image-cover-caption {
		    display: block;
		    position: absolute;
		    width: 100%;
		    height: 3rem;
		    bottom: 0;
		    line-height: 3rem;
		    text-align: center;
		    color: #fff;
		    background: rgba(255, 255, 255, 0.33);
		}
		
		@media only screen and (max-width: 45rem){
		    .image-cover-modal-content {
		        max-width: 100%;
		        max-height: 100%;
		    }
		}
				
	</style>
</body>
</html>
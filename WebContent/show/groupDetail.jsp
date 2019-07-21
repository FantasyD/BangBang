<%@ page language="java"  pageEncoding="GBK"%>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>${ins.aae102 }的主页</title>
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
			<main id="wt-main" class="wt-main wt-haslayout">
				<!--Sidebar Start-->
				<jsp:include page="userBtn.jsp"></jsp:include>
				<!--Sidebar Start-->
				<!--Register Form Start-->
				<section class="wt-haslayout wt-dbsectionspace wt-proposals">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-9">
							<div class="wt-dashboardbox">
								<div class="wt-dashboardboxtitle">
									<h2>${ins.aae101 }</h2>
								</div>
								<div class="wt-dashboardboxcontent wt-rcvproposala">
									<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
										<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style mCS_img_loaded"></span>
										<div class="wt-userlistingcontent">
											<div class="wt-contenthead">
												<div class="wt-title">
													<i class="fa fa-check-circle"></i> ${ins.aae102 }
													<h2>${ins.aae107!=null&& ins.aae107!=''?ins.aae107:'该群组暂时没有描述'}</h2>
												</div>
												<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
													<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> ${ins.aae104}</span></li>
													<li><span>${ins.aae103!=null && ins.aae103!=''?ins.aae103:'该群组暂时没有签名'}</span></li>
												</ul>
												<ul>
													<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
													<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>
												</ul>
											</div>
											<div class="wt-rightarea">
												<div class="wt-hireduserstatus">
													<h4>06</h4><span>Proposals Received</span>
													<ul class="wt-hireduserimgs">
														<li><figure><img src="images/user/userlisting/img-02.jpg" alt="img description" class="mCS_img_loaded"></figure></li>
														<li><figure><img src="images/user/userlisting/img-03.jpg" alt="img description" class="mCS_img_loaded"></figure></li>
														<li><figure><img src="images/user/userlisting/img-01.jpg" alt="img description" class="mCS_img_loaded"></figure></li>
														<li><figure><img src="images/user/userlisting/img-02.jpg" alt="img description" class="mCS_img_loaded"></figure></li>
														<li><figure><img src="images/user/userlisting/img-05.jpg" alt="img description" class="mCS_img_loaded"></figure></li>
														<li><figure><img src="images/user/userlisting/img-01.jpg" alt="img description" class="mCS_img_loaded"></figure></li>
													</ul>
												</div>
											</div>
										</div>	
									</div>
									<div class="wt-freelancerholder wt-rcvproposalholder">
										<div class="wt-tabscontenttitle">
											<h2>Received Proposals</h2>
										</div>
										<div class="wt-managejobcontent">
											<div class="wt-userlistinghold wt-featured wt-proposalitem">
												<span class="wt-featuredtag"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style mCS_img_loaded"></span>
												<figure class="wt-userlistingimg">
													<img src="images/user/userlisting/img-01.jpg" alt="image description" class="mCS_img_loaded">
												</figure>
												<div class="wt-proposaldetails">
													<div class="wt-contenthead">
														<div class="wt-title">
															<a href="usersingle.html"> Alfredo Bossard</a>
														</div>
													</div>
													<div class="wt-proposalfeedback">
														<span class="wt-starsvtwo">
															<i class="fa fa-star fill"></i>
														</span>
														<span class="wt-starcontent"> 4.5/<i>5</i> <em> (860 Feedback)</em></span>
													</div>													
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Hire Now</a>
													</div>												
													<div class="wt-hireduserstatus">
														<h5>&#36;30</h5>
														<span>In 02 Months</span>
													</div>
													<div class="wt-hireduserstatus">
														<i class="far fa-envelope"></i>
														<span>Cover Letter</span>
													</div>														
													<div class="wt-hireduserstatus">
														<i class="fa fa-paperclip"></i>
														<span>03 file attached</span>
													</div>														
												</div>
											</div>	
											<div class="wt-userlistinghold wt-featured wt-proposalitem">
												<span class="wt-featuredtag wt-featuredtagcolor1"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
												<figure class="wt-userlistingimg">
													<img src="images/user/userlisting/img-02.jpg" alt="image description" class="mCS_img_loaded">
												</figure>
												<div class="wt-proposaldetails">
													<div class="wt-contenthead">
														<div class="wt-title">
															<a href="usersingle.html"> Alfredo Bossard
															</a>
														</div>
													</div>
													<div class="wt-proposalfeedback">
														<span class="wt-starsvtwo">
															<i class="fa fa-star fill"></i>
														</span>
														<span class="wt-starcontent"> 4.5/<i>5</i> <em> (860 Feedback)</em></span>
													</div>													
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Hire Now</a>
													</div>												
													<div class="wt-hireduserstatus">
														<h5>$06</h5>
														<span>In 02 Months</span>
													</div>
													<div class="wt-hireduserstatus">
														<i class="far fa-envelope"></i>
														<span>Cover Letter</span>
													</div>														
													<div class="wt-hireduserstatus">
														<i class="fa fa-paperclip"></i>
														<span>03 file attached</span>
													</div>														
												</div>
											</div>
											<div class="wt-userlistinghold wt-featured wt-proposalitem">
												<span class="wt-featuredtag wt-featuredtagcolor2"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
												<figure class="wt-userlistingimg">
													<img src="images/user/userlisting/img-03.jpg" alt="image description" class="mCS_img_loaded">
												</figure>
												<div class="wt-proposaldetails">
													<div class="wt-contenthead">
														<div class="wt-title">
															<a href="usersingle.html"> Alfredo Bossard
															</a>
														</div>
													</div>
													<div class="wt-proposalfeedback">
														<span class="wt-starsvtwo">
															<i class="fa fa-star fill"></i>
														</span>
														<span class="wt-starcontent"> 4.5/<i>5</i> <em> (860 Feedback)</em></span>
													</div>													
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Hire Now</a>
													</div>												
													<div class="wt-hireduserstatus">
														<h5>$06</h5>
														<span>In 02 Months</span>
													</div>
													<div class="wt-hireduserstatus">
														<i class="far fa-envelope"></i>
														<span>Cover Letter</span>
													</div>														
													<div class="wt-hireduserstatus">
														<i class="fa fa-paperclip"></i>
														<span>03 file attached</span>
													</div>														
												</div>
											</div>
											<div class="wt-userlistinghold wt-featured wt-proposalitem">
												<figure class="wt-userlistingimg">
													<img src="images/user/userlisting/img-07.jpg" alt="image description" class="mCS_img_loaded">
												</figure>
												<div class="wt-proposaldetails">
													<div class="wt-contenthead">
														<div class="wt-title">
															<a href="usersingle.html"> Alfredo Bossard
															</a>
														</div>
													</div>
													<div class="wt-proposalfeedback">
														<span class="wt-starsvtwo">
															<i class="fa fa-star fill"></i>
														</span>
														<span class="wt-starcontent"> 4.5/<i>5</i> <em> (860 Feedback)</em></span>
													</div>													
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Hire Now</a>
													</div>												
													<div class="wt-hireduserstatus">
														<h5>$06</h5>
														<span>In 02 Months</span>
													</div>
													<div class="wt-hireduserstatus">
														<i class="far fa-envelope"></i>
														<span>Cover Letter</span>
													</div>														
													<div class="wt-hireduserstatus">
														<i class="fa fa-paperclip"></i>
														<span>03 file attached</span>
													</div>														
												</div>
											</div>
											<div class="wt-userlistinghold wt-featured wt-proposalitem">
												<figure class="wt-userlistingimg">
													<img src="images/user/userlisting/img-04.jpg" alt="image description" class="mCS_img_loaded">
												</figure>
												<div class="wt-proposaldetails">
													<div class="wt-contenthead">
														<div class="wt-title">
															<a href="usersingle.html"> Alfredo Bossard
															</a>
														</div>
													</div>
													<div class="wt-proposalfeedback">
														<span class="wt-starsvtwo">
															<i class="fa fa-star fill"></i>
														</span>
														<span class="wt-starcontent"> 4.5/<i>5</i> <em> (860 Feedback)</em></span>
													</div>													
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Hire Now</a>
													</div>
													<div class="wt-hireduserstatus">
														<h5>$06</h5>
														<span>In 02 Months</span>
													</div>
													<div class="wt-hireduserstatus">
														<i class="far fa-envelope"></i>
														<span>Cover Letter</span>
													</div>														
													<div class="wt-hireduserstatus">
														<i class="fa fa-paperclip"></i>
														<span>03 file attached</span>
													</div>														
												</div>
											</div>		
										</div>										
									</div>
								</div>
								<nav class="wt-pagination wt-savepagination">
									<ul>
										<li class="wt-prevpage"><a href="javascrip:void(0);"><i class="lnr lnr-chevron-left"></i></a></li>
										<li><a href="javascrip:void(0);">1</a></li>
										<li><a href="javascrip:void(0);">2</a></li>
										<li><a href="javascrip:void(0);">3</a></li>
										<li><a href="javascrip:void(0);">4</a></li>
										<li><a href="javascrip:void(0);">...</a></li>
										<li><a href="javascrip:void(0);">50</a></li>
										<li class="wt-nextpage"><a href="javascrip:void(0);"><i class="lnr lnr-chevron-right"></i></a></li>
									</ul>
								</nav>								
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
	<script>
		const menu_icon = document.querySelector('.menu-icon');
		function addClassFunThree() {
	        this.classList.toggle("click-menu-icon");
	    }
	    menu_icon.addEventListener('click', addClassFunThree);
	</script>
</body>
</html>
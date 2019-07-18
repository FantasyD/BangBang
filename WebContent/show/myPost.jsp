<%@ page language="java" pageEncoding="GBK"%>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>我的帖子</title>
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
		
		<jsp:include page="head.jsp"></jsp:include>
		
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout">
				<!--Sidebar Start-->
				<div id="wt-sidebarwrapper" class="wt-sidebarwrapper">
					<div id="wt-btnmenutoggle" class="wt-btnmenutoggle">
						<span class="menu-icon">
							<em></em>
							<em></em>
							<em></em>
						</span>
					</div>
					<div id="wt-verticalscrollbar" class="wt-verticalscrollbar">
						<div class="wt-companysdetails wt-usersidebar">
							<figure class="wt-companysimg">
								<img src="images/sidebar/img-01.jpg" alt="img description">
							</figure>
							
							<!-- 用户名 -->
							<div class="wt-companysinfo">
								<figure><img src="images/sidebar/img-02.jpg" alt="img description"></figure>
								<div class="wt-title">
									<h2><a href="javascript:void(0);"> Louanne Mattioli</a></h2>
									<span>Amento Tech</span>
								</div>
							</div>
						</div>
						
						<nav id="wt-navdashboard" class="wt-navdashboard">
							<ul>
								<li>
									<a href="userInfo.jsp">
										<i class="ti-dashboard"></i>
										<span>我的主页</span>
									</a>
								</li>
								<li>
									<a href="myPost.jsp">
										<i class="ti-briefcase"></i>
										<span>我的帖子</span>
									</a>
								</li>
								<li>
									<a href="myGroups.jsp">
										<i class="ti-package"></i>
										<span>我的群组</span>
									</a>
								</li>
								<li>
									<a href="dashboard-managejobs.html">
										<i class="ti-announcement"></i>
										<span>Manage Jobs</span>
									</a>
								</li>
								<li class="wt-notificationicon menu-item-has-children">
									<a href="javascript:void(0);">
										<i class="ti-pencil-alt"></i>
										<span>Messages</span>
									</a>
									<ul class="sub-menu">
										<li><hr><a href="dashboard-messages.html">Messages</a></li>
										<li><hr><a href="dashboard-messages2.html">Messages V 2</a></li>
									</ul>
								</li>
								<li>
									<a href="dashboard-saveitems.html">
										<i class="ti-heart"></i>
										<span>My Saved Items</span>
									</a>
								</li>
								<li>
									<a href="dashboard-invocies.html">
										<i class="ti-file"></i>
										<span>Invoices</span>
									</a>
								</li>
								<li>
									<a href="dashboard-category.html">
										<i class="ti-layers"></i>
										<span>Category</span>
									</a>
								</li>
								<li>
									<a href="dashboard-packages.html">
										<i class="ti-money"></i>
										<span>Packages</span>
									</a>
								</li>
								<li>
									<a href="dashboard-proposals.html">
										<i class="ti-bookmark-alt"></i>
										<span>Proposals</span>
									</a>
								</li>
								<li>
									<a href="dashboard-accountsettings.html">
										<i class="ti-anchor"></i>
										<span>Account Settings</span>
									</a>
								</li>
								<li>
									<a href="dashboard-helpsupport.html">
										<i class="ti-tag"></i>
										<span>Help &amp; Support</span>
									</a>
								</li>
								<li>
									<a href="index.html">
										<i class="ti-shift-right"></i>
										<span>Logout</span>
									</a>
								</li>
							</ul>
						</nav>
						
					</div>
				</div>
				<!--Sidebar Start-->
				<!--Register Form Start-->
				<section class="wt-haslayout wt-dbsectionspace">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-9">
							<div class="wt-dashboardbox">
								<div class="wt-dashboardboxtitle">
									<h2>All Jobs</h2>
								</div>
								<div class="wt-dashboardboxcontent wt-canceljobholder">
									<div class="wt-tabscontenttitle">
										<h2>Cancel Jobs</h2>
									</div>
									<div class="wt-managejobcontent wt-verticalscrollbar">
										<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
											<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>I want some customization and installation on wordpress</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>
										<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
											<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>Develop a transportation company website</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>	
										<div class="wt-userlistinghold wt-userlistingvtwo">
											<span class="wt-featuredtag"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>Change temp to Arabic and install on wordpress</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>	
										<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
											<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>I want some customization and installation on wordpress</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>	
										<div class="wt-userlistinghold wt-userlistingvtwo">
											<span class="wt-featuredtag"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>Website changes in HTML &amp; PHP</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>
										<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
											<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>Develop a transportation company website</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>	
										<div class="wt-userlistinghold wt-userlistingvtwo">
											<span class="wt-featuredtag"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>Change temp to Arabic and install on wordpress</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>	
										<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
											<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>I want some customization and installation on wordpress</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
													</div>
												</div>
											</div>	
										</div>	
										<div class="wt-userlistinghold wt-userlistingvtwo">
											<span class="wt-featuredtag"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
											<div class="wt-userlistingcontent wt-userlistingcontentvtwo">
												<div class="wt-contenthead">
													<div class="wt-title">
														<a href="usersingle.html"><i class="fa fa-check-circle"></i> Louanne Mattioli</a>
														<h2>Website changes in HTML &amp; PHP</h2>
													</div>
													<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
														<li><span class="wt-dashboraddoller"><i class="fa fa-dollar-sign"></i> Professional</span></li>
														<li><span><img src="images/flag/img-04.png" alt="img description"> England</span></li>
														<li><a href="javascript:void(0);" class="wt-clicksavefolder"><i class="far fa-folder"></i> Type: Per Fixed</a></li>
														<li><span class="wt-dashboradclock"><i class="far fa-clock"></i> Duration: 15 Days</span></li>				
													</ul>
												</div>
												<div class="wt-rightarea">
													<div class="wt-btnarea">
														<a href="javascript:void(0);" class="wt-btn">Repost</a>
														<a href="javascript:void(0);" class="wt-cancelbtn">Delete</a>
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
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 col-xl-3">
							<aside id="wt-sidebar" class="wt-sidebar wt-dashboardsave">
								<div class="wt-proposalsr">
									<div class="wt-proposalsrcontent">
										<figure>
											<img src="images/thumbnail/img-17.png" alt="image">
										</figure>
										<div class="wt-title">
											<h3>150</h3>
											<span>Total Ongoing Jobs</span>
										</div>
									</div> 
								</div>
								<div class="wt-proposalsr">
									<div class="wt-proposalsrcontent wt-componyfolow">
										<figure>
											<img src="images/thumbnail/img-16.png" alt="image">
										</figure>
										<div class="wt-title">
											<h3>1406</h3>
											<span>Total Completed Jobs</span>
										</div>
									</div> 
								</div>								
								<div class="wt-proposalsr">
									<div class="wt-proposalsrcontent  wt-freelancelike">
										<figure>
											<img src="images/thumbnail/img-15.png" alt="image">
										</figure>
										<div class="wt-title">
											<h3>2075</h3>
											<span>Total Cancelled Jobs</span>
										</div>
									</div> 
								</div>								
							</aside>
							<div class="wt-companyad">
								<figure class="wt-companyadimg"><img src="images/add-img.jpg" alt="img description"></figure>
								<span>Advertisement  255px X 255px</span>
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
<%@ page language="java"  pageEncoding="GBK"%>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>xxx</title>
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
									<h2>Invocies</h2>
									<form class="wt-formtheme wt-formsearch">
										<fieldset>
											<div class="form-group">
												<input type="text" name="Search" class="form-control" placeholder="Search Here">
												<a href="javascrip:void(0);" class="wt-searchgbtn"><i class="lnr lnr-magnifier"></i></a>
											</div>
										</fieldset>
									</form>
								</div>
								<div class="wt-dashboardboxcontent wt-categoriescontentholder wt-categoriesholder">
									<table class="wt-tablecategories">
										<thead>
											<tr>
												<th>
													<span class="wt-checkbox">
														<input id="wt-name" type="checkbox" name="head">
														<label for="wt-name"></label>
													</span>
												</th>
												<th>Invoice ID</th>
												<th>Purchase Date</th>
												<th>Expiry Date</th>
												<th>Amount</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-namea" type="checkbox" name="head">
														<label for="wt-namea"></label>
													</span>
												</td>
												<td>w6FUUKqSJ3gePjsD</td>
												<td>February 3, 2019</td>
												<td>February 3, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name1" type="checkbox" name="head">
														<label for="wt-name1"></label>
													</span>
												</td>
												<td>CrtDNFnJVm7w8kFA</td>
												<td>February 15, 2019</td>
												<td>February 15, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name2" type="checkbox" name="head">
														<label for="wt-name2"></label>
													</span>
												</td>
												<td>4JppL9xYXRsSvUy9</td>
												<td>February 16, 2019</td>
												<td>February 16, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name3" type="checkbox" name="head">
														<label for="wt-name3"></label>
													</span>
												</td>
												<td>ArnP5mD2PdKcxYJJ</td>
												<td>February 27, 2019</td>
												<td>February 27, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name4" type="checkbox" name="head">
														<label for="wt-name4"></label>
													</span>
												</td>
												<td>5UP9JaLDpAxn6b6Z</td>
												<td>February 17, 2019</td>
												<td>February 17, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name5" type="checkbox" name="head">
														<label for="wt-name5"></label>
													</span>
												</td>
												<td>Npc2SHPfBW2ejwKy</td>
												<td>February 28, 2019</td>
												<td>February 28, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name6" type="checkbox" name="head">
														<label for="wt-name6"></label>
													</span>
												</td>
												<td>edaTuQwUE3yYd7TC</td>
												<td>February 27, 2019</td>
												<td>February 27, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name7" type="checkbox" name="head">
														<label for="wt-name7"></label>
													</span>
												</td>
												<td>S6R4DR7gbWp3SH4W</td>
												<td>February 28, 2019</td>
												<td>February 28, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name8" type="checkbox" name="head">
														<label for="wt-name8"></label>
													</span>
												</td>
												<td>gp8SNHXPVmpe3zan</td>
												<td>April 4, 2019</td>
												<td>April 4, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name9" type="checkbox" name="head">
														<label for="wt-name9"></label>
													</span>
												</td>
												<td>FnNLrYywx88N3rXA</td>
												<td>April 4, 2019</td>
												<td>April 4, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name10" type="checkbox" name="head">
														<label for="wt-name10"></label>
													</span>
												</td>
												<td>8fJHdFjCD6NgNcCF</td>
												<td>April 20, 2019</td>
												<td>April 20, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name11" type="checkbox" name="head">
														<label for="wt-name11"></label>
													</span>
												</td>
												<td>6dUQ4ynF8N2cDdAb</td>
												<td>April 30, 2019</td>
												<td>April 30, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name12" type="checkbox" name="head">
														<label for="wt-name12"></label>
													</span>
												</td>
												<td>CnsKMrpu8mEJCX9k</td>
												<td>May 7, 2019</td>
												<td>May 7, 2019</td>
												<td>$24.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<span class="wt-checkbox">
														<input id="wt-name13" type="checkbox" name="head">
														<label for="wt-name13"></label>
													</span>
												</td>
												<td>CtecgGDdkh9LUuf6</td>
												<td>May 25, 2019</td>
												<td>May 25, 2019</td>
												<td>$19.00</td>
												<td>
													<div class="wt-actionbtn">
														<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo">view</a>
														<a href="javascript:void(0);" class="wt-deleteinfo">Print</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<nav class="wt-pagination">
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
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-3 float-left">
							<div class="wt-dashboardboxcontent wt-offersidebar wt-dashboardbox-margin">
								<figure><img src="images/save-img-01.jpg" alt="img description"></figure>
								<div class="wt-offercontent">
									<h2>Save Big, Do Big</h2>
									<p>Consectetur adipisicing elitems sed dotem eiusmod tempor incune utnaem labore etdolore maigna aliqua enim.</p>
									<a href="javascript:void(0);" class="wt-btn">Renew Now</a>
								</div>
							</div>
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
	<script>
		const menu_icon = document.querySelector('.menu-icon');
		function addClassFunThree() {
	        this.classList.toggle("click-menu-icon");
	    }
	    menu_icon.addEventListener('click', addClassFunThree);
	     $('.wt-tablecategories').basictable({
		    breakpoint: 767,
		});
	</script>
</body>
</html>
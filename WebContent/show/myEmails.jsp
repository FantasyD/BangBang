<%@ page language="java"  pageEncoding="GBK"%>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
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
				<section class="wt-haslayout">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-9">
							<div class="wt-haslayout wt-dbsectionspace">
								<div class="wt-dashboardbox wt-dashboardtabsholder">
									<div class="wt-dashboardboxtitle">
										<h2>我的邮件</h2>
									</div>
									<div class="wt-tabscontent tab-content">
										<div class="wt-awardsholder tab-pane fade" id="wt-awards">
											<div class="wt-addprojectsholder wt-tabsinfo">
												<div class="wt-tabscontenttitle wt-addnew">
													<h2>Add Your Projects</h2>
													<a href="javascript:void(0);">Add New</a>
												</div>
												<ul class="wt-experienceaccordion accordion">
													<li>
														<div class="wt-accordioninnertitle">
															<div class="wt-projecttitle collapsed" data-toggle="collapse" data-target="#innertitleaone">
																<figure><img src="images/thumbnail/img-11.jpg" alt="img description"></figure>
																<h3>Project Title Here<span>www.themeforest.net</span></h3>
															</div>
															<div class="wt-rightarea">
																<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo" data-toggle="collapse" data-target="#innertitleaone"><i class="lnr lnr-pencil"></i></a>
																<a href="javascript:void(0);" class="wt-deleteinfo"><i class="lnr lnr-trash"></i></a>
															</div>
														</div>
														<div class="wt-collapseexp collapse" id="innertitleaone" aria-labelledby="accordioninnertitle" data-parent="#accordion">
															<form class="wt-formtheme wt-userform wt-formprojectinfo">
																<fieldset>
																	<div class="form-group form-group-half">
																		<input type="text" name="Project Title" class="form-control" placeholder="Project Title">
																	</div>
																	<div class="form-group form-group-half">
																		<input type="text" name="Project URL" class="form-control" placeholder="Project URL">
																	</div>
																	<div class="form-group form-group-label wt-infouploading">
																		<div class="wt-labelgroup">
																			<label for="filen">
																				<span class="wt-btn">Select Files</span>
																				<input type="file" name="file" id="filen">
																			</label>
																			<span>Drop files here to upload</span>
																			<em class="wt-fileuploading">Uploading<i class="fa fa-spinner fa-spin"></i></em>
																		</div>
																	</div>
																	<div class="form-group">
																		<ul class="wt-attachfile">
																			<li class="wt-uploading">
																				<span>Logo.jpg</span>
																				<em>File size: 300 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Wireframe Document.doc</span>
																				<em>File size: 512 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Requirments.pdf</span>
																				<em>File size: 110 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Company Intro.docx</span>
																				<em>File size: 224 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																		</ul>
																	</div>
																	<div class="form-group wt-btnarea">
																		<a href="javascript:void(0);" class="wt-btn">Save</a>
																	</div>
																</fieldset>
															</form>
														</div>
													</li>
													<li>
														<div class="wt-accordioninnertitle">
															<div class="wt-projecttitle collapsed" data-toggle="collapse" data-target="#innertitlebone">
																<figure><img src="images/thumbnail/img-12.jpg" alt="img description"></figure>
																<h3>Project Title Here<span>www.themeforest.net</span></h3>
															</div>
															<div class="wt-rightarea">
																<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo" data-toggle="collapse" data-target="#innertitlebone"><i class="lnr lnr-pencil"></i></a>
																<a href="javascript:void(0);" class="wt-deleteinfo"><i class="lnr lnr-trash"></i></a>
															</div>
														</div>
														<div class="wt-collapseexp collapse show" id="innertitlebone" aria-labelledby="accordioninnertitle1" data-parent="#accordion">
															<form class="wt-formtheme wt-userform wt-formprojectinfo">
																<fieldset>
																	<div class="form-group form-group-half">
																		<input type="text" name="Project Title" class="form-control" placeholder="Project Title">
																	</div>
																	<div class="form-group form-group-half">
																		<input type="text" name="Project URL" class="form-control" placeholder="Project URL">
																	</div>
																	<div class="form-group form-group-label wt-infouploading">
																		<div class="wt-labelgroup">
																			<label for="filet">
																				<span class="wt-btn">Select Files</span>
																				<input type="file" name="file" id="filet">
																			</label>
																			<span>Drop files here to upload</span>
																			<em class="wt-fileuploading">Uploading<i class="fa fa-spinner fa-spin"></i></em>
																		</div>
																	</div>
																	<div class="form-group">
																		<ul class="wt-attachfile">
																			<li class="wt-uploading">
																				<span>Logo.jpg</span>
																				<em>File size: 300 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Wireframe Document.doc</span>
																				<em>File size: 512 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Requirments.pdf</span>
																				<em>File size: 110 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Company Intro.docx</span>
																				<em>File size: 224 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																		</ul>
																	</div>
																	<div class="form-group wt-btnarea">
																		<a href="javascript:void(0);" class="wt-btn">Save</a>
																	</div>
																</fieldset>
															</form>
														</div>
													</li>
													<li>
													<div class="wt-accordioninnertitle">
														<div class="wt-projecttitle collapsed" data-toggle="collapse" data-target="#innertitlecone">
															<figure><img src="images/thumbnail/img-13.jpg" alt="img description"></figure>
															<h3>Project Title Here<span>www.themeforest.net</span></h3>
														</div>
														<div class="wt-rightarea">
															<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo" data-toggle="collapse" data-target="#innertitlecone"><i class="lnr lnr-pencil"></i></a>
															<a href="javascript:void(0);" class="wt-deleteinfo"><i class="lnr lnr-trash"></i></a>
														</div>
													</div>
													<div class="wt-collapseexp collapse" id="innertitlecone" aria-labelledby="accordioninnertitle1" data-parent="#accordion">
														<form class="wt-formtheme wt-userform wt-formprojectinfo">
															<fieldset>
																<div class="form-group form-group-half">
																	<input type="text" name="Project Title" class="form-control" placeholder="Project Title">
																</div>
																<div class="form-group form-group-half">
																	<input type="text" name="Project URL" class="form-control" placeholder="Project URL">
																</div>
																<div class="form-group form-group-label wt-infouploading">
																	<div class="wt-labelgroup">
																		<label for="fileb">
																			<span class="wt-btn">Select Files</span>
																			<input type="file" name="file" id="fileb">
																		</label>
																		<span>Drop files here to upload</span>
																		<em class="wt-fileuploading">Uploading<i class="fa fa-spinner fa-spin"></i></em>
																	</div>
																</div>
																<div class="form-group">
																	<ul class="wt-attachfile">
																		<li class="wt-uploading">
																			<span>Logo.jpg</span>
																			<em>File size: 300 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																		</li>
																		<li>
																			<span>Wireframe Document.doc</span>
																			<em>File size: 512 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																		</li>
																		<li>
																			<span>Requirments.pdf</span>
																			<em>File size: 110 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																		</li>
																		<li>
																			<span>Company Intro.docx</span>
																			<em>File size: 224 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																		</li>
																	</ul>
																</div>
																<div class="form-group wt-btnarea">
																	<a href="javascript:void(0);" class="wt-btn">Save</a>
																</div>
															</fieldset>
														</form>
													</div>
													</li>
												</ul>
											</div>
											<div class="wt-addprojectsholder">
												<div class="wt-tabscontenttitle wt-addnew">
													<h2>Add Your Awards</h2>
													<a href="javascript:void(0);">Add New</a>
												</div>
												<ul class="wt-experienceaccordion accordion">
													<li>
														<div class="wt-accordioninnertitle">
															<div class="wt-projecttitle collapsed" data-toggle="collapse" data-target="#innertitleawone">
																<figure><img src="images/thumbnail/img-08.jpg" alt="img description"></figure>
																<h3>Awards Title Here<samp>Apr 27, 2016</samp></h3>
															</div>
															<div class="wt-rightarea">
																<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo" data-toggle="collapse" data-target="#innertitleawone"><i class="lnr lnr-pencil"></i></a>
																<a href="javascript:void(0);" class="wt-deleteinfo"><i class="lnr lnr-trash"></i></a>
															</div>
														</div>
														<div class="wt-collapseexp collapse" id="innertitleawone" aria-labelledby="accordioninnertitle" data-parent="#accordion">
															<form class="wt-formtheme wt-userform wt-formprojectinfo">
																<fieldset>
																	<div class="form-group form-group-half">
																		<input type="text" name="Awards" class="form-control" placeholder="Award Title">
																	</div>
																	<div class="form-group form-group-half">
																		<input type="text" name="awards" class="form-control" placeholder="Award Date">
																	</div>
																	<div class="form-group form-group-label wt-infouploading">
																		<div class="wt-labelgroup">
																			<label for="file">
																				<span class="wt-btn">Select Files</span>
																				<input type="file" name="file" id="file">
																			</label>
																			<span>Drop files here to upload</span>
																			<em class="wt-fileuploading">Uploading<i class="fa fa-spinner fa-spin"></i></em>
																		</div>
																	</div>
																	<div class="form-group">
																		<ul class="wt-attachfile">
																			<li class="wt-uploading">
																				<span>Logo.jpg</span>
																				<em>File size: 300 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Wireframe Document.doc</span>
																				<em>File size: 512 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Requirments.pdf</span>
																				<em>File size: 110 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Company Intro.docx</span>
																				<em>File size: 224 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																		</ul>
																	</div>
																	<div class="form-group wt-btnarea">
																		<a href="javascript:void(0);" class="wt-btn">Save</a>
																	</div>
																</fieldset>
															</form>
														</div>
													</li>
													<li>
														<div class="wt-accordioninnertitle">
															<div class="wt-projecttitle collapsed" data-toggle="collapse" data-target="#innertitlebwone">
																<figure><img src="images/thumbnail/img-08.jpg" alt="img description"></figure>
																<h3>Awards Title Here<samp>Apr 27, 2016</samp></h3>
															</div>
															<div class="wt-rightarea">
																<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo" data-toggle="collapse" data-target="#innertitlebwone"><i class="lnr lnr-pencil"></i></a>
																<a href="javascript:void(0);" class="wt-deleteinfo"><i class="lnr lnr-trash"></i></a>
															</div>
														</div>
														<div class="wt-collapseexp collapse show" id="innertitlebwone" aria-labelledby="accordioninnertitle1" data-parent="#accordion">
															<form class="wt-formtheme wt-userform wt-formprojectinfo">
																<fieldset>
																	<div class="form-group form-group-half">
																		<input type="text" name="Award Title" class="form-control" placeholder="Award Title">
																	</div>
																	<div class="form-group form-group-half">
																		<input type="text" name="Award Date" class="form-control" placeholder="Award Date">
																	</div>
																	<div class="form-group form-group-label wt-infouploading">
																		<div class="wt-labelgroup">
																			<label for="filea">
																				<span class="wt-btn">Select Files</span>
																				<input type="file" name="file" id="filea">
																			</label>
																			<span>Drop files here to upload</span>
																			<em class="wt-fileuploading">Uploading<i class="fa fa-spinner fa-spin"></i></em>
																		</div>
																	</div>
																	<div class="form-group">
																		<ul class="wt-attachfile">
																			<li class="wt-uploading">
																				<span>Logo.jpg</span>
																				<em>File size: 300 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Wireframe Document.doc</span>
																				<em>File size: 512 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Requirments.pdf</span>
																				<em>File size: 110 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Company Intro.docx</span>
																				<em>File size: 224 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																		</ul>
																	</div>
																	<div class="form-group wt-btnarea">
																		<a href="javascript:void(0);" class="wt-btn">Save</a>
																	</div>
																</fieldset>
															</form>
														</div>
													</li>
													<li>
														<div class="wt-accordioninnertitle">
															<div class="wt-projecttitle collapsed" data-toggle="collapse" data-target="#innertitlecwone">
																<figure><img src="images/thumbnail/img-09.jpg" alt="img description"></figure>
																<h3>Awards Title Here<samp>Apr 27, 2016</samp></h3>
															</div>
															<div class="wt-rightarea">
																<a href="javascript:void(0);" class="wt-addinfo wt-skillsaddinfo" data-toggle="collapse" data-target="#innertitlecwone"><i class="lnr lnr-pencil"></i></a>
																<a href="javascript:void(0);" class="wt-deleteinfo"><i class="lnr lnr-trash"></i></a>
															</div>
														</div>
														<div class="wt-collapseexp collapse" id="innertitlecwone" aria-labelledby="accordioninnertitle1" data-parent="#accordion">
															<form class="wt-formtheme wt-userform wt-formprojectinfo">
																<fieldset>
																	<div class="form-group form-group-half">
																		<input type="text" name="Award Title" class="form-control" placeholder="Award Title">
																	</div>
																	<div class="form-group form-group-half">
																		<input type="text" name="Award Date" class="form-control" placeholder="Award Date">
																	</div>
																	<div class="form-group form-group-label wt-infouploading">
																		<div class="wt-labelgroup">
																			<label for="filec">
																				<span class="wt-btn">Select Files</span>
																				<input type="file" name="file" id="filec">
																			</label>
																			<span>Drop files here to upload</span>
																			<em class="wt-fileuploading">Uploading<i class="fa fa-spinner fa-spin"></i></em>
																		</div>
																	</div>
																	<div class="form-group">
																		<ul class="wt-attachfile">
																			<li class="wt-uploading">
																				<span>Logo.jpg</span>
																				<em>File size: 300 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Wireframe Document.doc</span>
																				<em>File size: 512 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Requirments.pdf</span>
																				<em>File size: 110 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																			<li>
																				<span>Company Intro.docx</span>
																				<em>File size: 224 kb<a href="javascript:void(0);" class="lnr lnr-cross"></a></em>
																			</li>
																		</ul>
																	</div>
																	<div class="form-group wt-btnarea">
																		<a href="javascript:void(0);" class="wt-btn">Save</a>
																	</div>
																</fieldset>
															</form>
														</div>
													</li>
												</ul>
											</div>										
										</div>
									</div>
								</div>
							</div>
							<div class="wt-updatall">
								<i class="ti-announcement"></i>
								<span>Update all the latest changes made by you, by just clicking on “Save &amp; Continue” button.</span>
								<a class="wt-btn" href="javascript:void(0);">Save &amp; Update</a>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 col-xl-3">
							<div class="wt-haslayout wt-dbsectionspace wt-codescansidebar">
								<div class="tg-authorcodescan wt-codescanholder">
									<figure class="tg-qrcodeimg">
										<img src="images/qrcode.png" alt="img description">
									</figure>
									<div class="tg-qrcodedetail">
										<span class="lnr lnr-laptop-phone"></span>
										<div class="tg-qrcodefeat">
											<h3>Scan with your <span>Smart Phone </span> To Get It Handy.</h3>
										</div>
									</div>
									<div class="wt-codescanicons">
										<span>Share Your Profile</span>
										<ul class="wt-socialiconssimple">
											<li class="wt-facebook"><a href="javascript:void(0);"><i class="fa fa-facebook-f"></i></a></li>
											<li class="wt-twitter"><a href="javascript:void(0);"><i class="fab fa-twitter"></i></a></li>
											<li class="wt-linkedin"><a href="javascript:void(0);"><i class="fab fa-linkedin-in"></i></a></li>
											<li class="wt-clone"><a href="javascript:void(0);"><i class="far fa-clone"></i></a></li>
										</ul>
									</div>
								</div>
								<div class="wt-companyad">
									<figure class="wt-companyadimg"><img src="images/add-img.jpg" alt="img description"></figure>
									<span>Advertisement  255px X 255px</span>
								</div>
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
	</script>
</body>
</html>
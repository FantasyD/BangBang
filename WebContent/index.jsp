<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path = request.getContextPath(); %>

<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>校园互助平台</title>
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

<body class="wt-login" onLoad="goPage(1,5);">

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
		
		<!-- 导入导航栏 -->
		<jsp:include page="head.jsp"></jsp:include>
		
		
			<!--Inner Home Banner Start-->
			<div class="wt-haslayout wt-innerbannerholder">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
							<div class="wt-innerbannercontent">
							<div class="wt-title"><h2>帖子</h2></div>
							<ol class="wt-breadcrumb">
								<li><a href="#">主页</a></li>
								<li class="wt-active">帖子</li>
							</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Inner Home End-->
			<!--Main Start-->
			<main id="wt-main" class="wt-main wt-haslayout wt-innerbgcolor">
				<!--Two Columns Start-->
				<div class="wt-haslayout wt-main-section">
					<div class="container">
						<div class="row">
							<div id="wt-twocolumns" class="wt-twocolumns wt-haslayout">
								<div class="col-xs-12 col-sm-12 col-md-5 col-lg-5 col-xl-4 float-left">
									<aside id="wt-sidebar" class="wt-sidebar">
										<div class="wt-widget wt-startsearch">
											<div class="wt-widgettitle">
												<h2>搜索</h2>
											</div>
											<div class="wt-widgetcontent">
												<form class="wt-formtheme wt-formsearch">
													<fieldset>
														<div class="form-group">

															<input type="text" name="Search" class="form-control" placeholder="输入帖子关键词">

															<a href="javascrip:void(0);" class="wt-searchgbtn"><i class="lnr lnr-magnifier"></i></a>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
										<div class="wt-widget wt-categoriesholder">
											<div class="wt-widgettitle">
												<h2>帖子类型</h2>
											</div>
											<div class="wt-widgetcontent">
												<ul class="wt-categoriescontent">
													<li><a href="javascript:void(0);">求购 <em>15325</em></a></li>
													<li><a href="javascript:void(0);">代取 <em>562748</em></a></li>
													<li><a href="javascript:void(0);">求信息 <em>3488</em></a></li>
													<li><a href="javascript:void(0);">出售 <em>86452</em></a></li>
													<li><a href="javascript:void(0);">求学习资料  <em>325</em></a></li>
													<li><a href="javascript:void(0);">其他 <em>886548</em></a></li>
												</ul>
											</div>
										</div>
										<div class="wt-widget wt-widgetarticlesholder">
											<div class="wt-widgettitle">
												<h2>置顶帖</h2>
											</div>
											<div class="wt-widgetcontent">
												
												<c:choose>
													<c:when test="${rows!=null }">												
														<c:forEach items="${rows }" var="ins" varStatus="vs">
															<c:if test="${ins.aac305==1 }">
																<div class="wt-particlehold">
																	<figure>
																	<c:if test="${ins.imgpath==null }">
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="images/thumbnail/img-01.jpg" alt="image description">
																		</a>
																	</c:if>
																	<c:if test="${ins.imgpath!=null }">
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="${ins.imgpath }" alt="image description">
																		</a>
																	</c:if>
																	</figure>
																	<div class="wt-particlecontent">
																		<h3><a href="#" onclick = "onEdit('${ins.aac101 }')">${ins.aac102 }</a></h3>
																		<span><i class="lnr lnr-clock"></i> ${ins.aac108 }</span>
																	</div>
																</div>
															</c:if>
														</c:forEach>
													</c:when>
												</c:choose>
												
												

											</div>
										</div>
										<div class="wt-widget wt-widgettagshold">
											<div class="wt-widgettitle">
												<h2>自定义标签</h2>
											</div>
											<div class="wt-widgetcontent">
												<div class="wt-widgettag">
													<a href="javascript:void(0);">DIY</a>
													<a href="javascript:void(0);">武汉大学</a>
													<a href="javascript:void(0);">商业</a>
													<a href="javascript:void(0);">90后</a>
													<a href="javascript:void(0);">00后</a>
													<a href="javascript:void(0);">背包客</a>
													<a href="javascript:void(0);">发烧友</a>
												</div>
											</div>
										</div>
									</aside>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 col-xl-8 float-left">
									<div class="wt-classicaricle-holder">
										<div class="wt-classicaricle-header">
											<div class="wt-title">
												<h2>精品帖</h2>
											</div>
											<div class="wt-description">
												<p>我们为您准备了一些您可能感兴趣的帖子</p>
											</div>
										</div>
										<div class="wt-article-holder">
											<!-- 以下为每个帖子所需要的css样式配件 -->
											<c:choose>
												<c:when test="${rows!=null }">
													
													<table id="idData">
														<c:forEach items="${rows }" var="ins" varStatus="vs">
														<c:if test="${ins.aac305!=1 }">
														<tr>													
															<div class="wt-article" id="div${vs.count }">
																<c:if test="${ins.imgpath!=null }">
																	<figure>
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="${ins.imgpath }"  style="height:432px;width:768px" alt="img description">
																		</a>
																	</figure>
																</c:if>
																<c:if test="${ins.imgpath==null }">
																	<figure>
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="images/20.jpg" style="height:432px;width:768px"  alt="img description">
																		</a>
																	</figure>
																</c:if>
																<div class="wt-articlecontent">
																	<div class="wt-title">
																		<h2><a href="#" onclick = "onEdit('${ins.aac101 }')">${ins.aac102 }</a></h2>
																	</div>
																	<ul class="wt-postarticlemeta">
																		<li>
																			<a href="javascript:void(0);">
																			 	<i class="lnr lnr-clock"></i>
																				<span>${ins.aac108 }</span>
																			</a>
																		</li>
																		<li>
																			<a href="javascript:void(0);">
																				<i class="lnr lnr-user"></i>
																				<span>${ins.cnaab102 }</span>
																			</a>
																		</li>
																	</ul>
																</div>
															</div>					
														</tr>
														</c:if>
														</c:forEach>
													</table>
													
													<table width="60%" align="right" >
														<tr><td><div id="barcon" name="barcon"></div></td></tr>
													</table>
												</c:when>
											</c:choose>

						
										</div>
										
										<table width="60%" align="right" >
											<tr><td><div id="barcon" name="barcon"></div></td></tr>
										</table>
										

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Two Columns End-->
			</main>
			<!--Main End-->
		</div>
		<!--Content Wrapper End-->
	</div>

	
	<!-- 以下用来存放需要传递给后台的数据 -->
	<form id = "myform">
		<input type="hidden" name="aac101" id="aac101">
		<input type="hidden" name="type" value="1">
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
		/**
		 * 分页函数
		 * pno--页数
		 * psize--每页显示记录数
		 * 分页部分是从真实数据行开始，因而存在加减某个常数，以确定真正的记录数
		 * 纯js分页实质是数据行全部加载，通过是否显示属性完成分页功能
		 **/
		function goPage(pno,psize){
		  var itable = document.getElementById("idData");
		  var num = itable.rows.length;//表格所有行数(所有记录数)
		  console.log(num);
		  var totalPage = 0;//总页数
		  var pageSize = psize;//每页显示行数
		  //总共分几页
		  if(num/pageSize > parseInt(num/pageSize)){
		      totalPage=parseInt(num/pageSize)+1;
		    }else{
		      totalPage=parseInt(num/pageSize);
		    }
		  var currentPage = pno;//当前页数
		  var startRow = (currentPage - 1) * pageSize+1;//开始显示的行 31
		  var endRow = currentPage * pageSize;//结束显示的行  40
		    endRow = (endRow > num)? num : endRow;  //40
		    console.log(endRow);
		    //遍历显示数据实现分页
		  for(var i=1;i<(num+1);i++){
		    if(i>=startRow && i<=endRow){
		    	document.getElementById("div"+i).style.display = "block";
		    }else{
		    	document.getElementById("div"+i).style.display = "none";
		    }
		  }
		  var tempStr = "共"+num+"条记录 分"+totalPage+"页 当前第"+currentPage+"页";
		  if(currentPage>1){
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">首页</a>";
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\"><上一页</a>"
		  }else{
		    tempStr += "首页";
		    tempStr += "<上一页";
		  }
		  if(currentPage<totalPage){
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">下一页></a>";
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">尾页</a>";
		  }else{
		    tempStr += "下一页>";
		    tempStr += "尾页";
		  }
		  document.getElementById("barcon").innerHTML = tempStr;
		}

		function onEdit(vaac101)
		{
			var vform = document.getElementById("myform");
			document.getElementById("aac101").value = vaac101;
			vform.action = "<%=path%>/tiezi_findByIdTiezi.html";
			vform.submit();
		}
	</script>

</body>
</html>
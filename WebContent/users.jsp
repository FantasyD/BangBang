<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->	<html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>用户查询结果</title>
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
<body class="wt-login" onload="goPage(1,5);">
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
				<!--Register Form Start-->
				<section class="wt-haslayout wt-dbsectionspace">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-xl-9">
							<div class="wt-dashboardbox">
								<div class="wt-dashboardboxtitle">
									<h2>查询结果</h2>
								</div>
								<div class="wt-dashboardboxcontent wt-jobdetailsholder">
									<div class="wt-freelancerholder">
										<div class="wt-managejobcontent wt-verticalscrollbar mCustomScrollbar _mCS_1">
										<c:choose>
											<c:when test="${rows!=null }">
												<table id="idData">
													<c:forEach items="${rows }" var="ins" varStatus="vs">
												<tr>
												<div class="wt-userlistinghold wt-featured wt-userlistingvtwo" id="div${vs.count }">
												<span class="wt-featuredtag wt-featuredtagcolor3"><img src="images/featured.png" alt="img description" data-tipso="Plus Member" class="template-content tipso_style"></span>
												<div class="wt-userlistingcontent">
													<div class="wt-contenthead">
														<div class="wt-title">
															<i class="fa fa-check-circle"></i>${ins.aab102 }
															<h2>学号：${ins.aab107 }</h2>
														</div>
														<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
															<li>姓名：${ins.aab104 }</li>
															<li>性别：${ins.cnaab105 }</li>
															<li>民族：${ins.aab109 }</li>
														</ul>
														<br>
														<br>
														<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
															<li>学校：${ins.aab110 }</li>
															<li>邮箱：${ins.aab108 }</li>
															<li>信誉分：${ins.aab113 }</li>
														</ul>
													</div>
													<div class="wt-rightarea">
														<div class="wt-btnarea">
															<a href="user_userDetails.html?aab101=${ins.aab101 }" class="wt-btn">VIEW DETAILS</a>
														</div>
														<div class="wt-hireduserstatus">
															<ul class="wt-hireduserimgs">
																<li>
																<c:if test="${ins.aab115!=null }">
																<figure>
																<a href="user_userDetails.html?aab101=${ins.aab101 }">
																<img src="${ins.aab115 }" alt="img description">
																</a>
																</figure>
																</c:if>
																<c:if test="${ins.aab115==null }">
																<figure>
																<a href="user_userDetails.html?aab101=${ins.aab101 }">
																<img src="images/profile/img-01.jpg" alt="img description">
																</a>
																</figure>
																</c:if>
																</li>
															</ul>
														</div>
													</div>
												</div>	
											</div>
												</tr>
												</c:forEach>
												</table>
												<table width="60%" align="right" >
													<tr><td><div id="barcon" name="barcon"></div></td></tr>
												</table>
											</c:when>
											<c:otherwise>
												<div>
													<div class="alert alert-info">
														<a class="close" data-dismiss="alert">x</a>
														<strong>没有符合条件的用户</strong>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
								<!-- 以下为分页操作 -->
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
	
	</script>
</body>
</html>
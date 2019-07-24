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
	<title>У԰����ƽ̨</title>
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
		<script type="text/javascript">	
		function s2() 
		{
			var form2=document.getElementById("form2");
			form2.action = "<%=path%>/tiezi_searchTiezi.html";
			form2.submit();
		}
	</script>
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
		
		<!-- ���뵼���� -->
		<jsp:include page="head.jsp"></jsp:include>
		
		
			<!--Inner Home Banner Start-->
			<div class="wt-haslayout wt-innerbannerholder">
				<div class="container">
					<div class="row justify-content-md-center">
						<div class="col-xs-12 col-sm-12 col-md-8 push-md-2 col-lg-6 push-lg-3">
							<div class="wt-innerbannercontent">
							<div class="wt-title"><h2>����</h2></div>
							<ol class="wt-breadcrumb">
								<li class="wt-active">����</li>
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
												<h2>����</h2>
											</div>
											<div class="wt-widgetcontent">
												<form class="wt-formtheme wt-formsearch" id="form2" method="post">
													<fieldset>
														<div class="form-group">
															<input type="text" name="message" class="form-control" placeholder="�������ӹؼ���">
															<a href="#" class="wt-searchgbtn" onclick="s2()"><i class="lnr lnr-magnifier"></i></a>
														</div>
													</fieldset>
												</form>
											</div>
										</div>
							
										<div class="wt-widget wt-widgetarticlesholder">
											<div class="wt-widgettitle">
												<h2>�ö���</h2>
											</div>
											<div class="wt-widgetcontent">
												
												<c:choose>
													<c:when test="${rows!=null }">												
														<c:forEach items="${rows }" var="ins" varStatus="vs">
															<c:if test="${ins.aac305==1 }">
																<div class="wt-particlehold">
																	<figure>
																	<c:if test="${ins.aac109==null }">
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="images/thumbnail/img-01.jpg" alt="image description">
																		</a>
																	</c:if>
																	<c:if test="${ins.aac109!=null }">
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="${ins.aac109 }" style="width: 65px;height: 65px;" alt="image description">
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
												<h2>�Զ����ǩ</h2>
											</div>
											<div class="wt-widgetcontent">
												<div class="wt-widgettag">
													<a href="javascript:void(0);">DIY</a>
													<a href="javascript:void(0);">�人��ѧ</a>
													<a href="javascript:void(0);">��ҵ</a>
													<a href="javascript:void(0);">90��</a>
													<a href="javascript:void(0);">00��</a>
													<a href="javascript:void(0);">������</a>
													<a href="javascript:void(0);">������</a>
												</div>
											</div>
										</div>
									</aside>
								</div>
								<c:set var="rowsIsEmpty" value="1" />										
								<c:forEach items="${rows }" var="ins" varStatus="vs">												
									<c:if test="${ins.aac305!=1 }">
										<c:set var="rowsIsEmpty" value="0" />	
									</c:if>														
								</c:forEach>
								<div class="col-xs-12 col-sm-12 col-md-7 col-lg-7 col-xl-8 float-left">
									<div class="wt-classicaricle-holder">
										<div class="wt-classicaricle-header">
											<div class="wt-title">
												<c:if test="${rowsIsEmpty == 0}">
													<h2>��Ʒ��</h2>
												</c:if>									
											</div>
											<div class="wt-description">
												<c:if test="${rowsIsEmpty == 0}">
													<p>����Ϊ��׼����һЩ�����ܸ���Ȥ������</p>
												</c:if>	
												
											</div>
										</div>
										<div class="wt-article-holder">
											<!-- ����Ϊÿ����������Ҫ��css��ʽ��� -->
											
											<c:choose>
												<c:when test="${rows!=null }">
													
													<table id="idData">
														<c:forEach items="${rows }" var="ins" varStatus="vs">
														<c:if test="${ins.aac305!=1 }">
														<tr>													
															<div class="wt-article" id="div${vs.count }">
																<c:if test="${ins.aac109!=null }">
																	<figure>
																		<a href="#" onclick = "onEdit('${ins.aac101 }')">
																			<img src="${ins.aac109 }"  style="width:100%;height:60%" alt="img description">
																		</a>
																	</figure>
																</c:if>
																<c:if test="${ins.aac109==null }">
																	<figure>
																		
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
																			<a href="user_userDetails.html?aab101=${ins.aab101 }">
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
													
												</c:when>
												
												
												
																							
											</c:choose>
											
																						
											
													
											
											<c:if test="${rowsIsEmpty == 0}">
												<table width="60%" align="right" >
													<tr><td><div id="barcon" name="barcon"></div></td></tr>
												</table>
											</c:if>													
																						
											<c:if test="${rowsIsEmpty == 1 }">															
												<div class="wt-jobalerts">
													<div class="alert alert-primary alert-dismissible fade show">
														<em>Message:</em> <span> û�з�������������</span>
														<a href="javascript:void(0)" class="close" data-dismiss="alert" aria-label="Close"><i class="fa fa-close"></i></a>
													</div>
												</div>
											</c:if>
										</div>
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
	<!-- �������������Ҫ���ݸ���̨������ -->
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
		 * ��ҳ����
		 * pno--ҳ��
		 * psize--ÿҳ��ʾ��¼��
		 * ��ҳ�����Ǵ���ʵ�����п�ʼ��������ڼӼ�ĳ����������ȷ�������ļ�¼��
		 * ��js��ҳʵ����������ȫ�����أ�ͨ���Ƿ���ʾ������ɷ�ҳ����
		 **/
		function goPage(pno,psize){
		  var itable = document.getElementById("idData");
		  var num = itable.rows.length;//�����������(���м�¼��)
		  var totalPage = 0;//��ҳ��
		  var pageSize = psize;//ÿҳ��ʾ����
		  //�ܹ��ּ�ҳ
		  if(num/pageSize > parseInt(num/pageSize)){
		      totalPage=parseInt(num/pageSize)+1;
		    }else{
		      totalPage=parseInt(num/pageSize);
		    }
		  var currentPage = pno;//��ǰҳ��
		  var startRow = (currentPage - 1) * pageSize+1;//��ʼ��ʾ���� 31
		  var endRow = currentPage * pageSize;//������ʾ����  40
		    endRow = (endRow > num)? num : endRow;  //40		  
		    //������ʾ����ʵ�ַ�ҳ
		  for(var i=1;i<(num+1);i++){
		    if(i>=startRow && i<=endRow){
		    	document.getElementById("div"+i).style.display = "block";
		    }else{
		    	document.getElementById("div"+i).style.display = "none";
		    }
		  }
		  var tempStr = "��"+num+"����¼ ��"+totalPage+"ҳ ��ǰ��"+currentPage+"ҳ";
		  if(currentPage>1){
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(1)+","+psize+")\">��ҳ</a>";
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage-1)+","+psize+")\"><��һҳ</a>"
		  }else{
		    tempStr += "��ҳ";
		    tempStr += "<��һҳ";
		  }
		  if(currentPage<totalPage){
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(currentPage+1)+","+psize+")\">��һҳ></a>";
		    tempStr += "<a href=\"#\" onClick=\"goPage("+(totalPage)+","+psize+")\">βҳ</a>";
		  }else{
		    tempStr += "��һҳ>";
		    tempStr += "βҳ";
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
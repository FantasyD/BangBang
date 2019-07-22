<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	Map<String, String> ins = (Map<String, String>) request.getAttribute("ins");
	boolean isCreater = (session.getAttribute("userId").equals(ins.get("aab101")));
%>
<!doctype html>
<!--[if lt IE 7]>		<html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>			<html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>			<html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="">
<!--<![endif]-->
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${ins.aae102 }����ҳ</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="icon" href="images/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="css/bootstrap.css">
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
#updateInfo {
	display: none;
	position: absolute;
	top: 10%;
	left: 10%;
	width: 80%;
	height: 80%;
	border: 16px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

#numberForm {
	display: none;
	position: absolute;
	top: 20%;
	left: 20%;
	width: 40%;
	height: 30%;
	border: 16px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}

#result{
	display: none;
	position: absolute;
	top: 10%;
	left: 10%;
	width: 80%;
	height: 80%;
	border: 16px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>

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
			<main id="wt-main" class="wt-main wt-haslayout"> <!--Sidebar Start-->
			<jsp:include page="userBtn.jsp"></jsp:include> <!--Sidebar Start--> <!--Register Form Start-->
			<section class="wt-haslayout wt-dbsectionspace wt-proposals">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-9">
						<div class="wt-dashboardbox">
							<div class="wt-dashboardboxtitle">
								<h2>Ⱥ����Ϣ</h2>
							</div>
							<div class="wt-dashboardboxcontent wt-rcvproposala">
								<div class="wt-userlistinghold wt-featured wt-userlistingvtwo">
									<span class="wt-featuredtag wt-featuredtagcolor3"><img
										src="images/featured.png" alt="img description"
										data-tipso="Plus Member"
										class="template-content tipso_style mCS_img_loaded"></span>
									<div class="wt-userlistingcontent">
										<div class="wt-contenthead">
											<div class="wt-title">
												<img class="img-circle"
													src="${ins.aae105!=null && ins.aae105!=''?ins.aae105:'upload/index.jpg'}"
													width="30px" height="30px" alt="ͷ��" /> ${ins.aae102 }
												<h2>${ins.aae107!=null&& ins.aae107!=''?ins.aae107:'��Ⱥ����ʱû������'}</h2>
											</div>
											<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
												<li><span class="wt-dashboraddoller"><i
														class="fa fa-dollar-sign"></i> ${ins.aae104}</span></li>
												<li><span>${ins.aae103!=null && ins.aae103!=''?ins.aae103:'��Ⱥ����ʱû��ǩ��'}</span></li>
											</ul>
											<form id="quit" method="post">
												<e:hidden name="aah102" value="0" />
												<e:hidden name="aah103" value="Ⱥ���ɢ����" />
												<e:hidden name="aah104" value="Ⱥ��: ${ins.aae102 }�ѱ������߽�ɢ!" />
												<e:hidden name="aae101" value="${ins.aae101 }" />
												<e:hidden name="aab101" value="${userId }"/>
											</form>
											<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
												<c:forEach items="${rows }" var="row" varStatus="vs">
													<c:if test="${row.aab101==userId }">
														<li><a href="#" onclick="updateIsClick()">�޸�</a></li>
														<li><a href="#" onclick="inviteIsClicked()">����</a></li>
														<c:choose>
															<c:when test="<%=isCreater%>">
																<li><a href="#" onclick="delGroupIsClick()">��ɢ</a></li>
															</c:when>
															<c:otherwise>
																<li><a href="#" onclick="quitIsClick()">�˳�</a></li>
															</c:otherwise>
														</c:choose>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
								<div class="wt-freelancerholder wt-rcvproposalholder">
									<div class="wt-tabscontenttitle">
										<h2>��Ա</h2>
									</div>
									<div class="wt-managejobcontent">
										<c:forEach items="${rows }" var="row" varStatus="vs">

											<div class="wt-userlistinghold wt-featured wt-proposalitem">
												<c:choose>
													<c:when test="${row.aab101==ins.aab101 }">
														<span class="wt-featuredtag"> <img
															src="images/featured.png" alt="img description"
															data-tipso="Plus Member"
															class="template-content tipso_style mCS_img_loaded">
														</span>
													</c:when>
													<c:otherwise>
														<span class="wt-featuredtag wt-featuredtagcolor2">
															<img src="images/featured.png" alt="img description"
															data-tipso="Plus Member"
															class="template-content tipso_style">
														</span>
													</c:otherwise>
												</c:choose>
												<figure class="wt-userlistingimg">
													<img class="img-circle"
														src="${row.aab115!=null && row.aab115!=''?row.aab115:'upload/index.jpg'}"
														width="30px" height="30px" alt="image description" />
												</figure>
												<div class="wt-proposaldetails">
													<div class="wt-contenthead">
														<div class="wt-title">
															<a href="usersingle.html"> ${row.aab102 }</a>
														</div>
													</div>
												</div>
												<c:if test="${row.aab101!=ins.aab101 }">
													<c:if test="<%=isCreater%>">
														<div class="wt-rightarea">
															<div class="wt-btnarea">
																<a herf="#" onclick="delMember('${row.aab101}')"
																	class="wt-btn">ɾ��</a>
															</div>
															<div class="wt-hireduserstatus">
																<i class="fa fa-paperclip"></i> <span><a href="#"
																	onclick="transfered('${row.aab101}')">ת��</a></span>
															</div>
														</div>
														<form id="empty" method="post">
															<e:hidden name="aae101" value="${ins.aae101 }" />
														</form>
													</c:if>
												</c:if>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="updateInfo">
						<h2 align="center">Ⱥ����Ϣ</h2>
						<form method="post" enctype="multipart/form-data" role="form">
							<table border="1" align="center" width="50%">
								<tr>
									<td>Ⱥ����:</td>
									<td><e:text name="aae102" required="true"
											defval="${ins.aae102 }" autofocus="true" maxlength="30" /></td>
								</tr>
								<tr>
									<td>ͷ��:</td>
									<td><input type="file" name="photo" id="photo" /></td>
								</tr>
								<tr>
									<td>Ⱥ��ǩ��:</td>
									<td><e:text name="aae103" defval="${ins.aae103 }"
											maxlength="30" /></td>
								</tr>
								<tr>
									<td>Ⱥ����ϸ����:</td>
									<td><e:textarea rows="10" cols="25" name="aae107"
											defval="${ins.aae107 }" /></td>
									<e:hidden name="aae101" value="${ins.aae101 }" />
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										name="next" value="�޸�" class="btn btn-default"
										formaction="<%=path%>/group_updateGroup.html"> <input
										type="button" onclick="closeDiv()" value="ȡ��"
										class="btn btn-default"></td>
								</tr>
							</table>
						</form>

					</div>
					<div id="invite">
						<form id="numberForm" method="post">
							<div class="form-group">
								����������������û���: <input type="text" id="invitedNumber" name="aab101">
								<div class="form-group wt-btnarea">
									<input type="button" onclick="inviteConfirm()" value="ȷ��"
										class="btn btn-default"> <input type="button"
										onclick="closeInviteDiv()" value="ȡ��" class="btn btn-default">
								</div>
						</form>
					</div>
					<div id="result" class="modal">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">��ѡ�������û�</h4>
							<a href="<%=path %>/group_findGroup.html?aae101=${ins.aae101}" class="close">&times;</a>
						</div>
						 <div class="modal-body" id="results">
						</div>
					</div>

				</div>
			</section>
			<!--Register Form End--> </main>
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
	
	  //��ʾ���ص��޸�DIV
  	function updateIsClick()
  	{
  			var infoForm=document.getElementById("updateInfo");
  			infoForm.style.display="block";
  			infoForm.style.width = document.body.scrollWidth; 
  	 		// bgdiv.style.height = $(document).height();
  			 $("#"+updateInfo).height($(document).height());
  	}
  	//�����޸�DIV
  	function closeDiv()
		{
  			var infoForm=document.getElementById("updateInfo");
			infoForm.style.display="none";
		}
  	//ת�ô��������
  	function transfered(aab101)
  	{
	    		if(confirm("ȷ��Ҫ�����������ת�ø�����Ա��"))
  			{
  					var trans=document.getElementById("empty");
  					trans.action="<%=path%>/group_transferGroup.html?aab101="+aab101;
  					trans.submit();
  			}
  	}
  	//ɾ����Ա
  	function delMember(aab101)
  	{
	    		if(confirm("ȷ��Ҫɾ������Ա��"))
  			{
  					var dels=document.getElementById("empty");
  					dels.action="<%=path%>/group_delGroupMember.html?aab101="+aab101;
  					dels.submit();
  			}
  	}
  	//�˳���Ⱥ��
  	function quitIsClick()
  	{
  			if(confirm("��ȷ��Ҫ�˳���Ⱥ����"))
  			{
  					var quitBtn=document.getElementById("quit");
	    				quitBtn.action="<%=path%>/group_quitGroup.html?aab101="+${userId };
						quitBtn.submit();
				}
		}
  	
  	//��ɢ��Ⱥ��
  	function delGroupIsClick()
  	{
  			if(confirm("��ȷ��Ҫ��ɢ��Ⱥ��"))
  			{
  					var delBtn=document.getElementById("quit");
  					delBtn.action="<%=path%>/group_delGroup.html";
					delBtn.submit();
					alert("��ɢ�ɹ�! ");
  			}
  	}
		//��ʾ���ص�����DIV
		function inviteIsClicked()
		{
			var infoForm = document.getElementById("numberForm");
			infoForm.style.display = "block";
		}
		
		//��������DIV
		function closeInviteDiv()
		{
			var infoForm = document.getElementById("numberForm");
			infoForm.style.display = "none";
		}
		
		//�����û�
		function inviteConfirm()
		{
			var user=document.getElementById("invitedNumber").value;
				$.ajax({
					type: "POST",
					url: "<%=path%>/group_findUserByName.html",
					data : {
						'aab102' : encodeURIComponent(user)
					},
					success : function(data) {
						$("#results").load("${pageContext.request.contextPath}/inviteMember.jsp");
						var info = document.getElementById("result");
						info.style.display="block";
					},
					error : function(data) {
					},
				});
		}
		
		function invite(aab101)
		{
			var tag=true;
		    <c:forEach items="${rows}" var="item" varStatus="status" >  
	        	if(${item.aab101}==aab101)	
	        	{
	        		 tag=false;
	        	}
	    	</c:forEach>   
	    	if(tag)
			{
	    		$.ajax({
					type: "POST",
					url: "<%=path%>/group_inviteToGroup.html",
					data : {
						'aab101' : aab101,
						'aah202' : '${pageContext.request.contextPath}/group_acceptInvite.html?aae101=${ins.aae101 }',
						'aah203' : '${pageContext.request.contextPath}/group_refuseInvite.html?aab101=${userId }',
						'aae101' : '${ins.aae101 }',
						'aah102' : '2',
						'aah103' : encodeURIComponent('Ⱥ������'),
						'aah104' : encodeURIComponent('�û�${userName }����������Ⱥ�飺${ins.aae102 }')
					},
					success : function(data) {
						alert("����ɹ�")
					},
					error : function(data) {
					},
				});
			}
			else
			{
				alert("���û�����Ⱥ����");
			}
		}
	</script>
	<script>
		const menu_icon = document.querySelector('.menu-icon');
		function addClassFunThree() 
		{
	        this.classList.toggle("click-menu-icon");
	    }
	    menu_icon.addEventListener('click', addClassFunThree);
	</script>
</body>
</html>
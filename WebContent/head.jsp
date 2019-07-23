<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/iziToast.min.css">
	<link rel="stylesheet" href="css/demo.css">
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script src="js/iziToast.min.js" type="text/javascript"></script>
    <script type="text/javascript">
		function s() 
		{
			var form1=document.getElementById("form1");
			var value=$('#type input[name="searchtype"]:checked').val();
			if (value=='2') 
			{
				form1.action = "<%=path%>/user_searchUser.html";
				form1.submit();
			}
			if (value=='1') {
				form1.action = "<%=path%>/tiezi_searchTiezi.html";
				form1.submit();
			}
		}
	</script>
  
</head>
<body>
<!-- Header Start -->
			<header id="wt-header" class="wt-header wt-headervtwo wt-haslayout">
				<div class="wt-navigationarea">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
								<!-- 跳转回主页，页面最左上角的logo -->
								<strong class="wt-logo"><a href="<%=path%>/tiezi_queryTiezi.html?aab101=${sessionScope.userId}"><img src="images/logo.png" alt="company logo here"></a></strong>
								
								<!-- 搜索框，导航栏的搜索 -->
								<form id="form1" class="wt-formtheme wt-formbanner wt-formbannervtwo" method="post">
									<fieldset>
										<div class="form-group">
											<input type="text"  name="message" class="form-control" placeholder="I’m looking for">
											<div class="wt-formoptions">
												<div class="wt-dropdown">
													<span>搜: <em class="selected-search-type">帖子 </em><i class="lnr lnr-chevron-down"></i></span>
												</div>
												<div class="wt-radioholder" id="type">
													<span class="wt-radio">
														<input id="wt-freelancers" data-title="帖子" type="radio" name="searchtype" value="1" checked="checked">
														<label for="wt-freelancers">帖子</label>
													</span>
													<span class="wt-radio">
														<input id="wt-jobs" data-title="用户" type="radio" name="searchtype" value="2">
														<label for="wt-jobs">用户</label>
													</span>
												</div>
												<a href="#" class="wt-searchbtn" onclick="s()"><i class="lnr lnr-magnifier"></i></a>
											</div>
										</div>
									</fieldset>
								</form>
								
								<div class="wt-rightarea">
									<div class="wt-userlogedin">
										<figure class="wt-userimg">
											<c:if test="${sessionScope.userPhoto==null }">
												<img src="images/user-img.jpg" alt="image description">	
											</c:if>
											<c:if test="${sessionScope.userPhoto!=null }">
												<img src="${sessionScope.userPhoto }" alt="image description">
											</c:if>										
										</figure>
										<div class="wt-username">
											<h3>${sessionScope.userName}</h3>
										</div>
										<nav class="wt-usernav">
											<ul>
											<!-- 查询我的信息 -->
												<li>
													<a href="<%=path %>/user_userInfo.html?aab101=${sessionScope.userId }">
														<span>我的主页</span>
													</a>
												</li>
												<!-- 查询我的帖子 -->
												<li>
													<a href="<%=path%>/tiezi_queryTieziById.html?aab101=${sessionScope.userId}">
														<span>我的帖子</span>
													</a>
												</li>
												<!-- 查询我的群组 -->
												<li>
													<a href="<%=path %>/group_findMyGroup.html?aab101=${userId}">
														<span>我的群组</span>
													</a>
												</li>
												<li class="wt-notificationicon">
													<a href="<%=path%>/chatpage.jsp">
														<span>我的消息</span>
													</a>
												</li>
												<li class="${emailNum>0?'wt-notificationicon':'' }">
													<a href="<%=path %>/email_getEmail.html?aab101=${userId}">
														<span>我的邮件</span>
													</a>
												</li>
												<li>
													<a href="#" onclick="returnUserLogin()">
														<span>退出</span>
													</a>
												</li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</header>
						<!--Header End-->
			<form method="post" id="message">
					<input type="hidden" name="aab101" value="${userId }"/>
			</form>			
			
						
						
  <script type="text/javascript">
  
  function askEmail(newNum)
  {
		$.ajax
		({
			type:"POST",
			url:'<%=path%>/email_CheckEmail.html',
			data:{'aab101':'${userId}','emailNum':newNum},
			timeout:30*60*1000,  //设置30分钟超时
			success:function(data)
			{
				newNum=data;
				$("#msgNum").text(data);
				iziToast.error({
	        		title: '提示',
	        		message: '您有'+data+'条未读提示',
	       			position: 'bottomRight',
	        		transitionIn: 'fadeInDown'
	    		});
				askEmail(newNum);
			},
			error:function()
			{
				askEmail(newNum);
			}
		});
	};

	iziToast.settings({
	    timeout: 5000,
	    pauseOnHover: true,
	    close: true,
	    progressBar: true,
	});
	
	$(document).ready(function()
		{
			var newNum=0;
			askEmail(newNum);
		})
		
		
	function returnUserLogin()
	{
		sessionStorage.clear();
		window.location.href="<%=path%>/user_userLogOut.html";
	}
</script>
</body>
</html>	
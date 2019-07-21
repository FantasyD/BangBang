<%@ page language="java"  pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
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
<<<<<<< HEAD
=======
								<div class="wt-btnarea">
									<a href="<%=path%>/addPost.jsp" class="wt-btn">发布帖子</a>
								</div>
>>>>>>> a424cf57ea74c1196bdebd94dd70079c98614e63
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
<<<<<<< HEAD
									<a href="myPost.jsp">
=======
									<a href="<%=path%>/tiezi_queryTieziById.html?aab101=${sessionScope.userId}">
>>>>>>> a424cf57ea74c1196bdebd94dd70079c98614e63
										<i class="ti-briefcase"></i>
										<span>我的帖子</span>
									</a>
								</li>
								<li>
<<<<<<< HEAD
									<a href="<%=path %>/group_findMyGroup.html?aab101=${userId}">
=======
									<a href="<%=path %>/group_findMyGroup.html" onclick="myGroups()">
>>>>>>> a424cf57ea74c1196bdebd94dd70079c98614e63
										<i class="ti-package"></i>
										<span>我的群组</span>
									</a>
								</li>
								<li class="wt-notificationicon">
									<a href="javascript:void(0);">
										<i class="ti-pencil-alt"></i>
										<span>我的消息</span>
									</a>
								</li>
								<li>
									<a href="myEmails.jsp">
										<i class="ti-announcement"></i>
										<span>我的邮件</span>
									</a>
								</li>
								<li>
									<a href="index.html">
										<i class="ti-shift-right"></i>
										<span>退出</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!--Sidebar Start-->
<<<<<<< HEAD
=======
				<form method="post">
					<input type="hidden" name="aab101" value="${userId }"/>
				</form>
				
>>>>>>> a424cf57ea74c1196bdebd94dd70079c98614e63
				
</body>
</html>
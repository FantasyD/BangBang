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
									<h2><a href="javascript:void(0);">${sessionScope.userName}</a></h2>
								</div>

								<div class="wt-btnarea">
									<a href="<%=path%>/addPost.jsp" class="wt-btn">发布帖子</a>
								</div>
							</div>
						</div>
						
						<nav id="wt-navdashboard" class="wt-navdashboard">
							<ul>
								<li>
									<a href="<%=path %>/user_userInfo.html?aab101=${sessionScope.userId }">
										<i class="ti-dashboard"></i>
										<span>我的主页</span>
									</a>
								</li>
								<li>

									<a href="<%=path%>/tiezi_queryTieziById.html?aab101=${sessionScope.userId}">
										<i class="ti-briefcase"></i>
										<span>我的帖子</span>
									</a>
								</li>
								<li>
									<a href="<%=path %>/group_findMyGroup.html?aab101=${userId}">
										<i class="ti-package"></i>
										<span>我的群组</span>
									</a>
								</li>
								<li class="wt-notificationicon">
									<a href="<%=path%>/chatpage.jsp">
										<i class="ti-pencil-alt"></i>
										<span>我的消息</span>
									</a>
								</li>
								<li class="${emailNum>0?'wt-notificationicon':'' }">
									<a href="<%=path %>/email_getEmail.html?aab101=${userId}">
										<i class="ti-announcement"></i>
										<span>我的邮件</span>
									</a>
								</li>
								<li>
									<a href="index.jsp">
										<i class="ti-shift-right"></i>
										<span>退出</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
				<!--Sidebar Start-->

				<form method="post">
					<input type="hidden" name="aab101" value="${userId }"/>
				</form>
				
				
</body>
</html>
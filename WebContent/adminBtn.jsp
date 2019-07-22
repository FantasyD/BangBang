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
									<h2><a href="javascript:void(0);">管理员</a></h2>
								</div>

								<div class="wt-btnarea">								
								</div>
							</div>
						</div>
						
						<nav id="wt-navdashboard" class="wt-navdashboard">
							<ul>
								<li>
									<a href="<%=path%>/placement_queryPlacement.html">
										<i class="ti-dashboard"></i>
										<span>帖子置顶申请审核</span>
									</a>
								</li>
								<li>

									<a href="<%=path%>/complain_complainQuery.html">
										<i class="ti-briefcase"></i>
										<span>举报处理</span>
									</a>
								</li>
							
								<li>
									<a href="<%=path %>/userLogin.jsp">
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
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
							
							<!-- �û��� -->
							<div class="wt-companysinfo">
								<figure><img src="images/sidebar/img-02.jpg" alt="img description"></figure>
								<div class="wt-title">
									<h2><a href="javascript:void(0);">����Ա</a></h2>
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
										<span>�����ö��������</span>
									</a>
								</li>
								<li>

									<a href="<%=path%>/complain_complainQuery.html">
										<i class="ti-briefcase"></i>
										<span>�ٱ�����</span>
									</a>
								</li>
							
								<li>
									<a href="<%=path %>/userLogin.jsp">
										<i class="ti-shift-right"></i>
										<span>�˳�</span>
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
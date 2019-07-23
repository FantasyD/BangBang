<%@ page language="java"  pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

								<img src="images/BackImg.jpg" alt="img description">
	
							</figure>
							
							<!-- �û��� -->
							<div class="wt-companysinfo">
								<figure>
									<c:if test="${sessionScope.userPhoto!=null }">
										<img src="${sessionScope.userPhoto }" alt="img description">
									</c:if>
									<c:if test="${sessionScope.userPhoto==null }">
										<img src="images/user-img.jpg" alt="img description">
									</c:if>
								</figure>
								<div class="wt-title">
									<h2><a href="javascript:void(0);">${sessionScope.userName}</a></h2>
								</div>

								<div class="wt-btnarea">
									<a href="<%=path%>/addPost.jsp" class="wt-btn">��������</a>
								</div>
							</div>
						</div>
						
						<nav id="wt-navdashboard" class="wt-navdashboard">
							<ul>
								<li>
									<a href="<%=path %>/user_userInfo.html?aab101=${sessionScope.userId }">
										<i class="ti-dashboard"></i>
										<span>�ҵ���ҳ</span>
									</a>
								</li>
								<li>

									<a href="<%=path%>/tiezi_queryTieziById.html?aab101=${sessionScope.userId}">
										<i class="ti-briefcase"></i>
										<span>�ҵ�����</span>
									</a>
								</li>
								<li>
									<a href="<%=path %>/group_findMyGroup.html?aab101=${userId}">
										<i class="ti-package"></i>
										<span>�ҵ�Ⱥ��</span>
									</a>
								</li>
								<li>
									<a href="<%=path%>/chatpage.jsp">
										<i class="ti-pencil-alt"></i>
										<span>�ҵ���Ϣ</span>
									</a>
								</li>
								<li class="${emailNum>0?'wt-notificationicon':'' }">
									<a href="<%=path %>/email_getEmail.html?aab101=${userId}">
										<i class="ti-announcement"></i>
										<span>�ҵ��ʼ�</span>
									</a>
								</li>
								<li>
									<a href="#" onclick="returnUserLogin()">
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
		<script type="text/javascript">

		function returnUserLogin()
		{
			sessionStorage.clear();
			window.location.href="<%=path%>/user_userLogOut.html";
		}

		</script>
</body>
</html>
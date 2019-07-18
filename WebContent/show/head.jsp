<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" pageEncoding="GBK"%>
<% String path=request.getContextPath(); 
		session.setAttribute("userId", "3");
%>
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
</head>
<body>
<!-- Header Start -->
			<header id="wt-header" class="wt-header wt-headervtwo wt-haslayout">
				<div class="wt-navigationarea">
					<div class="container-fluid">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
								<!-- 跳转回主页，页面最左上角的logo -->
								<strong class="wt-logo"><a href="index.jsp"><img src="images/logo.png" alt="company logo here"></a></strong>
								
								<!-- 搜索框，导航栏的搜索 -->
								<form class="wt-formtheme wt-formbanner wt-formbannervtwo">
									<fieldset>
										<div class="form-group">
											<input type="text" name="job" class="form-control" placeholder="I’m looking for">
											<div class="wt-formoptions">
												<div class="wt-dropdown">
													<span>搜: <em class="selected-search-type">帖子 </em><i class="lnr lnr-chevron-down"></i></span>
												</div>
												<div class="wt-radioholder">
													<span class="wt-radio">
														<input id="wt-freelancers" data-title="帖子" type="radio" name="searchtype" value="freelancer" checked="">
														<label for="wt-freelancers">帖子</label>
													</span>
													<span class="wt-radio">
														<input id="wt-jobs" data-title="用户" type="radio" name="searchtype" value="job">
														<label for="wt-jobs">用户</label>
													</span>
													<span class="wt-radio">
														<input id="wt-companies" data-title="群组" type="radio" name="searchtype" value="job">
														<label for="wt-companies">群组</label>
													</span>
												</div>
												<a href="javascrip:void(0);" class="wt-searchbtn"><i class="lnr lnr-magnifier"></i></a>
											</div>
										</div>
									</fieldset>
								</form>
								
								<div class="wt-rightarea">
									<div class="wt-loginarea">
										<figure class="wt-userimg">
											<img src="images/user-login.png" alt="img description">
										</figure>
										<div class="wt-loginoption">
											<a href="javascript:void(0);" id="wt-loginbtn" class="wt-loginbtn">Login</a>
											<div class="wt-loginformhold">
												<div class="wt-loginheader">
													<span>Login</span>
													<a href="javascript:;"><i class="fa fa-times"></i></a>
												</div>
												<form class="wt-formtheme wt-loginform do-login-form">
													<fieldset>
														<div class="form-group">
															<input type="text" name="username" class="form-control" placeholder="Username">
														</div>
														<div class="form-group">
															<input type="password" name="password" class="form-control" placeholder="Password">
														</div>
														<div class="wt-logininfo">
															<a href="javascript:;" class="wt-btn do-login-button">Login</a>
															<span class="wt-checkbox">
																<input id="wt-login" type="checkbox" name="rememberme">
																<label for="wt-login">Keep me logged in</label>
															</span>
														</div>
													</fieldset>
													<div class="wt-loginfooterinfo">
														<a href="javascript:;" class="wt-forgot-password">Forgot password?</a>
														<a href="register.html">Create account</a>
													</div>
												</form>
											    <form class="wt-formtheme wt-loginform do-forgot-password-form wt-hide-form">
											        <fieldset>
											            <div class="form-group">
											                <input type="email" name="email" class="form-control get_password" placeholder="Email">
											            </div>
											           
											            <div class="wt-logininfo">
											                <a href="javascript:;" class="wt-btn do-get-password">Get Pasword</a>
											            </div>     
											        </fieldset>
											        <div class="wt-loginfooterinfo">
											            <a href="javascript:void(0);" class="wt-show-login">Login</a>
											            <a href="register.html">Create account</a>
											        </div>
											    </form>
											</div>
										</div>
										<a href="register.html" class="wt-btn">Join Now</a>
									</div>
									<div class="wt-userlogedin">
										<figure class="wt-userimg">
											<img src="images/user-img.jpg" alt="image description">
										</figure>
										<div class="wt-username">
											<h3>Louanne Mattioli</h3>
											<span>Amento Tech</span>
										</div>
										<nav class="wt-usernav">
											<ul>
												<li class="menu-item-has-children page_item_has_children">
													<a href="javascript:void(0);">
														<span>Insights</span>
													</a>
													<ul class="sub-menu children">
														<li><a href="dashboard-insights.html">Insights</a></li>
														<li><a href="dashboard-insightsuser.html">Insights User</a></li>
													</ul>
												</li>
												<li>
													<a href="dashboard-profile.html">
														<span>My Profile</span>
													</a>
												</li>
												<li class="menu-item-has-children">
													<a href="javascript:void(0);">
														<span>All Jobs</span>
													</a>
													<ul class="sub-menu">
														<li><a href="dashboard-completejobs.html">Completed Jobs</a></li>
														<li><a href="dashboard-canceljobs.html">Cancelled Jobs</a></li>
														<li><a href="dashboard-ongoingjob.html">Ongoing Jobs</a></li>
														<li><a href="dashboard-ongoingsingle.html">Ongoing Single</a></li>
													</ul>
												</li>
												<li>
													<a href="dashboard-managejobs.html">
														<span>Manage Jobs</span>
													</a>
												</li>
												<li class="wt-notificationicon menu-item-has-children">
													<a href="javascript:void(0);">
														<span>Messages</span>
													</a>
													<ul class="sub-menu">
														<li><a href="dashboard-messages.html">Messages</a></li>
														<li><a href="dashboard-messages2.html">Messages V 2</a></li>
													</ul>
												</li>
												<li>
													<a href="dashboard-saveitems.html">
														<span>My Saved Items</span>
													</a>
												</li>
												<li>
													<a href="dashboard-invocies.html">
														<span>Invoices</span>
													</a>
												</li>
												<li>
													<a href="dashboard-category.html">
														<span>Category</span>
													</a>
												</li>
												<li>
													<a href="dashboard-packages.html">
														<span>Packages</span>
													</a>
												</li>
												<li>
													<a href="dashboard-proposals.html">
														<span>Proposals</span>
													</a>
												</li>
												<li>
													<a href="dashboard-accountsettings.html">
														<span>Account Settings</span>
													</a>
												</li>
												<li>
													<a href="dashboard-helpsupport.html">
														<span>Help &amp; Support</span>
													</a>
												</li>
												<li>
													<a href="index.html">
														<span>Logout</span>
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
  <script type="text/javascript">
  function askEmail(newNum)
  {
		$.ajax
		({
			type:"POST",
			url:'<%=path%>/email_CheckEmail.html',
			data:{'aab101':'${userId}','emailNum':newNum},
			timeout:30*60*1000,  //设置10分钟超时
			success:function(data)
			{
				newNum=data;
				$("#msgNum").text(data)
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
				alert("运算超时");	
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
</script>
</body>
</html>
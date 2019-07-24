<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>用户登录</title>
<link href="css/login.css" rel="stylesheet" type="text/css"> 

<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css"> 
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/sendEmail.js"></script>
<script type="text/javascript">
	var path = "<%=path %>";
	var msg = "${msg }";
	if(msg != "")
		alert(msg);

	function onMoveIn(x)
	{
		x.style.fontSize = "17";
		x.style.color = "blue";
	}

	function onMoveOut(x)
	{
		x.style.fontSize = "15";
		x.style.color = "black";
	}
</script>
</head>
<body>
<canvas id="canvas"></canvas>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form class="form-horizontal" id="myform_login" role="form" method="post">
                <span class="heading">用户登录</span>
                <div class="form-group">
                    <input type="text" name="userId" class="form-control" placeholder="学号或电子邮件"  required="required">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input id="pwd" type="password" class="form-control" name="aab103" placeholder="密  码" required="required" onkeyup="checkPwd(this, 'login', 'alert')">
                    <i class="fa fa-lock"></i>
                    <span id="alert"></span>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <span class="text" data-toggle="modal" data-target="#myModal_admin"
                          onmousemove="onMoveIn(this)" onmouseout="onMoveOut(this)">管理员登陆</span>
                    <div class="forget" data-toggle="modal" data-target="#myModal_findPwd">忘记密码</div>
                    <button type="submit" class="btn btn-default" id="login" formaction="<%=path %>/user_userLogin.html">登录</button>
                </div>
                <span class="remind">                      
                    <div class="rem">没有账号? 
                        <label class="reg" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal_register">注册</label>
                    </div>
                </span>
            </form>
        </div>
    </div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal_register" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请输入注册信息</h4>
            </div>
            <div class="modal-body">
	            <form class="form-horizontal" id="myform_register"  method="post">
	            
	            	<div class="form-group">
	                    <label class="reginfo">昵称</label>
	                    <input class="form-control1" id="userName" name="aab102" required="required" autofocus="true" placeholder="输入您的昵称">
	                    <i class="fa fa-user"></i>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">姓名</label>
	                    <input class="form-control1" id="Name" name="aab104" required="required" placeholder="输入您的姓名">
	                    <i class="fa fa-user"></i>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">学校</label>
	                    <input class="form-control1" id="school" name="aab110" required="required" placeholder="输入您的学校">
	                    <i class="fa fa-user"></i>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">学号</label>
	                    <input class="form-control1" id="student_id" name="aab107" required="required" placeholder="输入您的学号">
	                    <i class="fa fa-user"></i>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">注册邮箱</label>
	                    <input class="form-control1" type="email" id="mail" name="aab108" required="required" placeholder="输入您的邮箱地址">
	                    <i class="fa fa-user"></i>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">密码</label>
	                    <input type="password" class="form-control1"  id="password_"  name="aab103" required="required" placeholder="设置您的密码"
	                    	   onkeyup="checkPwd(this, 'register', 'alert_register')">
	                    <i class="fa fa-lock"></i>
	                    <a href="#" class="fa fa-question-circle"></a>
	                </div>
	                <div class="form-group">
                    	<span id="alert_register"></span>
	                </div>
	                    
	                <div class="form-group">
	                    <label class="reginfo">确认密码</label>
	                    <input type="password" class="form-control1" id="comfirm_pwd" required="required" placeholder="确认您的密码"
	                    	   onkeyup="checkComfirmPwd(this, 'password_', 'register', 'alert_register_comfirm')">
	                    <i class="fa fa-lock"></i>
	                    <a href="#" class="fa fa-question-circle"></a>
	                </div>
	                <div class="form-group">
                    	<span id="alert_register_comfirm"></span>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">验证码</label>
	                    <input type="text" class="form-control1" id="num" name="ver" required="required" placeholder="输入验证码">
	                    <i class="fa fa-lock"></i>
	                    <a href="#" class="fa fa-question-circle"></a>
	                </div>
		            <div class="modal-footer">
		            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            	<input class="btn btn-primary" id="register" type="button" name="next" value="注册" onclick="register_()" formnovalidate="formnovalidate">
		            	<input class="btn btn-primary" type="button" name="next" value="发送验证码" onclick="SendEmail('mail', 1, '<%=path %>')" formnovalidate="formnovalidate">
		            </div>
	            </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal_findPwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">请输入注册信息</h4>
            </div>
            <div class="modal-body">

            <form class="form-horizontal" id="myform_findPwd"  method="post">

	                <div class="form-group">
	                    <label class="reginfo">您的邮箱</label>
	                    <input class="form-control1" type="email" id="mail_findPwd" name="aab108" required="required" placeholder="输入您的邮箱地址">
	                    <i class="fa fa-user"></i>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">密码</label>
	                    <input type="password" class="form-control1"  id="password_findPwd"  name="aab103" required="required" placeholder="设置您的新密码"
	                    	   onkeyup="checkPwd(this, 'findPwd', 'alert_findPwd')">
	                    <i class="fa fa-lock"></i>
	                    <a href="#" class="fa fa-question-circle"></a>
	                </div>
	                <div class="form-group">
                    	<span id="alert_findPwd"></span>
	                </div>
	                    
	                <div class="form-group">
	                    <label class="reginfo">确认密码</label>
	                    <input type="password" class="form-control1" id="comfirm_pwd" required="required" placeholder="确认您的密码"
	                    	   onkeyup="checkComfirmPwd(this, 'password_findPwd', 'findPwd', 'alert_findPwd_comfirm')">
	                    <i class="fa fa-lock"></i>
	                    <a href="#" class="fa fa-question-circle"></a>
	                </div>
	                <div class="form-group">
                    	<span id="alert_findPwd_comfirm"></span>
	                </div>
	                
	                <div class="form-group">
	                    <label class="reginfo">验证码</label>
	                    <input type="text" class="form-control1" id="num_findPwd" name="ver" required="required" placeholder="输入验证码">
	                    <i class="fa fa-lock"></i>
	                    <a href="#" class="fa fa-question-circle"></a>
	                </div>
		            <div class="modal-footer">
		            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		            	<input class="btn btn-primary" id="findPwd" type="button" name="next" value="修改" onclick="findPwd_()" formnovalidate="formnovalidate">
		            	<input class="btn btn-primary" type="button" name="next" value="发送验证码" onclick="SendEmail('mail_findPwd', 2, '<%=path %>')" formnovalidate="formnovalidate">
		            </div>
	            </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal_admin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">管理员登陆</h4>
            </div>
            <div class="modal-body">

            <form class="form-horizontal" id="myform_login" role="form" method="post">
                <div class="form-group">
                    <input type="text" name="adminId" class="form-control" placeholder="管理员账号"  required="required">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input id="pwd" type="password" class="form-control" name="aab303" placeholder="密  码" required="required" onkeyup="checkPwd(this, 'login', 'alert')">
                    <i class="fa fa-lock"></i>
                    <span id="alert"></span>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-default" id="login" formaction="<%=path %>/user_adminLogin.html">登录</button>
                </div>
            </form>
            </div>
        </div>
    </div>
</div>

<script src="js/index.js"></script>
</body>

</html>
<%@ page language="java" pageEncoding="GBK"%>
<% String path=request.getContextPath(); 
		session.setAttribute("aab101", "3");
%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-info navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">Active</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link</a>
    </li>
    <li class="nav-item">
      <a class="nav-link disabled" href="#">Disabled</a>
    </li>
  </ul>
</nav>
  <span id="msgRemind"  style="display:none">您有<strong id="msgNum"></strong>提示消息!</span>
  
  <script type="text/javascript">
  function askEmail(){
		$.ajax({
			type:"POST",
			url:'<%=path%>/email_CheckEmail.html',
			data:{'aab101':'${aab101}'},
			timeout:10*60*1000,  //设置10分钟超时
			success:function(data){
				$("#msgNum").html(${emailNum});
				console.log(${emailNum});
				setTimeout(function () {
			        $("#msgRemind").show();
			    }, 6000);

				askEmail();
			},
			error:function(){
				alert("运算超时");	
				askEmail();
			}
		});
	};
$(document).ready(function()
		{
			askEmail();
		})
		
</script>
</html>
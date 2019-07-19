<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>BB</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">BB</a>
    </div>
    <div>
        <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="<%=path %>/user_userCenter.html?aab101=${sessionScope.userID }">个人中心</a></li>          
        </ul>
    </div>
    </div>
</nav>
</body>
</html>
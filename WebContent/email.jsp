<%@ page language="java"  pageEncoding="GBK"%>
<% String path=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<title>’æƒ⁄” œ‰</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
</head>
<body>
<div class="tabbable tabs-left">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">Section 1</a></li>
    <li><a href="#tab2"  data-toggle="tab">Section 2</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab1">
      <p>I'm in Section 1.</p>
    </div>
    <div class="tab-pane" id="tab2">
      <p>Howdy, I'm in Section 2.</p>
    </div>
  </div>
</div>
	
	<div class="col-md-4">
		<button type="button" class="btn btn-default">Õ¨“‚</button>
		<button type="button" class="btn btn-default">æ‹æ¯</button>
	</div>
	
	<script src="http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
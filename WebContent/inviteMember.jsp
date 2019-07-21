<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="modal-header">
	<h4 class="modal-title" id="myModalLabel">请选择邀请用户</h4>
              <a href="" onclick="close()"  class="close">&times;</a>
          </div>
     <div class="modal-body" id="results">
	<div class="wt-dashboardboxcontent wt-jobdetailsholder">
		<div class="wt-freelancerholder">
			<div class="wt-managejobcontent wt-verticalscrollbar mCustomScrollbar _mCS_1">
				<c:choose>
					<c:when test="${cols!=null }">
						<table id="idData">
							<c:forEach items="${cols }" var="ins" varStatus="vs">
								<tr>
									<div class="wt-userlistinghold wt-featured wt-userlistingvtwo" 	id="div${vs.count }">
										<span class="wt-featuredtag wt-featuredtagcolor3"><img
											src="images/featured.png" alt="img description"
											data-tipso="Plus Member" class="template-content tipso_style"></span>
										<div class="wt-userlistingcontent">
											<div class="wt-contenthead">
												<div class="wt-title">
													<a href="usersingle.html"><i class="fa fa-check-circle"></i>${ins.aab102 }</a>
													<h2>学号：${ins.aab107 }</h2>
												</div>
												<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
													<li>姓名：${ins.aab104 }</li>
													<li>性别：${ins.cnaab105 }</li>
													<li>民族：${ins.aab109 }</li>
												</ul>
												<br> <br>
												<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
													<li>学校：${ins.aab110 }</li>
													<li>邮箱：${ins.aab108 }</li>
													<li>信誉分：${ins.aab113 }</li>
												</ul>
											</div>
											<div class="wt-rightarea">
												<div class="wt-btnarea">
													<a href="#" class="wt-btn" onclick="invite('${ins.aab101}')">邀请</a>
												</div>
												<div class="wt-hireduserstatus">
													<ul class="wt-hireduserimgs">
														<li><c:if test="${ins.aab115!=null }">
																<figure>
																	<a href="#" onclick="onEdit('${ins.aab101 }')"> <img
																		src="${ins.aab115 }" alt="img description">
																	</a>
																</figure>
															</c:if> <c:if test="${ins.aab115==null }">
																<figure>
																	<a href="#" onclick="onEdit('${ins.aab101 }')"> <img
																		src="show/images/user/userlisting/img-02.jpg"
																		alt="img description">
																	</a>
																</figure>
															</c:if></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</tr>
							</c:forEach>
						</table>
						<table width="60%" align="right">
							<tr>
								<td><div id="barcon" name="barcon"></div></td>
							</tr>
						</table>
					</c:when>
					<c:otherwise>
						<div>
							<div class="alert alert-info">
								<strong>没有符合条件的用户</strong>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	</div>
	
<script type="text/javascript">
function close()
{
	alert("a");
	var myDiv=document.getElementById("result");
	myDiv.style.display="none";
}
</script>	
</body>
</html>
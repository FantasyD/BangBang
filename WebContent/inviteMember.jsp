<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
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
													<i class="fa fa-check-circle"></i>${ins.aab102 }
													<h2>ѧ�ţ�${ins.aab107 }</h2>
												</div>
												<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
													<li>������${ins.aab104 }</li>
													<li>�Ա�${ins.cnaab105 }</li>
													<li>���壺${ins.aab109 }</li>
												</ul>
												<br> <br>
												<ul class="wt-saveitem-breadcrumb wt-userlisting-breadcrumb">
													<li>ѧУ��${ins.aab110 }</li>
													<li>���䣺${ins.aab108 }</li>
													<li>�����֣�${ins.aab113 }</li>
												</ul>
											</div>
											<div class="wt-rightarea">
												<div class="wt-btnarea">
													<a href="#" class="wt-btn" onclick="invite('${ins.aab101}')">����</a>
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
								<strong>û�з����������û�</strong>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
</body>
</html>
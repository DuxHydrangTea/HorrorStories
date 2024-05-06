<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*, com.Model.*, java.util.*, com.Function.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
<%
String username = "";
if((String) session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}
else{
	username = (String) session.getAttribute("username");
}
%>
<jsp:include page="components/scription.jsp" />
</head>
</head>
<body>
	<jsp:include page="components/header.jsp" />
	<%
	int ids = Integer.parseInt(request.getParameter("idseri"));
	int indexp = Integer.parseInt(request.getParameter("indexpart"));
	ViewFullSeri vds = ViewFullSeriDAO.getPartSeri(ids, indexp);
	HistoryReadDAO.makeHistory(ids, indexp, username, Function.getCurrentTime());
	
	%>
	<div class="container-fluid">
		<main class="tm-main">
			<!-- Search form -->
			<div class="row tm-row">
				<div class="col-12">
					<jsp:include page="components/formsearch.jsp" />

				</div>
			</div>
			<div class="row tm-row">
				<div class="col-12">
					<hr class="tm-hr-primary tm-mb-55">
					<!-- Video player 1422x800 -->
					<img src="<%=vds.getThumbnail() %>" alt=""
						class="tm-mb-40 img-max-w">
				</div>
			</div>
			<div class="row tm-row">
				<div class="col-lg-8 tm-post-col">
				<div class="partNavigation">
					<p>Các phần:</p>
					<ul>
					<% 
					int numPart = SeriDAO.getSumPart(vds.getIdseri());
					for(int i =1;i<=numPart;i++){
						
						%>
							<li><a href="detailstory.jsp?idseri=<%=vds.getIdseri() %>&indexpart=<%=i%>" class="<%=SeripartDAO.selectedPart(indexp,i)%>"><%= (i== numPart)?i +"- tập cuối":i%></a></li>
						<%
					}
					%>
					</ul>
				</div>
					<div class="tm-post-full">
						<div class="mb-4 post-content">
							<h2 class="pt-2 tm-color-primary tm-post-title">
								<%=vds.getTitle()%></h2>
							<p class="tm-mb-40"><%=Function.getDifferentTime(vds.getTimeseripart())  %>
								-- posted by <strong><%=vds.getUsername()%></strong>
							</p>
							<p class="abtract-story">
								<%=vds.getAbtract()%>
							</p>
							<p>
								Nội dung: </br> <%=vds.getContent()%>
							</p>
							<span class="d-block text-right tm-color-primary">-- <strong><%=vds.getUsername()%></strong></span>
						</div>
				<div class="partNavigation">
				<p>Các phần:</p>
					<ul>
					<% 
					for(int i =1;i<=numPart;i++){
						%>
							<li><a href="detailstory.jsp?idseri=<%=vds.getIdseri() %>&indexpart=<%=i%>" class="<%=SeripartDAO.selectedPart(indexp,i)%>"><%=i%></a></li>
						<%
					}
					%>
					</ul>
				</div>
						<!-- Comments -->
						<div>
							<h2 class="tm-color-primary tm-post-title">Bình luận</h2>
							<hr class="tm-hr-primary tm-mb-45">
							<div class="tm-comment tm-mb-45">
								<%
								List<Comment> list = CommentDAO.getCommentByID(vds.getIdseri());
								request.setAttribute("listcmt", list);
								%>

								<c:forEach items="${listcmt}" var="cmt">
									<figure class="tm-comment-figure">

										[${cmt.getCommentedtime()} ]
										<label class="tm-color-primary text-center">${cmt.getUsername()}</label>
										đã bình luận:
									</figure>
									<div>
										<p class="comment-text">${cmt.getCommenttext()}</p>

									</div>
								</c:forEach>


							</div>
							<hr>
							<form action="Action/CommentAction.jsp"
								class="mb-5 tm-comment-form" method="post">
								<h2 class="tm-color-primary tm-post-title mb-4">Để lại bình
									luận tại đây</h2>
								<div class="mb-4" style="display: none">
									<input class="form-control" name="idstory" type="text"
										placeholder="Nickname" value="<%=vds.getIdseri()%>">
										<input class="form-control" name="commentedperson" type="text"
										placeholder="Nickname" value="<%=username%>">
										<input class="form-control" name="indexpart" type="text"
										placeholder="Nickname" value="<%=indexp%>">
								</div>
								
								<div class="mb-4">
									<textarea class="form-control" name="commenttext" rows="6"
										placeholder="Bình luận..."></textarea>
								</div>
								<div class="text-right">
									<button class="tm-btn tm-btn-primary tm-btn-small"
										type="submit">Gửi</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<aside class="col-lg-4 tm-aside-col">
					<div class="tm-post-sidebar">
						<hr class="mb-3 tm-hr-primary">
						<h2 class="mb-4 tm-post-title tm-color-primary">Thể loại</h2>
						<ul class="tm-mb-75 pl-5 tm-category-list">
							<%
							List<Category> listcate = CategoryDAO.getAllCategory();
							request.setAttribute("list", listcate);
							%>
							<c:forEach items="${list}" var="icate">
								<li><a href="#" class="tm-color-primary">${icate.getCategoryname()}</a></li>
							</c:forEach>

						</ul>
						<hr class="mb-3 tm-hr-primary">
						<h2 class="tm-mb-40 tm-post-title tm-color-primary">Chuyện
							mới nhất</h2>
						<%
						List<Seri> list4new = new ArrayList<>();
						list4new = SeriDAO.get4Seri();
						request.setAttribute("list4new", list4new);
						%>

						<c:forEach items="${list4new}" var="lc">
							<a href="detailstory.jsp?idseri=${lc.getIdseri() }"
								class="d-block tm-mb-40">
								<figure>
									<img src="${lc.getThumbnail()}" alt="Image"
										class="mb-3 img-fluid">
									<figcaption class="tm-color-primary">${lc.getTitle()}</figcaption>
								</figure>
							</a>
						</c:forEach>

					</div>
				</aside>
			</div>
			<footer class="row tm-row">
				<div class="col-md-6 col-12 tm-color-gray">
					Design: <a rel="nofollow" target="_parent"
						href="https://templatemo.com" class="tm-external-link">TemplateMo</a>
				</div>
				<div class="col-md-6 col-12 tm-color-gray tm-copyright">
					Copyright 2020 Xtra Blog Company Co. Ltd.</div>
			</footer>
		</main>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/templatemo-script.js"></script>
</body>
</html>
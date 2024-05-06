<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*, com.Model.*, java.util.*"%>
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

	<div class="container-fluid">
		<main class="tm-main">
			<!-- Search form -->
			<div class="row tm-row">
				<div class="col-12">
					<jsp:include page="components/formsearch.jsp" />
				</div>
			</div>
			<div class="title-category">
				<h2>Lịch sử đọc</h2>
				
			</div>

			<div class="post-flex">
				<div class="list-selection">
					<h4>Thời gian</h4>
					<div class="selection-category">
						<%
					
						for(int i = 0; i<=7;i++){
							
						
						%>
							<a href="history.jsp?days=<%=i %>"
								class="selection-item"><% String x = ""; if(i==0) x="Hiện tại"; else x= i+" ngày trước"; out.println(x);   %></a>
						<%
						}
						%>
					</div>

				</div>

				
				<%
				int days  = Integer.parseInt(request.getParameter("days"));
				List<HistoryRead> list = HistoryReadDAO.getHistory(username, days);
				
				for(HistoryRead hr: list){
				Seri s = SeriDAO.getSeriById(hr.getIdseri());
				%>
				<a href="detailstory.jsp?idseri=<%=hr.getIdseri() %>&indexpart=<%=hr.getIndexpart() %>"
						class="post-flex-item">
						<div class="post-img">
							<img src="<%=s.getThumbnail() %>" alt="">
						</div>
						<div class="post-detail">
							<p class="post-detail-title">( Phần: <%=hr.getIndexpart() %>)  <%=s.getTitle() %></p>
							<p class="post-detail-abtract"><%=s.getAbtract() %></p>
							<p class="post-detail-author">
								2002-02-02 - Kinh dị 18+ - posted by <Strong>Author</Strong>
							</p>
						</div>
					</a>
					<%
					}
					%>
			</div>

			

			<div class="row tm-row tm-mt-100 tm-mb-75">
				<div class="tm-prev-next-wrapper">
					<a href="#"
						class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
					<a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
				</div>
				<div class="tm-paging-wrapper">
					<span class="d-inline-block mr-3">Page</span>
					<nav class="tm-paging-nav d-inline-block">
						<ul>
							<li class="tm-paging-item active"><a href="#"
								class="mb-2 tm-btn tm-paging-link">1</a></li>
							<li class="tm-paging-item"><a href="#"
								class="mb-2 tm-btn tm-paging-link">2</a></li>
							<li class="tm-paging-item"><a href="#"
								class="mb-2 tm-btn tm-paging-link">3</a></li>
							<li class="tm-paging-item"><a href="#"
								class="mb-2 tm-btn tm-paging-link">4</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<footer class="row tm-row">
				<hr class="col-12">
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
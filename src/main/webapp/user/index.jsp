<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
if((String) session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}

%>
<jsp:include page="components/scription.jsp" />

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
				<h2>Câu chuyện mới nhất</h2>
				<a href="#">Xem tất cả <i class="fas fa-arrow-right"></i></a>
			</div>

			<div class="row tm-row">
				<%
				
				
				List<Seri> list4new2 = SeriDAO.get4Seri();
				request.setAttribute("list4new", list4new2);
				
				List<Seri> listRand = SeriDAO.getRandomSeri();
				request.setAttribute("listRand", listRand);
				
				%>

				<c:forEach items="${list4new}" var="story">
					<article class="col-12 col-md-6 tm-post">
						<hr class="tm-hr-primary">
						<a href="detailstory.jsp?idseri=${story.getIdseri()}&indexpart=1"
							class="effect-lily tm-post-link tm-pt-60">
							<div class="tm-post-link-inner">
								<img src="${story.getThumbnail()}" alt="Image"
									class="img-fluid img-custom">
							</div> <span class="position-absolute tm-new-badge">
								${CategoryDAO.getNamebyID(story.getIdcategory())} </span>
							<h2 class="tm-pt-30 tm-color-primary tm-post-title">${story.getTitle()}</h2>
						</a>
						<p class="tm-pt-30">${story.getAbtract()}</p>
						<div class="d-flex justify-content-between tm-pt-45">
							<span class="tm-color-primary">${story.getUsername()}</span> <span
								class="tm-color-primary">${story.getCreatedtime()}</span>
						</div>
						<hr>
						<div class="d-flex justify-content-between">
							<span>36 comments</span> <span>by ${story.getUsername()}</span>
						</div>
					</article>

				</c:forEach>



			</div>
			<div class="title-category">
				<h2>Câu chuyện ngẫu nhiên</h2>
				<a href="#">Xem tất cả <i class="fas fa-arrow-right"></i></a>
			</div>

			<div class="row tm-row">
				<%

				%>
				<c:forEach items="${listRand}" var="randitem">
					<article class="col-12 col-md-6 tm-post">
						<hr class="tm-hr-primary">
						<a href="detailstory.jsp?idseri=${randitem.getIdseri()}&indexpart=1"
							class="effect-lily tm-post-link tm-pt-20">
							<div class="tm-post-link-inner">
								<img src="${randitem.getThumbnail()}" alt="Image"
									class="img-fluid">
							</div>
							<h2 class="tm-pt-30 tm-color-primary tm-post-title">${randitem.getTitle()}</h2>
						</a>
						<p class="tm-pt-30">${randitem.getAbtract()}</p>
						<div class="d-flex justify-content-between tm-pt-45">
							<span class="tm-color-primary">${randitem.getUsername()}</span> <span
								class="tm-color-primary">${randitem.getCreatedtime()}</span>
						</div>
						<hr>
						<div class="d-flex justify-content-between"></div>
					</article>
				</c:forEach>


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
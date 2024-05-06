<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
String usn = (String) session.getAttribute("username");
if(usn == null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
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

			<div class="row tm-row tm-mb-120">
				<div class="col-12">
					<h2 class="tm-color-primary tm-post-title tm-mb-60">Thiết lập Seri mới</h2>
					<p> Đã có seri sẵn? <a href="createpart.jsp">Viết phần truyện mới</a> </p>
				</div>
				<div class="col-lg-12 tm-contact-left">
					<form method="POST" action="../SetupSeri"
						class="mb-5 ml-auto mr-0 tm-contact-form-send" enctype="multipart/form-data">
						<div class="form-group row mb-12">
							<label for="title"	
								class="col-sm-3 col-form-label text-right tm-color-primary">Tiêu đề</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="title"
									id="title" type="text" required>
							</div>
						</div>
						<div class="form-group row mb-12" style="display:none">
							<label for="name"
								class="col-sm-3 col-form-label text-right tm-color-primary">Username</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="username" value="<%=usn %>" id="abtract"
									type="text" required>
							</div>
						</div>
						<div class="form-group row mb-12">
							<label for="name"
								class="col-sm-3 col-form-label text-right tm-color-primary">Tóm tắt</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="abtract" id="abtract"
									type="text" required>
							</div>
						</div>
						<div class="form-group row mb-4">
							<label for="email"
								class="col-sm-3 col-form-label text-right tm-color-primary">Thumbnail</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="thumbnail"
									id="thumbnail" type="file" required>
							</div>
						</div>
						<div class="form-group row mb-4">
							<label for="subject"
								class="col-sm-3 col-form-label text-right tm-color-primary">Thể
								loại</label>
							<div class="col-sm-9">

								<select name="idcategory" id="idcategory"
									class="form-control mr-0 ml-auto">
									<%
									List<Category> listcate = CategoryDAO.getAllCategory();
									request.setAttribute("list", listcate);
									%>
									<c:forEach items="${list}" var="li">
										<option value="${li.getIdcategory()}">${li.getCategoryname()}</option>
									</c:forEach>

								</select>
							</div>
						</div>
						
						<div class="form-group row text-right">
							<div class="col-12">
								<button type="submit" class="tm-btn tm-btn-primary tm-btn-small">Submit</button>
							</div>
						</div>
					</form>
				</div>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.Function.*,com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String usn = (String) session.getAttribute("username") ;
if((String) session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="components/scription.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/4.1.4/css/froala_editor.min.css" integrity="sha512-nE3o3phBEArbD2amu3pcDWO7fB2JB9c2Rxa2Bi4PYRwDax3UsaTRfFr1vfzn7ypYt5nU05Lwax18ls330TtBXw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
<%
String mess ="";
if(request.getParameter("submit")!=null){
	int idseri = Integer.parseInt(request.getParameter("idseri"));
	int indexpart = SeriDAO.makeNewPart(idseri);
	String content = request.getParameter("content");
	String des = request.getParameter("description");
	String datetime = Function.getCurrentTime();
	Seripart sr = new Seripart(idseri,indexpart,content,datetime,des);

	boolean check = SeripartDAO.addSeriPart(sr);
	if(check){
		mess="Đã đăng tải phần mới nhất";
	}
	else{
		out.println("Them bi loi roi");
	}
	
	
}
%>
			<div class="row tm-row tm-mb-120">
				<div class="col-12">
					<h2 class="tm-color-primary tm-post-title tm-mb-60">Thiết lập Seri mới</h2>
					<p> Chưa có seri sẵn? <a href="setupseri.jsp">Tạo seri mới</a> </p>
				</div>
				<div class="col-lg-12 tm-contact-left">
					<form method="post"
						class="mb-5 ml-auto mr-0 tm-contact-form-send" >
						
						<div class="form-group row mb-4">
							<label for="subject"
								class="col-sm-3 col-form-label text-right tm-color-primary">Seri của bạn</label>
							<div class="col-sm-9">

								<select name="idseri" id="idseri"
									class="form-control mr-0 ml-auto">
									<%
									List<Seri> listcate = SeriDAO.getAllSeri(usn);
									request.setAttribute("list", listcate);
									%>
									<c:forEach items="${list}" var="li">
										<option value="${li.getIdseri()}">${li.getTitle()} </option>
									</c:forEach>

								</select>
							</div>
						</div>
						<div class="form-group row mb-12">
							<label for="title"	
								class="col-sm-3 col-form-label text-right tm-color-primary">Sơ lược</label>
							<div class="col-sm-9" >
								<input class="form-control mr-0 ml-auto" name="description"
									 required> 
							</div>
						</div>
						<div class="form-group row mb-12">
							<label for="title"	
								class="col-sm-3 col-form-label text-right tm-color-primary">Nội dung</label>
							<div class="col-sm-9" >
								<textarea id="editor" class="form-control mr-0 ml-auto" name="content"
									id="content" style="height:400px" required></textarea>
							</div>
						</div>
						<div class="form-group row text-right">
							<div class="col-12">
								<input type="submit" class="tm-btn tm-btn-primary tm-btn-small" value="Lưu" name="submit" />
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/4.1.4/js/froala_editor.min.js" integrity="sha512-yPOpUhNntIRUVQib/cEJu0qXLE/BerbIPdtVtVia4J/2tyD1pIsmMhIU2u1ePc4V0nl10WfQIKicNHrT9fGMQA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<script>
	var floatEditor = new FroalaEditor("#editor");
	</script>
	
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/templatemo-script.js"></script>
</body>
</html>
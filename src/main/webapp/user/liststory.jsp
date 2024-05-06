<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.DAO.*, com.Model.*, java.util.*, com.Function.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
<%
int idcate = 0;
String mess = "";
String uss = "";
if((String) session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}
else{
	uss = (String) session.getAttribute("username");
}


// lay du lieu theo the loai
String search = request.getParameter("search");
List<Seri> listpc = new ArrayList<>();
if (search == "" || search == null) {
	idcate = Integer.parseInt(request.getParameter("idcate"));
	listpc = SeriDAO.seriByCate(idcate);
	request.setAttribute("listpc", listpc);
} else {
	listpc = SeriDAO.searchSeri(search);
	request.setAttribute("listpc", listpc);
}


// luu seri
if(request.getParameter("submit")!=null){
		out.println("Đã nhận thông tin");
		int s_idseri = Integer.parseInt(request.getParameter("idseri"));
		String s_date = Function.getCurrentTime();
		out.println(s_idseri+"---"+ uss +"---"+ s_date);
		boolean s_ch = SavedSeriDAO.saveSeri(uss, s_idseri, s_date);
		if(s_ch){
			int idcateg = Integer.parseInt(request.getParameter("idcate"));
			response.sendRedirect("liststory.jsp?idcate="+idcateg);
			
		}
}
else{
	out.println("Chưa nhận thông tin");
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
				<h2>Danh sách câu chuyện</h2>
				<a href="#">Xem tất cả <i class="fas fa-arrow-right"></i></a>
			</div>

			<div class="post-flex">
				<div class="list-selection">
					<h4>Thể loại</h4>
					<div class="selection-category">
						<a href="liststory.jsp?idcate=0" class="selection-item">Tất cả</a>
						<%
						List<Category> listcate = CategoryDAO.getAllCategory();
						request.setAttribute("list", listcate);
						%>
						<c:forEach items="${list}" var="icate">
							<a href="liststory.jsp?idcate=${icate.getIdcategory()}"
								class="selection-item">${icate.getCategoryname()}</a>
						</c:forEach>

					</div>

				</div>

				<%
				
				
				for(Seri lpc : listpc){
					
				%>
				<div class="post-flex-item">
					<a href="detailstory.jsp?idseri=<%= lpc.getIdseri()%>&indexpart=1" >
						<div class="post-img">
							<img src="<%= lpc.getThumbnail()%>" alt="">
							<div class="form-save"> 
								<a title="Lưu" id="save_label" class="form-save-label" href="Action/SaveSeriAction.jsp?idseri=<%=lpc.getIdseri()%>&idcate=<%=idcate%>&username=<%=uss%>">
								<i class="fa-<% if(SavedSeriDAO.checkIsSaved(uss, lpc.getIdseri())) { out.println("solid");}else{out.println("regular");}%> fa-bookmark"></i>
								</a>
							</div>
						</div>
						<div class="post-detail">
							<p class="post-detail-title"><%= lpc.getTitle()%></p>
							<p class="post-detail-abtract"> <%= lpc.getAbtract()%></p>
							<p class="post-detail-author">
								2002-02-02 - Kinh dị 18+ - posted by <Strong>Author</Strong>
							</p>
						</div>
					</a>
					</div>
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
	<script>
	
	const saveLab = document.getElementById("save_label");
	saveLab.addEventListener('click',(event) =>{
		event.stopPagation()
	})
	
	</script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/templatemo-script.js"></script>
</body>
</html>
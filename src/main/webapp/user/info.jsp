<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
String readPut = "readonly";
String uss = "";
String border = "border:none";
String btn_submit = "display:none";
String outline = "outline:none";
int readIn = 0;
if(request.getParameter("readIn")!= null){
	readIn = Integer.parseInt(request.getParameter("readIn"));
}
if(readIn == 1){
	readPut = "";
	border = "";
	btn_submit ="";
	outline = "";
}
if((String) session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}
uss = (String) session.getAttribute("username");
User u = UserDAO.getUserByUsername(uss);
%>
<jsp:include page="components/scription.jsp" />
</head>
<body>
	<jsp:include page="components/header.jsp" />
	<div class="container-fluid">
	<%
	String mess = "";
	if(request.getParameter("submit")!=null){
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String description = request.getParameter("description");
		boolean ch = UserDAO.changeInfo(username, fullname, description);
		if(ch==true){
			mess = "Cập nhật thành công";
		}
		else{
			mess = "Thay đổi thông tin thất bại";
		}
	}
	
	%>
		<main class="tm-main">
			<!-- Search form -->
			<div class="row tm-row">
				<div class="col-12">
					<jsp:include page="components/formsearch.jsp" />
				</div>
			</div>
			<div class="col-lg-10 tm-contact-left">
					<form 
						class="mb-5 ml-auto mr-0 tm-contact-form-send" method="post">
						<h2>Thông tin tài khoản</h2>
						<div class="form-group row mb-2">
							<p class="form-group col-12" style="color:green"> <%=mess %> </p>
						</div>
						<div class="form-group row mb-2 mt-10">
							<label for="username"
								class="col-sm-4 col-form-label text-right tm-color-primary">Tài khoản</label>
							<div class="col-sm-8">
								<input name="username" class=" mr-0 ml-auto col-12" value="<%=u.getUsername() %>" readonly style="border:none; <%=outline%>"/>
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="password"
								class="col-sm-4 col-form-label text-right tm-color-primary">Họ tên đầy đủ</label>
							<div class="col-sm-8">
								<input name="fullname" class=" mr-0 ml-auto col-12" value="<%=u.getFullname() %>" <%=readPut %>   style="<%=border %>; <%=outline%>"/>
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="password"
								class="col-sm-4 col-form-label text-right tm-color-primary">Vị trí</label>
							<div class="col-sm-8">
								<p class=" mr-0 ml-auto"> <%=UserDAO.getNamePosition(u.getPosition()) %></p>
							</div>
						</div>
						<div class="form-group row mb-2">
							<label for="password"
								class="col-sm-4 col-form-label text-right tm-color-primary">Mô tả</label>
							<div class="col-sm-8">
								<textarea name="description" class=" mr-0 ml-auto col-12" style="min-height:350px;<%=border %>" <%=readPut %>  > <%=u.getDescription() %> </textarea>
							</div>
						</div>
						
						<div class="form-group row text-right">
							<div class="col-6">
								<a href="info.jsp?readIn=1" class="tm-btn tm-btn-primary tm-btn-small">Thay đổi thông tin</a>
								<a href="changepassword.jsp" class="tm-btn tm-btn-primary tm-btn-small">Đổi mật khẩu</a>
							</div>
							<div class="col-6">
								<input name="submit" type="submit" value="Lưu" style="<%=btn_submit %>"/>
							</div>
						</div>
						
					</form>
					<div class="list-save-seri">
					<h2>Sê-Ri Đã Lưu</h2>
					<%
					List<SavedSeri> lseri = SavedSeriDAO.getAllByUsername(uss);
					for(SavedSeri ss: lseri){
					Seri s = SeriDAO.getSeriById(ss.getIdseri());
					%>
						<div class="list-save-item">
							<a class="item-link" href="detailstory.jsp?idseri=<%= s.getIdseri()%>&indexpart=1">
								<div class="item-img">
								<img alt="" src="<%=s.getThumbnail()%>">
								</div>
								<div class="item-des">
								<p class="item-des-title"><%=s.getTitle()%></p>
								<p> <i><%=CategoryDAO.getNamebyID(s.getIdcategory())%></i> by <strong><%=s.getUsername()%></strong> </p>
								</div>
								
							</a>
							<a class="item-save" href="Action/UnSaveAction.jsp?idseri=<%= s.getIdseri()%>&username=<%=uss %>" >
							<i class="fa-solid fa-trash"></i>
							</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
		</main>
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/templatemo-script.js"></script>
</body>
</html>
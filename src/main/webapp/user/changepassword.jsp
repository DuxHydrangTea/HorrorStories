<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%
String uss = "";


if((String) session.getAttribute("username") == null){
	response.sendRedirect("login.jsp");
}
uss = (String) session.getAttribute("username");
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
		String password =request.getParameter("password");
		String nPassword =request.getParameter("newPassword");
		String rPassword =request.getParameter("confirmPassword");
		if(nPassword!=rPassword){
			mess = "Mật khẩu phải trùng nhau!";
		}
		else{
			boolean ch  = UserDAO.changePassword(username, password, nPassword);
			if(ch){
				mess ="Thay đổi mật khẩu thành công!";
			}
			else{
				mess = "Mật khẩu sai!";
			}
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
						<h2> Thay đổi mật khẩu </h2>
						<div class="form-group row mb-2">
							<p class="form-group col-12" style="color:green"> <%=mess %> </p>
						</div>
						<input name="username" value="<%=uss %>" class=" mr-0 ml-auto col-12" hidden />
						
						<div class="form-group row mb-2 mt-10">
							<label for="username"
								class="col-sm-4 col-form-label text-right tm-color-primary">Mật khẩu hiện tại</label>
							<div class="col-sm-8">
								<input name="password" class=" mr-0 ml-auto col-12" />
							</div>
						</div>
						<div class="form-group row mb-2 mt-10">
							<label for="username"
								class="col-sm-4 col-form-label text-right tm-color-primary">Nhập lại mật khẩu</label>
							<div class="col-sm-8">
								<input name="newPassword" class=" mr-0 ml-auto col-12" />
							</div>
						</div>
						<div class="form-group row mb-2 mt-10">
							<label for="username"
								class="col-sm-4 col-form-label text-right tm-color-primary">Xác nhận mật khẩu</label>
							<div class="col-sm-8">
								<input name="confirmPassword" class=" mr-0 ml-auto col-12" />
							</div>
						</div>
						<div class="form-group row text-right">
							
							<div class="col-12">
								<input name="submit" type="submit" value="Lưu"/>
							</div>
						</div>
						
					</form>
				</div>
		</main>
	</div>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/templatemo-script.js"></script>
</body>
</html>
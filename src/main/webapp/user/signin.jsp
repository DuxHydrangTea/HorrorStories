<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<div class="col-lg-5 tm-contact-left">
					<form method="POST" 
						class="mb-5 ml-auto mr-0 tm-contact-form-send">
						<h2>Đăng ký tài khoản</h2>
						<div class="form-group row mb-5 mt-10">
							<label for="username"
								class="col-sm-3 col-form-label text-right tm-color-primary">Tài khoản</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="username"
									id="username" type="text" required>
							</div>
						</div>
						<div class="form-group row mb-5">
							<label for="password"
								class="col-sm-3 col-form-label text-right tm-color-primary">Mật khẩu</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="password" id="password"
									type="text" required>
							</div>
						</div>
						<div class="form-group row mb-5">
							<label for="password"
								class="col-sm-3 col-form-label text-right tm-color-primary">Xác nhận mật khẩu</label>
							<div class="col-sm-9">
								<input class="form-control mr-0 ml-auto" name="confirm-password" id="password"
									type="text" required>
							</div>
						</div>
						<div class="form-group row mb-5">
							<label for="password"
								class="col-sm-12 col-form-label text-right tm-color-aleart"><%
						if(request.getParameter("submit")!=null){
							String username = request.getParameter("username");
							String password = request.getParameter("password");
							String cPassword = request.getParameter("confirm-password");
							if(UserDAO.signIn(username, password, cPassword)){
								out.println("Đăng ký thành công!");
							}
							else{
								out.println("Đăng ký thất bại do mật khẩu không trùng nhau hoặc đã tồn tại tên người dùng!");
							}
						}
						%></label>
							
						</div>
						
						<div class="form-group row text-right">
							<div class="col-12">
								<input name="submit" type="submit" class="tm-btn tm-btn-primary tm-btn-small" value="Đăng ký" />
							</div>
						</div>
						
						
						
						
						<div class="form-group row text-left">
							<div class="col-12">
							Đã có tài khoản?
								<a href="login.jsp" class="tm-bt">Đăng nhập</a>
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
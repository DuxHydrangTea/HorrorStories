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


			<%
			String message = request.getParameter("message");
			request.setAttribute("message", message);
			%>
			<h3>${message}</h3>
			<a href="index.jsp"> Quay về Trang chủ </a>
		</main>
	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/templatemo-script.js"></script>
</body>
</html>
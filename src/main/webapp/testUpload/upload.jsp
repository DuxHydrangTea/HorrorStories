<%@page
	import="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*,jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.Part, java.io.*"
	%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
%>
<%

out.println("ngu");
Part file = request.getPart("img");
String fileName = file.getSubmittedFileName();
out.println(fileName);
%>
<%@page import ="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*, com.Function.*" %>

<%
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
	String cfpass =request.getParameter("confirm-password");
	if(UserDAO.userLogin(user, pass)){
		session.setAttribute("username", user);
		response.sendRedirect("../index.jsp");
	}
	else{
		response.sendRedirect("../login.jsp");
	}
	
%>

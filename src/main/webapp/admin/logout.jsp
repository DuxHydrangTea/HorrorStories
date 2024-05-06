<%@page import ="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*, com.Function.*" %>

<%
session.removeAttribute("usernameAdmin");
response.sendRedirect("index.jsp");



%>
<%@page import ="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*, com.Function.*" %>

<%
session.removeAttribute("username");
response.sendRedirect("index.jsp");



%>
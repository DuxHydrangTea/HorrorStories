<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  
<%
String name = request.getParameter("categoryname");
String des = request.getParameter("description");
Category c = new Category();
c.setCategoryname(name);
c.setDescription(des);

boolean ch = CategoryDAO.addCategory(c);
if(ch){
	response.sendRedirect("../listCategory.jsp");  
}

%>
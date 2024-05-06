<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  
<%

int id = Integer.parseInt(request.getParameter("idcategory"));
String name = request.getParameter("categoryname");
String des = request.getParameter("description");
Category ct = new Category(id,name,des);
boolean ch = CategoryDAO.updateCategory(ct);
if(ch){
	String mg = "Update Success!";
	String back = "listCategory.jsp";
	response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
}


%>
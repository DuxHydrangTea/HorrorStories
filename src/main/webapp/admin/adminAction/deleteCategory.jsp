<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  
<%

int id = Integer.parseInt(request.getParameter("idcategory"));

boolean ch = CategoryDAO.deleteCategory(id);
if(ch){
	String mg = "Delete Success!";
	String back = "listCategory.jsp";
	response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
}


%>
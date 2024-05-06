<%@page import ="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*, com.Function.*" %>

<%
	String search = request.getParameter("search");
	
	if(search == null || search == ""){
		
	}
	else{
		response.sendRedirect("../liststory.jsp?idcate=0&search="+search);  
	}
	
%>

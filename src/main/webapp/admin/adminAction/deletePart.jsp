<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  

<%  

	int idseri = Integer.parseInt(request.getParameter("idseri")) ;

	int idseripart = Integer.parseInt(request.getParameter("idseripart")) ;
	boolean check  =  SeripartDAO.deleteSeriPart(idseripart) ;
	if(check == true){
		String mg = "Delete Success with the part of Seri !";
		String back = "listPart.jsp?idseri="+idseri;
		response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
	}
	else{
		String mg = "Delete Failed!";
		response.sendRedirect("../message.jsp?message="+ mg);  
	}
	
%>  
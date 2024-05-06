<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  

<%  

//String back = URLEncoder.encode("tieng viet co dau", "UTF-8");
	int id = Integer.parseInt(request.getParameter("idseri")) ;
	String message ="";
	boolean check  = SeriDAO.deleteSeriWithPart(id);
	if(check == true){
		String mg = "Delete Success with the Story !";
		String back = "listSeri.jsp";
		response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
	}
	else{
		String mg = "Delete Failed!";
		response.sendRedirect("../message.jsp?message="+ mg);  
	}
	
%>  
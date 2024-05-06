<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  

<%  

//String back = URLEncoder.encode("tieng viet co dau", "UTF-8");
	int iduser = Integer.parseInt(request.getParameter("iduser")) ;
	boolean check  = UserDAO.deleteUser(iduser);
	if(check == true){
		String mg = "Delete Success with the User !";
		String back = "listUser.jsp";
		response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
	}
	else{
		String mg = "Delete Failed!";
		response.sendRedirect("../message.jsp?message="+ mg);  
	}
	
%>  
<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  

<%  

//String back = URLEncoder.encode("tieng viet co dau", "UTF-8");
	int iduser = Integer.parseInt(request.getParameter("iduser")) ;
	int block = Integer.parseInt(request.getParameter("block")) ;
	boolean check  = UserDAO.blockUserFunction(iduser, block);
	if(check == true){
		response.sendRedirect("../listUser.jsp");  
	}
	else{
		String mg = "Delete Failed!";
		String back = "listUser.jsp";
		response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
	}
	
%>  
<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  

<%  
int idd = Integer.parseInt(request.getParameter("indexpart"));

 int idstory = Integer.parseInt(request.getParameter("idstory"));
 String commenter = request.getParameter("commentedperson");
 String commenttext = request.getParameter("commenttext");
 String commentedtime = Function.getCurrentTime();
 Comment cmt = new Comment(idstory,commenter,commenttext,commentedtime);
 boolean addCMT = CommentDAO.addComment(cmt);
 if(addCMT == true){
	 response.sendRedirect("../detailstory.jsp?idseri="+idstory+"&indexpart="+idd);  
 }

%>  
<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  
<%

int idseripart = Integer.parseInt(request.getParameter("idseripart"));
int indexpart = Integer.parseInt(request.getParameter("indexpart"));
int idseri = Integer.parseInt(request.getParameter("idseri"));

String content = request.getParameter("content");
String description = request.getParameter("description");
Seripart sp  = new Seripart();
sp.setIdseripart(idseripart);
sp.setIndexpart(indexpart);
sp.setContent(content);
sp.setDescription(description);

if(SeripartDAO.updateSeriPart(sp)){
	String mg = "Update Success with the part of Seri !";
	String back = "listPart.jsp?idseri="+idseri;
	response.sendRedirect("../message.jsp?message="+ mg+"&back="+back);  
}



%>
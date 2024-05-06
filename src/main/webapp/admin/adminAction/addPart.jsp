<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  
<%

int idseri = Integer.parseInt(request.getParameter("idseri")) ;
int indexpart = Integer.parseInt(request.getParameter("indexpart"));
String des = request.getParameter("description");
String content = request.getParameter("content");
String createddate = Function.getCurrentTime();
Seripart sp = new Seripart(idseri,indexpart,content, createddate,des);
boolean ch = SeripartDAO.addSeriPart(sp);
if(ch){
	response.sendRedirect("../listPart.jsp?idseri="+idseri);  
}
else{
	String mg = "Adding Failed!";
	response.sendRedirect("../message.jsp?message="+ mg);  
}
%>
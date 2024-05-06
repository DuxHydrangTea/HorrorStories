<%@page import ="com.DAO.UserDAO,com.DAO.*,com.Model.*, com.Model.User, java.util.*, com.Function.*" %>

<%
	int idseri = Integer.parseInt(request.getParameter("idseri"));
	int indexpart = SeriDAO.makeNewPart(idseri);
	String content = request.getParameter("content");
	String des = request.getParameter("description");
	String datetime = Function.getCurrentTime();
	Seripart sr = new Seripart(idseri,indexpart,content,datetime,des);

	boolean check = SeripartDAO.addSeriPart(sr);
	if(check){
		out.println("Them part thanh cong");
	}
	else{
		out.println("Them bi loi roi");
	}
	
	
%>

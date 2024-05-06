<%@page import="com.Model.*, com.DAO.*, com.Function.*"%>  

<%
		int s_idseri = Integer.parseInt(request.getParameter("idseri"));
		String uss = request.getParameter("username");
		String s_date = Function.getCurrentTime();
		boolean s_ch = SavedSeriDAO.saveSeri(uss, s_idseri, s_date);
		if(s_ch){
			int idcateg = Integer.parseInt(request.getParameter("idcate"));
			response.sendRedirect("/TruyenMa/user/liststory.jsp?idcate="+idcateg);
		}

 %>
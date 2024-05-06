<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.*,com.Model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%
 String useradmin ="";
 if((String)session.getAttribute("usernameAdmin") == null || (String)session.getAttribute("usernameAdmin")  == ""){
	 response.sendRedirect("login.jsp");
 }
 else{
	 useradmin = (String)session.getAttribute("usernameAdmin");
 }
 
 %>
<jsp:include page="components/sidebar.jsp" />
<jsp:include page="components/asign.jsp" />

<div class="flex flex-col flex-1 w-full">

	<jsp:include page="components/header.jsp" />

    <main class="h-full overflow-y-auto">
        <div class="container px-6 mx-auto grid">
            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                Chào mừng đã tới trang Quản trị viên
            </h2>
            <h3>Chọn danh mục bên trái màn hình để chọn chức năng cần làm !</h3>

        </div>
    </main>
</div>
</div>
</body>

</html>
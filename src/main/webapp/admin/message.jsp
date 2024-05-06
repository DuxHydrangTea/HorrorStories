<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.*,com.Model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="components/sidebar.jsp" />
<jsp:include page="components/asign.jsp" />

<div class="flex flex-col flex-1 w-full">

	<jsp:include page="components/header.jsp" />

    <main class="h-full overflow-y-auto">
        <div class="container px-6 mx-auto grid">
            <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                Thông báo:
            </h2>
            <h3>
            <%= request.getParameter("message") %>
            
            </h3>
			<a class="link-back-home" href="<%= request.getParameter("back") %>"> Quay Về Trang Chính </a>
        </div>
    </main>
</div>

</body>

</html>
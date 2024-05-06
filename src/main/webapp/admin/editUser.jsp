<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.*,com.Model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/4.1.4/css/froala_editor.min.css" integrity="sha512-nE3o3phBEArbD2amu3pcDWO7fB2JB9c2Rxa2Bi4PYRwDax3UsaTRfFr1vfzn7ypYt5nU05Lwax18ls330TtBXw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<jsp:include page="components/sidebar.jsp" />
<jsp:include page="components/asign.jsp" />

<div class="flex flex-col flex-1 w-full">

	<jsp:include page="components/header.jsp" />



	<%
	int iduser =Integer.parseInt(request.getParameter("iduser")) ;
	User us = UserDAO.getFirstUser(iduser);
	String ban = us.isIsbanned()==1?"selected":"";
	%>
    <main class="h-full pb-16 overflow-y-auto">
            <div class="container px-6 mx-auto grid">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                </h2>
                <!-- CTA -->


                <!-- General elements -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                    Người dùng
                </h4>
                <form method="POST"  action="../EditUser" enctype="multipart/form-data" >
                    <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
							<input type="text" value="<%=us.getIduser() %>" name="iduser" hidden>
                         
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Tên người dùng</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="username" value="<%=us.getUsername() %>" readonly />
                        </label>
						<label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Họ tên</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="fullname" value="<%=us.getFullname() %>"  />
                        </label>
                        
                       

                         <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">
                               Ban
                            </span>
                           
                            <select name="isbanned" class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
								<option value="0" <%out.println(ban); %>>Không cấm</option>
								<option value="1"<%out.println(ban); %>>Cấm</option>
                            </select>	
							
                           
                        </label>

						 <label class="block text-sm mb-8">
                            <span class="text-gray-700 dark:text-gray-400">Tiểu sử</span>
                            <textarea id="description" style="min-height:350px" name="description" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"><%=us.getDescription() %></textarea>
                        </label>

                            <div class="flex mt-6 text-sm">
                                <div class="btn-submit">
                                    <button type="submit" name="btn-edit-post" class="btn-xanh">
                                        Lưu</button>
                                </div>
                            </div>
                        </div>
                    </form>
             

        </div>
    </main>
</div>
</div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/4.1.4/js/froala_editor.min.js" integrity="sha512-yPOpUhNntIRUVQib/cEJu0qXLE/BerbIPdtVtVia4J/2tyD1pIsmMhIU2u1ePc4V0nl10WfQIKicNHrT9fGMQA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
var floatEditor = new FroalaEditor("#content");
</script>
</html>
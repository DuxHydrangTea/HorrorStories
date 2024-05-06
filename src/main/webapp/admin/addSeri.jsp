<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page
	import="com.DAO.*,com.Model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="components/sidebar.jsp" />
<jsp:include page="components/asign.jsp" />

<div class="flex flex-col flex-1 w-full">

	<jsp:include page="components/header.jsp" />



	<%

	%>
    <main class="h-full pb-16 overflow-y-auto">
            <div class="container px-6 mx-auto grid">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                </h2>
                <!-- CTA -->


                <!-- General elements -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                   Tạo Seri mới
                </h4>
                <form method="POST"  action="../AddSeri" enctype="multipart/form-data">
                    <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Tiêu đề</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="title"  />
                        </label>

                        <label class="block text-sm mb-8">
                            <span class="text-gray-700 dark:text-gray-400">Mô tả ngắn</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="abtract"  />
                        </label>


                         <label class="block text-sm thumbnail">
                            <span class="text-gray-700 dark:text-gray-400">
                            Thumbnail
                            <img alt="" id="img">
                            </span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="thumbnail" type="file" onchange="document.getElementById('img').src = window.URL.createObjectURL(this.files[0])" />
                        </label>	


                        <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">
                                Thể loại
                            </span>
                           
                            <select name="idcategory"
                             <%
                            List<Category> ctg = CategoryDAO.getAllCategory();
                            %>
                                class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                               
                               <%
                               for(Category c:ctg){
                            	
                               %>
                                        <option value="<%= c.getIdcategory()%>">
                                             <%=c.getCategoryname() %>
                                        </option>
								<%
								}
								%>
                            </select>
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

</html>
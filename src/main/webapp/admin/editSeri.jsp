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
	int idedit =Integer.parseInt(request.getParameter("idseri")) ;
	Seri seri = SeriDAO.getSeriById(idedit);
	request.setAttribute("seri", seri);
	%>
    <main class="h-full pb-16 overflow-y-auto">
            <div class="container px-6 mx-auto grid">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                </h2>
                <!-- CTA -->


                <!-- General elements -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                    Seri
                </h4>
                <form method="POST"  action="../EditSeri" enctype="multipart/form-data">
                    <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">

                        ID <input type="text" value="<%=seri.getIdseri() %>" name="idseri" readonly>
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Title</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="title" value="<%=seri.getTitle() %>" />
                        </label>

                        <label class="block text-sm mb-8">
                            <span class="text-gray-700 dark:text-gray-400">Mô tả ngắn</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="abtract" value="<%= seri.getAbtract() %>" />
                        </label>


                         <label class="block text-sm thumbnail">
                            <span class="text-gray-700 dark:text-gray-400">
                            <img alt="" src="../<%= seri.getThumbnail() %>" id="img">
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
                            request.setAttribute("slCate", ctg);
                            %>
                                class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                               
                               <c:forEach var="cate" items="${slCate}">
                               
                                        <option 
                                            value="${cate.getIdcategory() }" <c:if test="${cate.getIdcategory()==story.getIdcategory()}">
                                            	selected
                                            </c:if>>
                                            ${cate.getCategoryname() }
                                            
                                            
                                        </option>
                                </c:forEach>      
	
                            </select>
                        </label>
                        <label class="block mt-4 text-sm">
                        Người đăng:  <input name="username" value="<%=seri.getUsername() %>" type="text" readonly/>
                       </br>
                       Ngày đăng: 
                            <input name="createdtime" value="<%=seri.getCreatedtime() %>" type="text" readonly/>
                        
                        </label>
                       


                            <div class="flex mt-6 text-sm">
                                <div class="btn-submit">
                                    <button type="submit" name="btn-edit-post" class="btn-xanh">
                                        Sửa bài viết</button>
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
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
	int idedit =Integer.parseInt(request.getParameter("idseripart")) ;
	Seripart seri = SeripartDAO.getByIDSeriPart(idedit);
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
                <form method="POST"  action="adminAction/editPart.jsp" >
                    <div class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
							<input type="text" value="<%=seri.getIdseri() %>" name="idseri" hidden>
                        	<input type="text" value="<%=seri.getIdseripart() %>" name="idseripart" hidden>
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Sơ lược (description)</span>
                            <input
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                name="description" value="<%=seri.getDescription() %>" />
                        </label>

                         <label class="block mt-4 text-sm">
                            <span class="text-gray-700 dark:text-gray-400">
                               Phần
                            </span>
                           
                            <select name="indexpart" class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
								    <%
                            int sumpart =  SeriDAO.getSumPart(seri.getIdseri());
								  
							for(int i = 1; i<=sumpart; i++){
								
								%>
								 <option value="<%=i %>" <% String x = (seri.getIndexpart()==i)?"selected":""; out.println(x);  %>><%=i %>  </option>
								 	<%
							}
                            %>
                            </select>	
							
                           
                        </label>

						 <label class="block text-sm mb-8">
                            <span class="text-gray-700 dark:text-gray-400">Nội dung</span>
                            <textarea id="content" style="min-height:700px" name="content" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"><%= seri.getContent()%></textarea>
                        </label>

                            <div class="flex mt-6 text-sm">
                                <div class="btn-submit">
                                    <button type="submit" name="btn-edit-post" class="btn-xanh">
                                        Lưu phần truyện</button>
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
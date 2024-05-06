package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.SeriDAO;
import com.Function.Function;
import com.Model.Seri;

/**
 * Servlet implementation class SetupSeri
 */
@MultipartConfig
public class SetupSeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetupSeri() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part file = request.getPart("thumbnail");

		PrintWriter out = response.getWriter();
		String  title = request.getParameter("title");
		String username = request.getParameter("username");
		String abtract = request.getParameter("abtract");
		String thumbnail = Function.uploadImage(file);
		int idcategory = Integer.parseInt(request.getParameter("idcategory"));
		String cdate = Function.getCurrentTime();
		Seri sr = new Seri(title,abtract,idcategory,username,thumbnail,cdate);
		boolean checkSr = SeriDAO.addSeri(sr);
		if(checkSr) {
			response.sendRedirect("user/setupseri.jsp");
		}
		else {
			out.println("false!!!!!!!!!!");

		}
	}

}

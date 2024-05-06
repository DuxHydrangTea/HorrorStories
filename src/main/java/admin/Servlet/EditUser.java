package admin.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;

import com.DAO.UserDAO;
import com.Function.Function;
import com.Model.User;

/**
 * Servlet implementation class EditUser
 */
@MultipartConfig
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUser() {
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
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset = UTF-8");
		
		int iduser = Integer.parseInt(request.getParameter("iduser"));
		String fullname = request.getParameter("fullname");
		int ban = Integer.parseInt(request.getParameter("isbanned"));
		String des = request.getParameter("description");
		User us = new User();
		us.setIduser(iduser);
		us.setFullname(fullname);
		us.setIsbanned(ban);
		us.setDescription(des);
		if(UserDAO.updateUser(us)) {
			request.getRequestDispatcher("/admin/listUser.jsp").forward(request, response);

		}
		
	}

}

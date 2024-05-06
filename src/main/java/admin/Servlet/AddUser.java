package admin.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.DAO.UserDAO;
import com.Function.Function;
import com.Model.User;

/**
 * Servlet implementation class AddUser
 */
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
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
		
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String descrip = request.getParameter("description");
		User u = new User();
		u.setUsername(username);
		u.setFullname(fullname);
		u.setDescription(descrip);
		if(UserDAO.addUser(u)) {
			request.getRequestDispatcher("/admin/listUser.jsp").forward(request, response);
		}	
		else{
			String mess = "Creating a new user failed may be invalid Username!";
			String back = "http://localhost:8080/TruyenMa/admin/listUser.jsp";
			request.getRequestDispatcher("/admin/message.jsp?message="+mess+"&back="+back).forward(request, response);

		}
	}

}

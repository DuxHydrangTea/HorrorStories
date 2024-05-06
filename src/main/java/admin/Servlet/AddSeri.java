package admin.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;

import com.DAO.SeriDAO;
import com.Function.Function;
import com.Model.Seri;

/**
 * Servlet implementation class AddSeri
 */
@MultipartConfig
public class AddSeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSeri() {
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
		Part file = request.getPart("thumbnail");
		String thumbnail = "";
		if(file.getSize()==0)
		{
			thumbnail="";
		}
		else{
			thumbnail = Function.uploadImage(file);
		}
		String title = request.getParameter("title");
		String abtract = request.getParameter("abtract");
		int idcategory = Integer.parseInt(request.getParameter("idcategory"));
		String username = "admin";
		String create = Function.getCurrentTime();
		Seri sr = new Seri(title, abtract, idcategory, username, thumbnail, create);
		boolean ch = SeriDAO.addSeri(sr);
		if(ch) {
			request.getRequestDispatcher("/admin/listSeri.jsp").forward(request, response);
		}
		else {
			String mess = "Creating a new seri failed may be invalid somethings!";
			String back = "http://localhost:8080/TruyenMa/admin/listSeri.jsp";
			request.getRequestDispatcher("/admin/message.jsp?message="+mess+"&back="+back).forward(request, response);

		}
		
		
	}

}

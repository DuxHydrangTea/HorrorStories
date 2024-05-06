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

import com.DAO.SeriDAO;
import com.Function.Function;

/**
 * Servlet implementation class EditSeri
 */
@MultipartConfig
public class EditSeri extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSeri() {
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
		Part file = request.getPart("thumbnail");
		
		if(file.getSize() == 0) {
			int id = Integer.parseInt(request.getParameter("idseri"));
			String title = request.getParameter("title");
			String abtract = request.getParameter("abtract");
			if(SeriDAO.updateSerinoThumb(id, title, abtract)) {
				request.getRequestDispatcher("/admin/listSeri.jsp").forward(request, response);
			}
			else {
				out.println("failed");
			}
		}
		else {
			int id = Integer.parseInt(request.getParameter("idseri"));
			String title = request.getParameter("title");
			String abtract = request.getParameter("abtract");
			String thumbnail = Function.uploadImage(file);
			if(SeriDAO.updateSeri(id, title, abtract, thumbnail)) {
				out.println("success having file");
			}
			else {
				out.println("failed not file");
			}
		}

		
	}

}

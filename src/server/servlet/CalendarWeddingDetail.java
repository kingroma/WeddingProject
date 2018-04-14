package server.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.wedding.Wedding;
import com.java.wedding.WeddingPhoto;

@WebServlet("/CalendarWeddingDetail")
public class CalendarWeddingDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarWeddingDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String wedding_number = request.getParameter("wedding_number");
		
		Controller controller = new Controller();
		Wedding wedding = controller.getWedding(wedding_number);
		wedding.setWeddingChats(controller.getWeddingChats(wedding_number));
		
		ArrayList<WeddingPhoto> weddingPhotos = controller.getWeddingPhotos(wedding_number);
		for(WeddingPhoto weddingPhoto : weddingPhotos ) {
			weddingPhoto.setUser(controller.getUser(weddingPhoto.getUser_id()));
		}
		
		wedding.setWeddingPhotos(weddingPhotos);
		wedding.setHall(controller.getHall(wedding.getHall_number()));

		request.setAttribute("wedding", wedding);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view/CalendarWeddingDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

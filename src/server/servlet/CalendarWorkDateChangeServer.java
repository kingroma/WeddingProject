package server.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.user.UserWorkDate;

@WebServlet("/CalendarWorkDateChangeServer")
public class CalendarWorkDateChangeServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarWorkDateChangeServer() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("test");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String location_number = request.getParameter("location_number");
		
		String work_date = request.getParameter("work_date");
		String status = request.getParameter("status");
		String user_id = (String)request.getSession().getAttribute("user_id");
		
		if(user_id!=null && work_date != null && status != null && location_number != null) {
			Controller controller = new Controller();
			
			UserWorkDate userWorkDate = new UserWorkDate();
			userWorkDate.setLocation_number(Integer.parseInt(location_number));
			userWorkDate.setStatus(Integer.parseInt(status));
			userWorkDate.setUser_id(user_id);
			userWorkDate.setWork_date(work_date+"0000");
			
			controller.deleteUserWorkDate(userWorkDate);
			
			controller.addUserWorkDate(userWorkDate);
			
		}
	}

}

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
import com.java.location.Location;
import com.java.user.User;
import com.java.user.UserAdmin;
import com.java.user.UserLocation;
import com.java.util.MyDate;

@WebServlet("/CalendarParent")
public class CalendarParent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarParent() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		doGetCalendarParent(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	private void doGetCalendarParent(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher rd = request.getRequestDispatcher("/view/CalendarParent.jsp");
		
		try {
			String user_id = (String)request.getSession().getAttribute("user_id");
			if(user_id==null) {
				response.sendRedirect("/Login");
			}else {
				boolean canForward = true;
				
				Controller controller = new Controller();
				User user = controller.getUser(user_id);
				ArrayList<UserLocation> userLocations = controller.getUserLocations(user_id);
				
				if(userLocations.size()>0) {
				}
				else {
						canForward = false;
						response.sendRedirect("/Error?error_number=1");
				}
				
				if(canForward){
					//ArrayList<Location> locations = new ArrayList<Location>();
					String location_number = request.getParameter("location_number");
					if(location_number==null) {
						location_number = ""+userLocations.get(0).getLocation_number();
					}
					ArrayList<String> thisWeek = MyDate.getThisWeek();
					
					Location location = controller.getLocation(location_number);
					
					request.setAttribute("thisWeek", thisWeek);
					request.setAttribute("user", user);
					request.setAttribute("userLocations", userLocations);
					request.setAttribute("location", location);
					
					UserAdmin userAdmin = new UserAdmin();
					boolean isUser = userAdmin.isAdminUserId(user_id);
					
					request.setAttribute("isAdmin", isUser);
				}
				
				
				
				if(canForward) {
					rd.forward(request, response);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

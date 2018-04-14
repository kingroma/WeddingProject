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
import com.java.location.LocationCheck;
import com.java.location.LocationCheckConfirm;
import com.java.location.LocationPosition;
import com.java.user.UserAdmin;
import com.java.user.UserLocation;
import com.java.user.UserWorkDate;
import com.java.wedding.Wedding;

@WebServlet("/CalendarWedding")
public class CalendarWedding extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalendarWedding() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String location_number = request.getParameter("location_number");
		String work_date = request.getParameter("work_date");
		String user_id = (String)request.getSession().getAttribute("user_id");
		String focus = request.getParameter("focus");
		
		request.setAttribute("focus", focus);
		
		UserAdmin userAdmin = new UserAdmin();
		request.setAttribute("work_date", work_date);
		if(user_id==null) {
			response.sendRedirect("/Login");
		}else {
			Controller controller = new Controller();
			ArrayList<UserLocation> userLocations = controller.getUserLocations(user_id);
			
			ArrayList<Wedding> weddings = controller.getWeddingsWithLocationNumberDate(location_number, work_date);
			
			request.setAttribute("weddings", weddings);
			
			 
			
			Location location = controller.getLocation(location_number);
			location.setLocationIssues(controller.getLocationIssueWithLocationNumberDate(location_number, work_date));
			location.setLocationChats(controller.getLocationChat(Integer.parseInt(location_number), work_date));
			
			request.setAttribute("location", location);
			boolean isUser = userAdmin.isAdminUserId(user_id);
			
			request.setAttribute("isAdmin", isUser);
			request.setAttribute("location", location);
			
			ArrayList<LocationPosition> locationPositions = controller.getLocationPositionsWithDate(location_number, work_date+"0000");
			
			request.setAttribute("locationPositions", locationPositions);

			ArrayList<UserWorkDate> userWorkDates = controller.getUserWorkDatesLocationNumberWorkDate(location_number, work_date+"0000");
			request.setAttribute("userWorkDates", userWorkDates);
			
			ArrayList<LocationCheck> locationChecks = controller.getLocationChecks(Integer.parseInt(location_number));
			request.setAttribute("locationChecks", locationChecks);
			
			ArrayList<LocationCheckConfirm> locationCheckConfirms = controller.getLocationChecksConfirm(work_date);
			for(LocationCheckConfirm locationCheckConfirm : locationCheckConfirms) {
				locationCheckConfirm.setUser(controller.getUser(locationCheckConfirm.getUser_id()));
			}
			request.setAttribute("locationCheckConfirms", locationCheckConfirms);
		}

		RequestDispatcher rd = request.getRequestDispatcher("/view/CalendarWedding.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

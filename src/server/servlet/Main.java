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
import com.java.location.LocationIssue;
import com.java.location.LocationPosition;
import com.java.user.User;
import com.java.user.UserLocation;
import com.java.util.MyDate;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Main() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		doGetMain(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private void doGetMain(HttpServletRequest request, HttpServletResponse response) {
		RequestDispatcher rd = request.getRequestDispatcher("/view/Main.jsp");
		
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
					ArrayList<Location> locations = new ArrayList<Location>();
					ArrayList<String> thisWeek = MyDate.getThisWeek();
					
					
					for(UserLocation userLocation : userLocations) {
						String currentLocationNumber = ""+userLocation.getLocation_number();
						Location location = controller.getLocation(currentLocationNumber);
						
						ArrayList<LocationIssue> locationIssues = new ArrayList<LocationIssue>();
						ArrayList<LocationPosition> locationPositions = new ArrayList<LocationPosition>();
						
						for(String currentDate : thisWeek) {
							locationIssues.addAll(controller.getLocationIssueWithLocationNumberDate(currentLocationNumber, currentDate));
						}
						location.setLocationIssues(locationIssues);
						
						for(String currentDate : thisWeek) {
							locationPositions.addAll(controller.getLocationPositionsWithDate(currentLocationNumber, currentDate+"0000"));
						}
						location.setLocationPositions(locationPositions);
						//System.out.println("locationPosition"+location.getLocationPositions().size());
						locations.add(location);
					}
					
					request.setAttribute("thisWeek", thisWeek);
					request.setAttribute("user", user);
					request.setAttribute("userLocations", userLocations);
					request.setAttribute("locations", locations);
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

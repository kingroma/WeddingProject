package server.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.location.LocationIssue;

@WebServlet("/ControllerLocationIssue")
public class ControllerLocationIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllerLocationIssue() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String issue_number = request.getParameter("issue_number");
		String location_number = request.getParameter("location_number");
		String work_date = request.getParameter("work_date");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String method = request.getParameter("method");
		
		// add delete 
		Controller controller = new Controller();
		//System.out.println(issue_number+"/"+location_number+"/"+work_date+"/"+title+"/"+text+"/"+method);
		if(method!=null && method.equals("add") && location_number != null && work_date != null && title != null && text != null) {
			LocationIssue locationIssue = new LocationIssue();
			locationIssue.setLocation_number(Integer.parseInt(location_number));
			locationIssue.setText(text);
			locationIssue.setTitle(title);
			locationIssue.setWork_date(work_date);
			
			controller.addLocationIssue(locationIssue);
			response.sendRedirect("/CalendarWedding?location_number=" + location_number +"&work_date="+work_date);
		}else if(method!=null && method.equals("delete") && issue_number != null && work_date != null) {
			controller.deleteLocationIssue(Integer.parseInt(issue_number));
			
			response.sendRedirect("/CalendarWedding?location_number=" + location_number +"&work_date="+work_date);
			
		}
	}

}

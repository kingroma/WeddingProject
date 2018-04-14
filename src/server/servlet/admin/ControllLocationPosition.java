package server.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.location.LocationPosition;

@WebServlet("/ControllLocationPosition")
public class ControllLocationPosition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllLocationPosition() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		//iframe.attr("src",src+"user_id="+user_id+"&work_date="+work_date+"&title="+title+"&method=add")
		String user_id = request.getParameter("user_id");
		String work_date = request.getParameter("work_date");
		String title = request.getParameter("title");
		String method = request.getParameter("method");
		String location_number = request.getParameter("location_number");
		String hall_number = request.getParameter("hall_number");
		//System.out.println(user_id + "/"+work_date+"/"+title+"/"+method+"/"+location_number);
		
		if(user_id != null && work_date !=null && title !=null && method!=null && location_number!=null && hall_number!=null) {
			Controller controller = new Controller();
			if(method.equals("add")) {
				LocationPosition locationPosition = new LocationPosition();
				locationPosition.setTitle(title);
				locationPosition.setLocation_number(Integer.parseInt(location_number));
				locationPosition.setUser_id(user_id);
				locationPosition.setWork_date(work_date+"0000");
				locationPosition.setHall_number(Integer.parseInt(hall_number));
				
				controller.addLocationPosition(locationPosition);
				
				System.out.println(user_id + "/"+work_date+"/"+title+"/"+method+"/"+location_number+"/"+hall_number);
			}else if(method.equals("delete")) {
				LocationPosition locationPosition = new LocationPosition();
				locationPosition.setTitle(title);
				locationPosition.setLocation_number(Integer.parseInt(location_number));
				locationPosition.setUser_id(user_id);
				locationPosition.setWork_date(work_date+"0000");
				locationPosition.setHall_number(Integer.parseInt(hall_number));
				
				controller.deleteLocationPosition(locationPosition);
				System.out.println(user_id + "/"+work_date+"/"+title+"/"+method+"/"+location_number+"/"+hall_number);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

package server.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.location.LocationCheckConfirm;

@WebServlet("/ControllLocationCheck")
public class ControllLocationCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllLocationCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String method = request.getParameter("method");
		String check_number = request.getParameter("check_number");
		String user_id = (String)request.getSession().getAttribute("user_id");
		String work_date = request.getParameter("work_date");
		String location_number = request.getParameter("location_number");
		
		if(work_date != null && method != null && check_number != null && user_id !=null && method.equals("change")) {
			LocationCheckConfirm locationCheckConfirm = new LocationCheckConfirm();
			locationCheckConfirm.setCheck_number(Integer.parseInt(check_number));
			locationCheckConfirm.setUser_id(user_id);
			locationCheckConfirm.setWork_date(work_date);
			
			if(locationCheckConfirm.getWork_date().length()==8) {
				locationCheckConfirm.setWork_date(locationCheckConfirm.getWork_date()+"0000");
			}
			
			Controller controller = new Controller();
			controller.addLocationCheckConfirm(locationCheckConfirm);
			
			response.sendRedirect("/CalendarWedding?location_number="+location_number+"&work_date="+work_date+"&focus=5");
			
		}
		
	}

}

package server.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Error")
public class Error extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Error() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		doGetError(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
	public void doGetError(HttpServletRequest request, HttpServletResponse response) {
		String error_number = request.getParameter("error_number");
		
		if(error_number!=null) {
			int number = Integer.parseInt(error_number);
			try {
				RequestDispatcher rd = request.getRequestDispatcher("/view/Error.jsp");
				switch(number) {
				case 1:
					request.setAttribute("msg", "승인 받지 않은 아이디입니다. ");
					break;
				}
				
				rd.forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
}


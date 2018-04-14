package server.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.user.User;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		if(request.getSession().getAttribute("user_id")==null) {
			RequestDispatcher rd = request.getRequestDispatcher("/view/Login.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect("/Main");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		checkLogin(request.getParameter("user_id"),request.getParameter("user_pw") , request,response);
		
	}
	
	//post
	public void checkLogin(String user_id , String user_pw , HttpServletRequest request, HttpServletResponse response) {
		//0 == is not user
		//1 == is not user_pw
		//2 == login
		RequestDispatcher rd = request.getRequestDispatcher("/view/Login.jsp");
		int result = 0;
		Controller controller = new Controller();
		User user = controller.getUser(user_id);
		
		if(user!=null) {
			result++;
			if(user.getUser_pw().equals(user_pw)) {
				result++;
			}
		}
		try {
			switch(result) {
			case 0:
				// id 조회 되지 않음
				request.setAttribute("msg", "조회되는 아이디가 없습니다.");
				rd.forward(request, response);
				break;
			case 1: 
				// pw 틀림
				request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
				rd.forward(request, response);
				break;
				
			case 2:
				// login
				request.getSession().setAttribute("user_id", user_id);
				response.sendRedirect("/Main");
				break;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

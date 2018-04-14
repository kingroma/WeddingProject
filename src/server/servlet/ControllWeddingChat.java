package server.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.wedding.WeddingChat;

@WebServlet("/ControllWeddingChat")
public class ControllWeddingChat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllWeddingChat() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String wedding_number = request.getParameter("wedding_number");
		String text = request.getParameter("weddingChatText");
		String user_id = (String)request.getSession().getAttribute("user_id");
		String method = request.getParameter("method");
		
		Controller controller = new Controller();
		System.out.println(method+" / " + wedding_number + "/" + text + "/" + user_id + "/");
		if(method!=null && wedding_number!=null && text!=null && user_id!=null && method.equals("add")) {
			
			WeddingChat weddingChat = new WeddingChat();
			weddingChat.setText(text);;
			weddingChat.setUser_id(user_id);
			weddingChat.setWedding_number(Integer.parseInt(wedding_number));
			
			controller.addWeddingChat(weddingChat);
			
			response.sendRedirect("/CalendarWeddingDetail?wedding_number="+wedding_number);
		}
	}

}

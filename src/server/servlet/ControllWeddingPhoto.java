package server.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.controller.Controller;
import com.java.wedding.WeddingPhoto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ControllWeddingPhoto")
public class ControllWeddingPhoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ControllWeddingPhoto() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setCharacterEncoding("UTF-8");
		//request.setCharacterEncoding("UTF-8");
		
		int sizeLimit=10*1024*1024;
		String savePath = "/Users/mac/Desktop/pmk2/WeddingProject/WebContent/weddingPhoto/";
		String urlPath = "/weddingPhoto/";
		String user_id = (String)request.getSession().getAttribute("user_id");
		
		MultipartRequest multi=new MultipartRequest(request, savePath, sizeLimit, "UTF-8" ,new DefaultFileRenamePolicy());
		String method = multi.getParameter("method");
		String wedding_number = multi.getParameter("wedding_number");
		
		File file = multi.getFile("file");
		Controller controller = new Controller();
		if(method!=null && wedding_number!=null && file !=null && method.equals("add") && user_id != null) {
			WeddingPhoto weddingPhoto = new WeddingPhoto();
			weddingPhoto.setImgUrl(urlPath+file.getName());
			weddingPhoto.setUser_id(user_id);
			weddingPhoto.setTitle("");
			weddingPhoto.setWedding_number(Integer.parseInt(wedding_number));
			controller.addWeddingPhoto(weddingPhoto);
			
			response.sendRedirect("/CalendarWeddingDetail?wedding_number="+wedding_number);
		}
	}

}

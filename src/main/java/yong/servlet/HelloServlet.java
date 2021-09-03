package yong.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw = resp.getWriter();
		pw.println("<!DOCTYPE html>");
		pw.println("<html lang=\"ko\">");
		pw.println("<head>");
		pw.println("<meta charset=\"UTF-8\">");
		pw.println("<title>Document</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>");
		pw.println("내가 만든 첫 서블릿");
		pw.println("<h1>");
		pw.println("서블릿 매핑 성공");
		pw.println("</h1>");
		pw.println("</body>");
		pw.println("</html>");
		
	}

}

package yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuguServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter pw = resp.getWriter();

		pw.println("<!DOCTYPE html>");
		pw.println("<html lang=\"ko\">");
		pw.println("<head>");
		pw.println("<title>구구단 출력</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>구구단 출력</h1>");
		pw.println("<br>");
		
		for (int i = 2; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
				pw.println("<h5>");
				pw.println(i + " * " + j + " = " + i * j);
				pw.println("</h5>");
			}
			pw.println("<br>");
		}
		
		pw.println("</body>");
		pw.println("</html>");

		pw.close();
	}

}

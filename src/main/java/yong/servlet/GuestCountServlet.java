package yong.servlet;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestCountServlet extends HttpServlet {

	private int count;
	private String fileName;

	public GuestCountServlet() {
		count = 0;
		fileName = "/count.txt";
	}
	
	@Override
	public void init() throws ServletException {
		try {
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String strcount = br.readLine();
			count = Integer.parseInt(strcount);
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter pw = resp.getWriter();

		pw.println("<!DOCTYPE html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>");
		pw.println("서블릿 라이프 사이클");
		pw.println("</title>");
		pw.println("</head>");
		pw.println("<body>");

		count++;

		pw.println("<h1 style='color:blue;'>");
		pw.println("현재까지의 접속자 수 : ");
		pw.println("<span style='color:red;'>");
		pw.println(count + "명");
		pw.println("</span>");
		pw.println("</h1>");

		pw.println("</body>");
		pw.println("</html>");

		pw.close();
	}

	public void saveCount() {
		try {
			FileWriter fw = new FileWriter(fileName);
			PrintWriter pw = new PrintWriter(fw, true);
			pw.println(count);
			pw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void destroy() {
		saveCount();
	}

}

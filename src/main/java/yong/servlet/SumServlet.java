package yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SumServlet extends HttpServlet {
	
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
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>");
		pw.println("성적 산출 사이트");
		pw.println("</title>");
		
		String style = "<style>\r\n"
				+ "        #wrap {\r\n"
				+ "            text-align: center;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #tb1 {\r\n"
				+ "            border-collapse: collapse;\r\n"
				+ "            margin: 0 auto;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        #tb1 tr th,\r\n"
				+ "        tr td {\r\n"
				+ "            border: 1px solid black;\r\n"
				+ "            padding: 30px;\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        .btn{\r\n"
				+ "            width: 100px;\r\n"
				+ "            height: 50px;\r\n"
				+ "            cursor: pointer;\r\n"
				+ "        }\r\n"
				+ "    </style>";
		
		pw.println(style);
		
		String script = "<script>\r\n"
				+ "        function show(){\r\n"
				+ "            with(document){\r\n"
				+ "                var kor = parseInt(getElementById('kor').value);\r\n"
				+ "                var eng = parseInt(getElementById('eng').value);\r\n"
				+ "                var mat = parseInt(getElementById('mat').value);\r\n"
				+ "                var sum = kor + eng + mat;\r\n"
				+ "                var avg = sum / 3;\r\n"
				+ "\r\n"
				+ "                var str = '[성적표]\\r\\n';\r\n"
				+ "                str += '국어 점수 : ' + kor + '\\r\\n';\r\n"
				+ "                str += '영어 점수 : ' + eng + '\\r\\n';\r\n"
				+ "                str += '수학 점수 : ' + mat + '\\r\\n';\r\n"
				+ "                str += '총 점수 : ' + sum + '\\r\\n';\r\n"
				+ "                str += '평균 점수 : ' + avg.toFixed(2) + '\\r\\n';\r\n"
				+ "\r\n"
				+ "                alert(str);\r\n"
				+ "            }\r\n"
				+ "        }\r\n"
				+ "    </script>";
		
		pw.println(script);
		pw.println("</head>");
		pw.println("<body>");
		
		String body = "<form name=\"fm\">\r\n"
				+ "        <div id=\"wrap\">\r\n"
				+ "            <h1>성적 입력</h1>\r\n"
				+ "            <table id=\"tb1\">\r\n"
				+ "                <tr>\r\n"
				+ "                    <th>국어</th>\r\n"
				+ "                    <td>\r\n"
				+ "                        <input type=\"text\" id=\"kor\">\r\n"
				+ "                    </td>\r\n"
				+ "                </tr>\r\n"
				+ "                <tr>\r\n"
				+ "                    <th>영어</th>\r\n"
				+ "                    <td>\r\n"
				+ "                        <input type=\"text\" id=\"eng\">\r\n"
				+ "                    </td>\r\n"
				+ "                </tr>\r\n"
				+ "                <tr>\r\n"
				+ "                    <th>수학</th>\r\n"
				+ "                    <td>\r\n"
				+ "                        <input type=\"text\" id=\"mat\">\r\n"
				+ "                    </td>\r\n"
				+ "                </tr>\r\n"
				+ "                <tr>\r\n"
				+ "                    <th colspan=\"2\">\r\n"
				+ "                        <input type=\"button\" class=\"btn\" id=\"sum\" value=\"계산\" onclick='show();'>\r\n"
				+ "                        <input type=\"button\" class=\"btn\" id=\"cancel\" value=\"취소\">\r\n"
				+ "                    </th>\r\n"
				+ "                </tr>\r\n"
				+ "            </table>\r\n"
				+ "        </div>\r\n"
				+ "    </form>";
		
		pw.println(body);
		pw.println("</body>");
		pw.println("</html>");

		pw.close();
	}
	

}

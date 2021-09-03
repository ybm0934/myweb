package yong.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;

public class ServletLifeCycle extends HttpServlet {

	public ServletLifeCycle() {
		// 멤버변수의 초기화
		System.out.println("1. 생성자 호출됨");
	}

	@Override
	public void init() throws ServletException {
		// 기능의 초기화
		System.out.println("2. init() 메서드 호출됨");

	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("3. service() 메서드 호출됨");
	}

	@Override
	public void destroy() {
		// 소멸자 서버가 꺼질 때 자원을 반납하는 용도로 사용
		System.out.println("4. destroy() 메서드 호출됨");
	}

}

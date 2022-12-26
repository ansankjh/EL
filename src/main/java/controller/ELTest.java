package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Member;

@WebServlet("/ELTest")
public class ELTest extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 다양한 유형의 모델값
		
		int no = 7;

		String name = "goodee";
		
		Member member = new Member(20, "admin");

		String[] arr= {"루피", "조로", "상디"};
		
		ArrayList<Member> list = new ArrayList<Member>();
		list.add(new Member(17, "우솝"));
		list.add(new Member(22, "로빈"));
		
		// 속성형태의 저장영역 3군데
		// context영역(어플리케이션영역)
		request.getServletContext().setAttribute("contextNo", no); // jsp application.setAttribute() 톰캣이 꺼질때까지 영원히
		// sesiion영역
		request.getSession().setAttribute("sessionNo", no); // jsp session.setAttribute() // session안에
		// request영역
		request.setAttribute("requestNo", no); // request.setAttribute(); 한번의 요청과 응답으로 끝
		
		// 다양한 자료형을 속성영역에 저장(속성은 Map타입) 키,값
		request.setAttribute("name", name); // 문자열
		request.setAttribute("member", member); // 객체
		request.setAttribute("arr", arr); // 배열
		request.setAttribute("list", list); // 리스트
		
		
		
		// View
		request.getRequestDispatcher("/WEB-INF/view/elTestView.jsp").forward(request, response);
	}
}


	
	


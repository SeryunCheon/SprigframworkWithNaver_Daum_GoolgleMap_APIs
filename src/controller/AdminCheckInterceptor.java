package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import service.MemberService;

@Component
public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private MemberService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		HashMap<String, Object> tempMember = service.getMemberInfo(userid);
//		String check = (String)tempMember.get("admin");
		if (tempMember.get("admin") !=null && tempMember.get("admin").equals(1)) {
			return true;
		} 
		else {
			System.out.println("비관리자가 로그인 하려함");
			request.setAttribute("msgg", "※  관리자만 사용가능한 메뉴입니다.");
			request.getRequestDispatcher("main.do").forward(request, response);
			return false;
		}

		// if (tempMember.get("admin").equals(2)) {
		// request.setAttribute("msgg", "※ 관리자만 사용가능한 메뉴입니다.");
		// request.getRequestDispatcher("main.do").forward(request, response);
		// return false;
		//
		// } else if (tempMember.get("admin") == null) {
		// request.setAttribute("msgg", "※ 관리자만 사용가능한 메뉴입니다.");
		// request.getRequestDispatcher("main.do").forward(request, response);
		// return false;
		// } else
		// return true;

	}

}

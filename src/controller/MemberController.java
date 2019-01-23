package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;

@Controller
public class MemberController {

//	@Autowired
//	private GoogleConnectionFactory googleConnectionFactory;
//	
//	@Autowired
//	private OAuth2Parameters googleOAuth2Parameters;
//	

//	public void setGoogleConnectionFactory(GoogleConnectionFactory googleConnectionFactory) {
//		this.googleConnectionFactory = googleConnectionFactory;
//	}
//
//	public void setGoogleOAuth2Parameters(OAuth2Parameters googleOAuth2Parameters) {
//		this.googleOAuth2Parameters = googleOAuth2Parameters;
//	}
	
	@Autowired
	private MemberService service;

	// Spring MVC 컨트롤러에서 사용할 수 있는 반환유형의 종류

	// 데이터와 페이지 정보가 둘 다 있는 경우
	// -ModelAndView

	// 데이터에 대한 정보만 있는 경우
	// Model or Map(해쉬맵. 키값과 밸류값으로 넘어감)

	// 페이지에 대한 정보만 있는경우
	// String

	// 둘 다 없을 때
	// void

	// @RequestMapping("test.do")
	// public ModelAndView dummy() {
	//
	// ModelAndView mav = new ModelAndView();
	// mav.addObject("msg", service.getData());
	// mav.setViewName("test");
	// return mav;
	// }

	// model.addAllAttributes(service.getMemberInfo(id))<= Map을 통채로 싣기
	// model.addAttibute(arg0); <= 모델 객체를 통채로 싣기
	// model.addAttribute(arg0, arg1); <=키 값 지정 하나의 데이터 싣기

	@RequestMapping("main.do")
	public String main(Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null)
			return "redirect:loginForm.do";
		else {
			model.addAllAttributes(service.getMemberInfo(userid));
			return "main";
		}
	}

	@RequestMapping("memberList.do")
	public ModelAndView memberList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", service.getMemberList());
		mav.setViewName("memeberList");
		return mav;
	}

	@RequestMapping("loginForm.do")
	public String loginForm() {
		// 가져갈 데이터가 없는 경우 반환유형은 String으로 하고
		// return 할 반환값을 return옆에넣어주면됨(얘가 일종의 mav.setViewName("loginForm");역할을 하는거임
		return "loginForm";

	}

	// 둘 다 없을 때
	// void
	@RequestMapping("joinForm.do")
	public void joinForm() {
		// 응답할페이지에 대한 정보가 없는 경우는 (void, Model, Map 경우)
		// 받은 url요청에서' . '이하를 제외한 문자열을 페이지 정보로 사용함
		// ex)joinForm.do -> joinForm
		// 이 요청이 들어오면 처리하는 함수가 void이므로 뷰에대한 정보가 없음.
		// 그러니까 받은 요청이 joinForm.do에서 .이하 떼내고 joinForm이 뷰의 이름이 됨.
	}

	// join.do는 회원정보 데이터들을 파라미터로 받아서
	// 디비에 저장하고, loginForm.do로 리다이렉트 해줘야됨
	// @RequestMapping("join.do")
	// public String join(String id, String pwd, String pwd_Check, String name,
	// String email, String phone, String admin) {
	// //
	// System.out.println("id");
	// // 파라미터가 잘 들어오는지 확인!
	// // 파라미터 이름이 똑같아야함 uid로 하면 없으니까 null값이 뜸
	// // @RequestParam("id") String uid id라는 파라미터의 값을 uid매개변수에 넣어주셈!
	// // required, value, defaultValue의 속성값이 있는데
	// // required값이 true일 경우 해당 파라미터가 없으면 요청처리 못함
	// // defaultValue는 해당 파라미터 값이 들어오지 않았을 경우
	// // 지정한 디폴트 값으로 변수값 대체
	// // id, pwd, pwd_Check, name, email, phone, admin의 파라미터들이 있음
	//
	// service.joinMember(id, pwd, pwd_Check, name, email, phone, admin);
	// return "redirect:loginForm.do";
	// // 리다이렉트하는 방법
	// }

	// join.do는 회원정보 데이터들을 파라미터로 받아서
	// 디비에 저장하고, loginForm.do로 리다이렉트 해줘야됨

	@RequestMapping("join.do")
	public String join(@RequestParam HashMap<String, Object> params,HttpSession session ) {

		System.out.println(params);
		
		try {
			if(service.joinMember(params)) {
				return "redirect:loginForm.do";
			}
			else {
				String msgg="※ 비밀번호가 일치 하지 않거나 id입력이 올바르지 않아 가입이 되지 않았습니다.";
				session.setAttribute("msg", msgg);
				return "redirect:joinForm.do";
			}
		} catch (Exception e) {
			// TODO: handle exception
			if(e instanceof DuplicateKeyException)
				session.setAttribute("msg", "※ 이미 존재하는 id입니다.");
				return "redirect:joinForm.do";							
		}
		finally {
//			return "redirect:loginForm.do";
		}
		
	}

	@RequestMapping("login.do")
	public String login(HttpSession session, String id, String pwd) {
		if (service.login(id, pwd)) {

			session.setAttribute("userid", id);
			return "redirect:main.do";
		} else
			
			return "redirect:loginForm.do";
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		// session.removeAttribute("userid");
		return "redirect:loginForm.do";

	}

	@RequestMapping("memberUpdateForm.do")
	public String memberUpdateForm(Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		if (userid == null)
			return "redirect:loginForm.do";
		model.addAllAttributes(service.getMemberInfo(userid));
		return "memberUpdateForm";
	}

	@RequestMapping("memberUpdate.do")
	public String memberUpdate(@RequestParam HashMap<String, Object> params, HttpSession session) {
		
		service.memberUpdate(params);
		return "redirect:main.do";				
//		if(params.get("pwd") != null || params.get("pwd_CHECK") != null) {
//			if(service.memberUpdate(params)) {
//				return "redirect:main.do";	
//			}
//			else {
//				String checkyourPW1="※ 비밀번호가 일치 하지 않습니다.";
//				session.setAttribute("checkyourPW", checkyourPW1);
//				return "redirect:memberUpdateForm.do";
//				}
//		}
//		else {
//			String checkyourPW2="※ 비밀번호를 입력하지 않아 수정이 되지 않았습니다.";
//			session.setAttribute("checkyourPW", checkyourPW2);
//			return "redirect:memberUpdateForm.do";
//		}

	}

	@RequestMapping("memberDeleteForm.do")
	public ModelAndView memberUpdateForm(String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberList", service.getMemberList());
		mav.setViewName("memberDeleteForm");
		return mav;
	}

	@RequestMapping("memberDelete.do")
	public String memberUpdate(String userid) {
		service.memberDelete(userid);
		return "redirect:memberDeleteForm.do";
	}

	@RequestMapping("CurrentLocationWithGoogle.do")
	public void CurrentLocationWithGoogle() {
		// 응답할페이지에 대한 정보가 없는 경우는 (void, Model, Map 경우)
		// 받은 url요청에서' . '이하를 제외한 문자열을 페이지 정보로 사용함
		// ex)joinForm.do -> joinForm
		// 이 요청이 들어오면 처리하는 함수가 void이므로 뷰에대한 정보가 없음.
		// 그러니까 받은 요청이 joinForm.do에서 .이하 떼내고 joinForm이 뷰의 이름이 됨.
		
		//구글 맵 api사용해서 map 보여주는 기능
	}

	@RequestMapping("CurrentLocationWithDaum.do")
	public void CurrentLocationWithDaum() {
		//다음 맵 api사용해서 map 보여주는 기능
	}

	@RequestMapping("CurrentLocationWithNaver.do")
	public void CurrentLocationWithNaver() {
		//네이버 맵 api사용해서 map 보여주는 기능
	}

//	@RequestMapping(value = "googleLogin.do", method = RequestMethod.POST)
//	public void doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
//	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//	  String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
//	  PrintWriter out;
//	  try {
//			out = response.getWriter();
//			out.write(url);
//			out.flush();
//			out.close();
//		} catch (IOException e) {
//			throw new RuntimeException(e.getMessage(), e);
//		}
//
//	}
	
	
//	@RequestMapping(value = "googleSignInCallback.do", method = RequestMethod.GET)
//	public String doSessionAssignActionPage(HttpServletRequest request)throws Exception{
//	  System.out.println("/jsp/googleSignInCallback");
//	  String code = request.getParameter("code");
//
//	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
//	  AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
//	      null);
//
//	  String accessToken = accessGrant.getAccessToken();
//	  Long expireTime = accessGrant.getExpireTime();
//	  if (expireTime != null && expireTime < System.currentTimeMillis()) {
//	    accessToken = accessGrant.getRefreshToken();
//	    System.out.printf("accessToken is expired. refresh token = {}", accessToken);
//	  }
//	  Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
//	  Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();
//
//	  PlusOperations plusOperations = google.plusOperations();
//	  Person profile = plusOperations.getGoogleProfile();
//	  UserVO vo = new UserVO();
//	  System.out.println(profile.getDisplayName());
//	  vo.setUser_email("구글 로그인 계정");
//	  vo.setUser_name(profile.getDisplayName());
//	  vo.setUser_snsId("g"+profile.getId());
//	  HttpSession session = request.getSession();
//	  vo = service.googleLogin(vo);
//
//	  session.setAttribute("login", vo );
//
//
//	  return "redirect:/";
//	}
//	
	
	
}

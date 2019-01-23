package controller;

import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import model.Board;
import service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@RequestMapping("boardList.do")
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(required = false) String keyword, @RequestParam(defaultValue = "0") int type,
			@RequestParam(required = false) Date startDate, @RequestParam(required = false) Date endDate) {

		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("keyword", keyword);

		if (startDate != null && endDate != null) {
			params.put("startdate", startDate);
			params.put("enddate", endDate);
		}

		if (type == 1) {
			params.put("title", keyword);
		} else if (type == 2) {
			params.put("content", keyword);
		} else if (type == 3) {
			params.put("title", keyword);
			params.put("content", keyword);
		} else if (type == 4) {
			params.put("name", keyword);
		}

		HashMap<String, Object> result = bService.getBoardListPage(params, page);

		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.setViewName("boardList");
		return mav;
	}

	@RequestMapping("view.do")
	public String view(Model model, int num) {
		model.addAttribute("board", bService.readBoard(num));
		return "view";
	}

	@RequestMapping("modifyForm.do")
	public void modifyForm(Model model, int num) {
		model.addAttribute("board", bService.getBoard(num));

	}

	@RequestMapping("modify.do")
	public String modify(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("검사용1");
		Board tempboard = new Board();
		String number = (String) params.get("num");
		int numm = Integer.parseInt(number);
		if(params.get("pass").equals(bService.getBoard(numm).getPass())) {
			tempboard.setNum(numm);
			tempboard.setPass((String) params.get("pass"));
			tempboard.setName((String) params.get("name"));
			tempboard.setEmail((String) params.get("email"));
			tempboard.setTitle((String) params.get("title"));
			tempboard.setContent((String) params.get("content"));
			String cc = (String) params.get("readCount");
			int rc = Integer.parseInt(cc);
			tempboard.setReadCount(rc);
		
			tempboard.setWritedate((Date) params.get("writeDate"));
			tempboard.setFile((String) params.get("file"));
			bService.modifyBoard(tempboard);
			return "redirect:view.do?num=" + params.get("num");
		}
		else {
			System.out.println("검사용2");
		String boardModifymsg = "※ 비밀번호가 일치 하지 않습니다.";
		session.setAttribute("boardModifymsg", boardModifymsg);
		return "redirect:modifyForm.do?num="+ params.get("num");
	}	
	}

	@RequestMapping("write.do")
	public String write(Board board, @RequestParam("ufile") MultipartFile ufile) {
		bService.writeBoard(board, ufile);
		return "redirect:view.do?num=" + board.getNum();
	}

	@RequestMapping("writeForm.do")
	public void writeForm() {

	}

	@RequestMapping("download.do")
	public View download(int num) {

		View view = new DownloadView(bService.getAttachFile(num));
		return view;
	}
	
	@RequestMapping("deleteBoard.do")
	public String deleteBoard(int num) {
		bService.deleteBoard(num);
		return "redirect:boardList.do";
	}

}

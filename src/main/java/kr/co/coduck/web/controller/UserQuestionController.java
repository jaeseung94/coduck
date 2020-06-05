package kr.co.coduck.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.dto.UserQuestionDto;
import kr.co.coduck.form.userQuestionToAdm;
import kr.co.coduck.service.AdminQnaService;
import kr.co.coduck.service.UserQuestionService;
import kr.co.coduck.vo.AdQna;
import kr.co.coduck.vo.AdQnaFile;
import kr.co.coduck.vo.Pagination;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/userquestion")
public class UserQuestionController {

	@Autowired
	private UserQuestionService userQuestionService;
	
	@Autowired
	private AdminQnaService adminQnaService;
	
	//1:1문의 삭제
	@GetMapping("/del.hta")
	public String delInquiry(HttpSession session, @RequestParam("qnaNo")int qnaNo ) {
		User user = (User)session.getAttribute("LU");
		AdQna qna = userQuestionService.getAdQnaByNo(qnaNo);
		if(qna.getUserNo() != user.getNo()) {
			return "redirect:/home.hta?error=deny";
		}
		//문의내역과 관리자 문의내역에서 삭제
		adminQnaService.deleteQna(qnaNo);
		userQuestionService.deleteQna(qnaNo);
		userQuestionService.deleteQnaFile(qnaNo);
		
		return "redirect:/userquestion/userqnatoadmlist.hta?pageno=1";
	}
	
	//1:1문의 수정폼
	@GetMapping("/modify.hta")
	public String modifyInquiry(Model model, HttpSession session, @RequestParam("qnaNo")int qnaNo) {
		AdQna qna = userQuestionService.getAdQnaByNo(qnaNo);
		List<AdQnaFile> files = userQuestionService.getAdQnaFilesByQnaNo(qnaNo);
		model.addAttribute("qna", qna);
		model.addAttribute("files", files);
		return "/user/modifyQuestionForm";
	}
	
	//1:1문의 상세조회
	@GetMapping("/userQnaToAdmDetail.hta")
	public String detailQuestionToAdm(Model model, @RequestParam("qnaNo") int qnaNo, userQuestionToAdm form) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna", userQuestionService.getAdQnaByNo(qnaNo));
		map.put("images", userQuestionService.getAdQnaFilesByQnaNo(qnaNo));
		map.put("ans", adminQnaService.getAnswerByNo(qnaNo));
		model.addAttribute("map", map);
		
		return "/user/userQnaToAdmDetail";
	}
	
	//관리자에게 1:1질문 값 보내기
    @PostMapping("/questionToAdm.hta")
    public String insertAdQna(userQuestionToAdm form, HttpSession session, Model model) throws IOException {
        User user = (User)session.getAttribute("LU");
        
        int qnaNo = userQuestionService.insertAdQna(form, user.getNo());
        return "redirect:/userquestion/userQnaToAdmDetail.hta?qnaNo=" + qnaNo;
    }
    
    //1:1 질문 폼
	@GetMapping("/questionFormToAdm.hta")
	public String userqueston() {
		return "/user/userquestion";
	}
	
	//1:1문의 목록 조회
	@GetMapping("/userqnatoadmlist.hta")
	public String showQuestionListToAdm(Model model, HttpSession session,
			@RequestParam(value = "pageno", required = false, defaultValue = "1") int pageNo) {
		
		Map<String, Integer> criteria = new HashMap<String, Integer>();
		User user = (User)session.getAttribute("LU");
		
		//전체 데이터 불러오기(전체데이터 개수를 pagination에 넘기기 위해)
		int cnt = userQuestionService.getAllAdQnaCntByUserNo(user.getNo());
		Pagination pagination = new Pagination(pageNo, cnt, 5, 5);
		
		criteria.put("userNo", user.getNo());
		criteria.put("beginIndex", pagination.getBeginIndex());
		criteria.put("endIndex", pagination.getEndIndex());
		List<AdQna> qnas = userQuestionService.getAdQnasByCriteria(criteria);
		
		model.addAttribute("qnas", qnas);
		model.addAttribute("pagination", pagination);
		
		return "/user/userQnaToAdmList";
	}
	
	@GetMapping("/myquestionlist.hta")
	public String myquestionlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<UserQuestionDto> userQuestionList = userQuestionService.getUserQuestionListByUserNo(user.getNo());
		model.addAttribute("userQuestionList", userQuestionList);
		return "/user/myquestionlist";
	}
	
	@GetMapping("/userquestion.hta")
	@ResponseBody
	public List<UserQuestionDto> userquestion(HttpSession session, Model model, @RequestParam(value = "sort", required = false, defaultValue = "1") int sort) {
		User user = (User)session.getAttribute("LU");
		Map<String, Object> criteria = new HashMap<String, Object>();
		criteria.put("userNo", user.getNo());
		criteria.put("sort", sort);
		List<UserQuestionDto> userQuestionListNY = userQuestionService.searchQuestion(criteria);
		return userQuestionListNY;
		
	}
}

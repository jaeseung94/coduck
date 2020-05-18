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
import kr.co.coduck.service.UserQuestionService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/userquestion")
public class UserQuestionController {

	@Autowired
	private UserQuestionService userQuestionService;
	
	//1:1문의 내역 조회
	@GetMapping("/userqnatoadmlist.hta")
	public String showQuestionListToAdm(Model model, HttpSession session) {
		User user = (User)session.getAttribute("LU");
		model.addAttribute("qnas", userQuestionService.getAdQnasByUserNo(user.getNo()));
		
		return "user/userQnaToAdmList";
	}
	
	//관리자에게 1:1질문
    @PostMapping("/questionToAdm.hta")
    public String insertAdQna(userQuestionToAdm form, HttpSession session, Model model) throws IOException {
        User user = (User)session.getAttribute("LU");
        
        int qnaNo = userQuestionService.insertAdQna(form, user.getNo());
        model.addAttribute("qna", userQuestionService.getAdQnaByNo(qnaNo));
        model.addAttribute("imgs", userQuestionService.getAdQnaFilesByQnaNo(qnaNo));
        model.addAttribute("qnas", userQuestionService.getAdQnasByUserNo(user.getNo()));
        return "user/userQnaToAdmList";
    }
	
	@GetMapping("/myquestionlist.hta")
	public String myquestionlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<UserQuestionDto> userQuestionList = userQuestionService.getUserQuestionListByUserNo(user.getNo());
		model.addAttribute("userQuestionList", userQuestionList);
		return "user/myquestionlist";
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

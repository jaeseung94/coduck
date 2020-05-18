package kr.co.coduck.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.dto.UserQuestionDto;
import kr.co.coduck.service.UserQuestionService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/userquestion")
public class UserQuestionController {

	@Autowired
	private UserQuestionService userQuestionService;
	
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

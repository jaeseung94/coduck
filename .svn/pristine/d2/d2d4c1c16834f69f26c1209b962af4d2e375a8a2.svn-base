package kr.co.coduck.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.coduck.dto.LikeLectListDto;
import kr.co.coduck.service.LikeLectService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/like")
public class LikeLectController {

	@Autowired
	private LikeLectService likeLectService;
	
	@GetMapping("/likelectlist.hta")
	public String likeLectList(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<LikeLectListDto> userLikeLectList = likeLectService.getLikeLectsByUserNo(user.getNo());
		model.addAttribute("userLikeLectList", userLikeLectList);
		return "like/likelectlist";
	}
}

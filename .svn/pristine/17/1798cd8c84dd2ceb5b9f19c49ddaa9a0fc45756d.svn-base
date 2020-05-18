package kr.co.coduck.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coduck.service.CartTestService;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.vo.Lect;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/buynow")
public class BuyNowController {

	@Autowired
	private CartTestService cartTestService;
	@Autowired
	private LectService lectService;
	@Autowired
	private TestService testService;
	
	@GetMapping("/ordernowtestform.hta")
	public String buynowtest(HttpSession session, Model model, @RequestParam("testno") int testNo) {
		Test test = testService.getTestByNo(testNo);
		
		List<Test> tests = new ArrayList<Test>();
		tests.add(test);
		model.addAttribute("userChoiceTestList", tests);
		System.out.println(test.getNo());
		return "order/ordertestform";
	}
	
	@GetMapping("/ordernowlectform.hta")
	public String buynowlect(HttpSession session, Model model, @RequestParam("lectno") int lectNo) {
		Lect lect = lectService.getLectByNo(lectNo);
		List<Lect> lects = new ArrayList<Lect>();
		lects.add(lect);
		model.addAttribute("userChoiceLectList", lects);
		System.out.println(lect.getNo());
		return "order/orderlectform";
	}
}

package kr.co.coduck.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.coduck.service.CartLectService;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.OrderLectService;
import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/order")
public class OrderLectController {

	@Autowired
	private CartLectService cartLectService;
	@Autowired
	private LectService lectService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderLectService orderLectService;
	
	@PostMapping("/orderlects.hta")
	public String orderLect(@RequestParam(value = "choicecouponno", required = false, defaultValue = "0") Integer couponNo, HttpSession session,
							@RequestParam("lectno") int[] lectNos,
							@RequestParam("lecttotalprices") int lectTotalPrice,
							@RequestParam("bankno") String bankNo) {
		//System.out.println(couponNo);
		System.out.println(lectNos.length);
		System.out.println(lectTotalPrice);
		System.out.println(bankNo);
		User user = (User)session.getAttribute("LU");
		if(!user.getBankNumber().equals(bankNo)) {
			return "order/orderlectform";
		}
		if (couponNo == 0) {
			couponNo = null;
		}
		orderLectService.insertOrderLect(user.getNo(), couponNo, lectNos, lectTotalPrice, bankNo);
		
		return "redirect:/home.hta";
	}
	
	

	
}

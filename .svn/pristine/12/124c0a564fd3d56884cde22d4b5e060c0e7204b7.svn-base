package kr.co.coduck.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coduck.service.OrderTestService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/order")
public class OrderTestController {

	@Autowired
	private OrderTestService orderTestService;
	   
	   @PostMapping("/ordertests.hta")
	   public String orderLect(@RequestParam(value = "choicecouponno", required = false, defaultValue = "0") Integer couponNo, HttpSession session,
			   @RequestParam("testno") int[] testNos,
			   @RequestParam("testtotalprices") int testTotalPrice,
			   @RequestParam("bankno") String bankNo) {
		   //System.out.println(couponNo);
		   System.out.println(testNos.length);
		   System.out.println(testTotalPrice);
		   System.out.println(bankNo);
		   User user = (User)session.getAttribute("LU");
		   if(!user.getBankNumber().equals(bankNo)) {
			   return "redirect:/order/ordertestform.hta?error=fail";
		   }
		   if (couponNo == 0) {
			   couponNo = null;
		   }
		   orderTestService.insertOrderTest(user.getNo(), couponNo, testNos, testTotalPrice, bankNo);

		   return "redirect:/home.hta";
	   }
}

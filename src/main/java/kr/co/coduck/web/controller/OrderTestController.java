package kr.co.coduck.web.controller;

import java.util.ArrayList;
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

import com.siot.IamportRestHttpClientJava.IamportClient;

import kr.co.coduck.dao.CouponDao;
import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.dto.OrderTestDetailListDto;
import kr.co.coduck.service.CartTestService;
import kr.co.coduck.service.CouponService;
import kr.co.coduck.service.OrderTestService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.CouponUsedTest;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/order")
public class OrderTestController {

	@Autowired
	private OrderTestService orderTestService;
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private CouponService couponService;
	
	@PostMapping("/insertTempOrderTest.hta")
	@ResponseBody
	public int insertTempOrderTest(HttpSession session) {
		User user = (User)session.getAttribute("LU");
		int orderNo = orderTestService.getOrderNo();
		orderTestService.insertOrderTest(user.getNo(), null, -1, orderNo);
		
		return orderNo;
	}

	@PostMapping("/orderTestForm.hta")
	public String orderLect(HttpSession session) {
		// System.out.println(couponNo);
		User user = (User) session.getAttribute("LU");

		return "order/orderTestForm";
	}
	
	@PostMapping("/orderTests.hta")
	@ResponseBody
	public void orderTests(HttpSession session, @RequestParam("testno") List<Integer> testNos,
			@RequestParam("point") int point, @RequestParam("orderNo") int orderNo) {
		
		System.out.println("");
		System.out.println("");
		System.out.println(testNos);
		System.out.println(point);
		User user = (User)session.getAttribute("LU");	
		//결제될 금액과 아임포터 서버의 결제금액 비교
		
		
		orderTestService.insertOrderTest(user.getNo(), testNos, point, orderNo);
	}
	
	
	@PostMapping("/temp.hta")
	@ResponseBody
	public Object temp() throws Exception {
		IamportClient iamportClient 
		= new IamportClient("0478914633649164", "e6TnRo0WPMLOUepiA1IAen0e1e9UuDzJJs6BR7yGTjuOxU68WOIacIpeXy8rcHbVahx1p5Iiod7W8d44");
		
		return iamportClient.paymentByImpUid("imp_063594854972");
	}
	
//	@PostMapping("/orderTests.hta")
//	public String orderLect(
//			@RequestParam(value = "choicecouponno", required = false, defaultValue = "0") Integer couponNo,
//			HttpSession session, @RequestParam("testno") int[] testNos,
//			@RequestParam("testtotalprices") int testTotalPrice, @RequestParam("bankno") String bankNo) {
//		// System.out.println(couponNo);
//		System.out.println(testNos.length);
//		System.out.println(testTotalPrice);
//		System.out.println(bankNo);
//		User user = (User) session.getAttribute("LU");
//		if (!user.getBankNumber().equals(bankNo)) {
//			return "redirect:/order/ordertestform.hta?error=fail";
//		}
//		if (couponNo == 0) {
//			couponNo = null;
//		}
//		orderTestService.insertOrderTest(user.getNo(), couponNo, testNos, testTotalPrice, bankNo);
//		
//		return "redirect:/order/userorderlectlist.hta";
//	}
	

	@PostMapping("/userorderlectlist.hta")
	public String userOrderTestList(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LU");
		List<OrderTestDetailListDto> userOrderTestLists = orderTestService.getOrderTestInfoByOrderNo(user.getNo());
		model.addAttribute("userOrderTestLists", userOrderTestLists);
		System.out
				.println(userOrderTestLists + "=====================================================================");
		return "order/userorderlectlist";
	}
}

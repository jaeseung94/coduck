package kr.co.coduck.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestHttpClientJava.IamportClient;
import com.siot.IamportRestHttpClientJava.request.CancelData;

import kr.co.coduck.dao.CouponDao;
import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.dto.OrderTestDetailDto;
import kr.co.coduck.service.CartTestService;
import kr.co.coduck.service.CouponService;
import kr.co.coduck.service.OrderTestService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.CouponUsedTest;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
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
	
	@GetMapping("/orderComplete.hta")
	public String orderComplete(@RequestParam("orderNo") int orderNo, HttpSession session, Model model) {
		
		List<OrderTestDetailDto> info = orderTestService.getOrderTestInfoByOrderNo(orderNo);
		model.addAttribute("ordInfo", info);
		return "order/orderComplete";
	}
	
	@PostMapping("/cancelIamport.hta")
	@ResponseBody
	public void cancelOrderIamport(@RequestParam("orderNo") String orderNo) throws Exception {
		orderTestService.cancelIamportPayment(orderNo);
	}
	
	@PostMapping("/insertTempOrderTest.hta")
	@ResponseBody
	public int insertTempOrderTest(HttpSession session) throws Exception {
		int orderNo = orderTestService.getOrderNo();
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
	public ResponseEntity<Map<String, String>> orderTests(HttpSession session, @RequestParam("testno") List<Integer> testNos,
			@RequestParam("point") int point, @RequestParam("orderNo") int orderNo) {
		
		System.out.println("");
		System.out.println("");
		System.out.println(testNos);
		System.out.println(point);
		User user = (User)session.getAttribute("LU");	
		//결제될 금액과 아임포터 서버의 결제금액 비교
		Map<String, String> map = new HashMap<String, String>();
		try {
			orderTestService.insertOrderTest(user.getNo(), testNos, point, orderNo);
		} catch(Exception e) {
			System.out.println("흠");
			map.put("status", "forgery");
			map.put("message", "위조된 결제시도");
			return new ResponseEntity<>(map, HttpStatus.BAD_REQUEST);
			//return "faker";
		}
		map.put("status", "success");
		map.put("message", "일반 결제 성공");
		return new ResponseEntity<>(map, HttpStatus.OK);
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
		List<OrderTestDetailDto> userOrderTestLists = orderTestService.getOrderTestInfoByOrderNo(user.getNo());
		model.addAttribute("userOrderTestLists", userOrderTestLists);
		System.out
				.println(userOrderTestLists + "=====================================================================");
		return "order/userorderlectlist";
	}
}

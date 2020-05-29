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
import com.siot.IamportRestHttpClientJava.response.IamportResponse;
import com.siot.IamportRestHttpClientJava.response.Payment;

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
import kr.co.coduck.vo.Pagination;
import kr.co.coduck.vo.PointHistory;
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
	
	@GetMapping("/myTestOrderListByPeriod.hta")
	@ResponseBody
	public Map<String, Object> myOrderList(HttpSession session, Model model,
			@RequestParam("prev")int prev, @RequestParam("next") int next, @RequestParam("pageNo")int pageNo){
		
		
		User user = (User)session.getAttribute("LU");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("periodPrev", prev);
		map.put("periodNext", next);
		map.put("userNo", user.getNo());
		List<OrderTestDetailDto> dto = orderTestService.getOrderTestByUserNo(map);
		Pagination pagination = new Pagination(pageNo, dto.size(), 5, 5);
		map.put("pagination", pagination);
		dto = orderTestService.getOrderTestByUserNo(map);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("dto", dto);
		result.put("pagination", pagination);
		return result;
	}
	
	@GetMapping("/orderComplete.hta")
	public String orderComplete(@RequestParam("orderNo") int orderNo, HttpSession session, Model model) throws Exception {
		User user = (User)session.getAttribute("LU");
		
		List<OrderTestDetailDto> infos = orderTestService.getOrderTestInfoByOrderNo(orderNo);
		
		IamportResponse<Payment> payment = orderTestService.getIamportPayment(orderNo);
		System.out.println("####################################");
		System.out.println("####################################");
		System.out.println("payment : " + payment.getResponse());
		PointHistory history = new PointHistory();
		history.setOrdTestNo(orderNo);
		history = orderTestService.getPointHistoryByOrdNo(history);
		OrdTest ordTest = orderTestService.getOrderTestByOrderNo(orderNo);
		model.addAttribute("ordInfos", infos);
		model.addAttribute("payment", payment.getResponse());
		model.addAttribute("user", user);
		model.addAttribute("ordTest", ordTest);
		model.addAttribute("point", history);
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

	@GetMapping("/myOrderTestList.hta")
	public String userOrderTestList(HttpSession session, Model model) {
		User user = (User) session.getAttribute("LU");
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userNo", user.getNo());
		map.put("period", 7);
		map.put("periodPrev", null);
		map.put("periodNext", null);
		List<OrderTestDetailDto> userOrderTestLists = orderTestService.getOrderTestByUserNo(map);
		model.addAttribute("userOrderTestLists", userOrderTestLists);
		System.out
				.println(userOrderTestLists + "=====================================================================");
		return "order/myTestOrderList";
	}
}

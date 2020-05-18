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

import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.service.CartTestService;
import kr.co.coduck.service.CouponService;
import kr.co.coduck.service.OrderTestService;
import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.TestCart;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/cart")
public class CartTestController {
	
	@Autowired
	private CartTestService cartTestService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderTestService orderTestService;
	
	@Autowired
	private CouponService couponService;
	
	@GetMapping("/orderAllTests.hta")
	public String orderAllTest(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<CartTestDto> tests = cartTestService.getCartTestListUserByNo(user.getNo());
		List<Coupon> coupons = couponService.getCouponsByUserNo(user.getNo());
		model.addAttribute("tests", tests);
		model.addAttribute("coupons", coupons);
		return "order/orderTestForm";
	}
	
	@PostMapping("/orderCkTests.hta")
	public String cartordertestlist(HttpSession session, Model model, @RequestParam("testnos") List<Integer> testNos) {   
		User user = (User)session.getAttribute("LU");
		int testNo = 0;
		List<CartChoiceTestListDto> results = new ArrayList<CartChoiceTestListDto>();
		Map<String, Object> userChoiceTestList = new HashMap<String, Object>();
		for(Integer e : testNos) {
			testNo = e;
			userChoiceTestList.put("userNo", user.getNo());
			userChoiceTestList.put("testNo", testNo);
			CartChoiceTestListDto userChoiceTest = cartTestService.getCartChoiceTestListByCartChoiceTestNo(userChoiceTestList);
			results.add(userChoiceTest); 
		}
		model.addAttribute("tests", results);
		return "order/orderTestForm";
	}
	
	@GetMapping("/addOneTestInCart.hta")
	@ResponseBody
	public String addOneTestInCart(HttpSession session, @RequestParam("testNo") int testNo) {
		User user = (User)session.getAttribute("LU");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("testNo", testNo);
		map.put("userNo", user.getNo());
		TestCart findTestCart = cartTestService.getCartTestByTestNoNUserNo(map);
		if(findTestCart != null) {
			return "fail";
		}
		TestCart testCart =  new TestCart();
		testCart.setTestNo(testNo);
		testCart.setUserNo(user.getNo());
		cartTestService.insertOneCartTest(testCart);
		return "success";
	}
	
	//시험 장바구니 조회
	@GetMapping("/myTestCartList.hta")
	public String usercartlectlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<CartTestDto> userCartTestLists = cartTestService.getCartTestListUserByNo(user.getNo());
		model.addAttribute("userCartTestLists", userCartTestLists);
		model.addAttribute("cnt", cartTestService.getTestCartCntByUserNo(user.getNo()));
		return "cart/testCart";
	}
	
	//여러개 장바구니 담기
	@GetMapping("/addTestsInCart.hta")
	@ResponseBody
	public Map<String, Object> addTestsInCart(HttpSession session ,@RequestParam("testNo") List<Integer> testNos) {
		System.out.println("========================");
		System.out.println("testNo? " + testNos);
		User user = (User)session.getAttribute("LU");
		
		return cartTestService.insertCartTest(testNos, user.getNo());
	}
	
	@GetMapping("/delTestInCart.hta")
	public String deleteTestInCart(@RequestParam("testno") int testNo) {
		cartTestService.deleteCartTest(testNo);
		return "redirect:/cart/myTestCartList.hta"; 
	}
	
	@PostMapping("/delCkTestsInCart.hta")
	public String deleteCkTestsInCart(@RequestParam("testnos") List<Integer> testNos) {
		for(Integer e : testNos) {
			cartTestService.deleteCartTest(e);
		}
		return "redirect:/cart/myTestCartList.hta";
	}

}

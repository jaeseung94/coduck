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

import kr.co.coduck.dto.CartChoiceLectListDto;
import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.dto.OrderTestDetailListDto;
import kr.co.coduck.service.CartTestService;
import kr.co.coduck.service.OrderTestService;
import kr.co.coduck.service.UserService;
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
	
	@PostMapping("/userCartLectList.hta")
	public String usercartlectlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<CartTestDto> userCartTestLists = cartTestService.getCartTestListUserByNo(user.getNo());
		model.addAttribute("userCartTestLists", userCartTestLists);
		return "cart/userCartList";
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
	
	@PostMapping("/ordertestform.hta")
	public String cartordertestlist(HttpSession session, Model model, @RequestParam("testnos") int[] cartTestNos) {   
		User user = (User)session.getAttribute("LU");
		int testNo = 0;
		List<CartChoiceTestListDto> results = new ArrayList<CartChoiceTestListDto>();
		Map<String, Object> userChoiceTestList = new HashMap<String, Object>();
		for(int i = 0; i<cartTestNos.length; i++) {
			testNo = cartTestNos[i];
			userChoiceTestList.put("userNo", user.getNo());
			userChoiceTestList.put("testNo", testNo);
			//System.out.println("===============");
			//System.out.println("testNo : " + testNo);
			CartChoiceTestListDto userChoiceTest = cartTestService.getCartChoiceTestListByCartChoiceTestNo(userChoiceTestList);
			//System.out.println("userChoiceTest : " + userChoiceTest);
			results.add(userChoiceTest); 
		}
		
		//System.out.println("=============");
		//System.out.println("results : " + results);
		model.addAttribute("userChoiceTestList", results);
		return "order/ordertestform";
	}
	
	@GetMapping("/carttestdel.hta") public String
	userCartTestDel(@RequestParam("testno") int testNo) {
		cartTestService.deleteCartTest(testNo);
		return "redirect:/cart/userCartList.hta"; 
	}

}

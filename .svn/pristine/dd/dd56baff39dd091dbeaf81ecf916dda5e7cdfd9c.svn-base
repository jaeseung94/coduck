package kr.co.coduck.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.service.CartTestService;
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
	
	@PostMapping("/userCartList.hta")
	public String usercartlectlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<CartTestDto> userCartTestLists = cartTestService.getCartTestListUserByNo(user.getNo());
		model.addAttribute("userCartTestLists", userCartTestLists);
		return "cart/userCartList";
	}
	
	@GetMapping("/addTestsInCart.hta")
	@ResponseBody
	public String addTestsInCart(HttpSession session ,@RequestParam("testNo") List<Integer> testNos) {
		
		try {
			for(int i=0; i<testNos.size(); i++) {
				TestCart testCart = new TestCart();
				testCart.setTestNo(testNos.get(i));
				testCart.setUserNo(10000);
				//cartTestService.insertCartTest(testCart);
			}
			return "success";
		} catch (Exception e) {
			return "fail";
		}
		
	}
	
}

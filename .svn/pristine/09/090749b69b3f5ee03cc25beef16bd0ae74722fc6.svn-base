package kr.co.coduck.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coduck.dto.CartChoiceLectListDto;
import kr.co.coduck.dto.CartLectDto;
import kr.co.coduck.service.CartLectService;
import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/cart")
public class CartLectController {
	
	@Autowired
	private CartLectService cartLectService;
	@Autowired
	private UserService userService;
	
	@GetMapping("/userCartList.hta")
	public String usercartlectlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<CartLectDto> userCartLectLists = cartLectService.getCartLectListByUserNo(user.getNo());
		model.addAttribute("userCartLectLists", userCartLectLists);
		return "cart/userCartList";
		
	}
	
	@PostMapping("/orderlectform.hta")
	public String cartorderlectlist(HttpSession session, Model model, @RequestParam("lectprice") int[] cartLectNos, @RequestParam("order-lect-total-price") int totalprice) {	
		int cartLectNo = 0;
		List<CartChoiceLectListDto> userChoiceLectList = new ArrayList<CartChoiceLectListDto>();
		for(int i = 0; i<cartLectNos.length; i++) {
			cartLectNo = cartLectNos[i];
			CartChoiceLectListDto userChoiceLect = cartLectService.getCartChoiceLectListByCartChoiceLectNo(cartLectNo);
			userChoiceLectList.add(userChoiceLect);
			System.out.println(userChoiceLectList.get(i).getCartChoiceLectNo());
		}
		model.addAttribute("userChoiceLectList", userChoiceLectList);
		return "order/orderlectform";
	}
}

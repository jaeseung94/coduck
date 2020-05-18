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
import kr.co.coduck.dto.CartLectDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.service.CartLectService;
import kr.co.coduck.service.CartTestService;
import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.LectCart;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/cart")
public class CartLectController {
   
   @Autowired
   private CartLectService cartLectService;
   @Autowired
	private CartTestService cartTestService;
   @Autowired
   private UserService userService;
   
   @GetMapping("/userCartList.hta")
   public String usercartlectlist(HttpSession session, Model model) {
      User user = (User)session.getAttribute("LU");
      List<CartLectDto> userCartLectLists = cartLectService.getCartLectListByUserNo(user.getNo());
      List<CartTestDto> userCartTestLists = cartTestService.getCartTestListUserByNo(user.getNo());
	  model.addAttribute("userCartTestLists", userCartTestLists);
      model.addAttribute("userCartLectLists", userCartLectLists);
      return "cart/cartList";
      
   }
   
   @PostMapping("/orderlectform.hta")
   public String cartorderlectlist(HttpSession session, Model model, @RequestParam("lectnos") int[] cartLectNos, @RequestParam("order-lect-total-price") int totalprice) {   
	   User user = (User)session.getAttribute("LU");
	   int lectNo = 0;
      List<CartChoiceLectListDto> results = new ArrayList<CartChoiceLectListDto>();
	   Map<String, Object> userChoiceLectList = new HashMap<String, Object>();
      for(int i = 0; i<cartLectNos.length; i++) {
    	  lectNo = cartLectNos[i];
    	  userChoiceLectList.put("userNo",user.getNo());
    	  userChoiceLectList.put("lectNo",lectNo);
         CartChoiceLectListDto userChoiceLect = cartLectService.getCartChoiceLecttByCartChoiceLectNo(userChoiceLectList);
         results.add(userChoiceLect);
         //System.out.println(userChoiceLectList.get(i).getCartChoiceLectNo());
      }
      User userPoint = userService.getUserProfil(user.getNo());
      //System.out.println(userPoint.getPoint());
      //System.out.println(userPoint.getName());
      model.addAttribute("userPoint", userPoint);
      model.addAttribute("userChoiceLectList", results);
      return "order/orderlectform";
   }
   
	
	@GetMapping("/cartlectdel.hta")
	public String userCartLectDel(@RequestParam("lectno") int lectNo) {
		cartLectService.deleteCartLect(lectNo); 
		return "redirect:/cart/userCartList.hta"; 
	}
	
	
	/*
	 * @GetMapping("/cartlectdel.hta")
	 * 
	 * @ResponseBody public String userCartLectDel(@RequestParam("lectno") int
	 * lectNo) { cartLectService.deleteCartLect(lectNo); return "success"; }
	 */
	
	@GetMapping("/addlectcart.hta")
	public String addlectcart(HttpSession session, Model model, @RequestParam("lectNo") int lectNo) {
		User user = (User)session.getAttribute("LU");
		List<CartLectDto> userCartLectLists = cartLectService.getCartLectListByUserNo(user.getNo());
		for(CartLectDto cartLectDto : userCartLectLists) {
			if(cartLectDto.getLectNo() == lectNo) {
				return "redirect:/lecture/main.hta";
			}
		}
		LectCart lectCart = new LectCart();
		lectCart.setLectNo(lectNo);
		lectCart.setUserNo(user.getNo());
		cartLectService.insertLectCart(lectCart);
		return "redirect:/cart/userCartList.hta";
	}
	   
}
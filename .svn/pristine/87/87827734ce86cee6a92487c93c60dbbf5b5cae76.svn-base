package kr.co.coduck.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/admin")
public class CustomerController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/couponuserlist.hta")
	// Json 응답을 줄 때 필요한 어노테이션 @ResponseBody
	@ResponseBody
	public List<User> selectAllUsersByAdmin(Model model) {
		List<User> users = userService.selectAllUsersByAdmin();
		
		return users;
	} 
	
	@GetMapping("/customer.hta")
	public String coupon(Model model) throws Exception {
		List<User> users = userService.selectAllUsersByAdmin();
		model.addAttribute("users", users);
		model.addAttribute("size", users.size());
		
		return "admin/customer";
	}
	
	@GetMapping("/deletecustomer.hta")
	public String deletecustomer(@RequestParam("userno") int userNo) throws Exception {
		userService.updateUserByAdmin(userNo);
		
		return "redirect:/admin/customer.hta";
	}
	
}

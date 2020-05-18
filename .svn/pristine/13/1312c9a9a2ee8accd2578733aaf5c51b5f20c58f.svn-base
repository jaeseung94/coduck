package kr.co.coduck.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/admin")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/login.hta")
	public String userLogin(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		
		User user = userService.adminLogin(id, pwd);	
		if (user == null) {
			return "redirect:/admin/login.hta?error=fail";
		}
		
		session.setAttribute("LU", user);
		return "redirect:/admin/home.hta";
	}
	
	@RequestMapping("/logout.hta")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/admin/login.hta";
	}
	
}
package kr.co.coduck.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.coduck.dto.UserCouponBoxDto;
import kr.co.coduck.dto.UserCriteria;
import kr.co.coduck.service.CouponService;
import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.Pagination;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/admin")
public class CustomerController {

	@Autowired
	private UserService userService;
	@Autowired
	private CouponService couponService;
	
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
	
	@GetMapping("/customerdetail.hta")
	// Json 응답을 줄 때 필요한 어노테이션 @ResponseBody
	@ResponseBody
	public User customerdetail(@RequestParam("userno") int userNo) throws Exception {
		User userDetail =  userService.getUserByUserNo(userNo);
		
		return userDetail;
	}
	
	@GetMapping("/coupons.hta")
	@ResponseBody
	public List<Coupon> coupons() throws Exception {
		return couponService.getEnabledCouponsByAdmin();	
	}
	
	@PostMapping("/addcoupontouser.hta")
	@ResponseBody
	public void addCouponToUser(@RequestParam("userno") int userNo, @RequestParam("couponno") int couponNo) throws Exception {
		couponService.insertCoupon(couponNo, userNo);
	}
	
	@GetMapping("/usercouponbox.hta")
	@ResponseBody
	public List<UserCouponBoxDto> usercouponbox(@RequestParam("userno") int userNo) throws Exception {
		return couponService.getUserCouponboxByAdmin(userNo);
	}
	
	@PostMapping("/deletecoupontouser.hta")
	@ResponseBody
	public void deleteCouponToUser(@RequestParam("couponno") int couponNo, @RequestParam("userno") int userNo) throws Exception {
		couponService.deleteCouponByAdmin(couponNo, userNo);
	}
		
	@GetMapping("/search.hta")
	public String search(UserCriteria criteria, @RequestParam(value="pageno", required = false, defaultValue = "1") int pageNo, Model model) {
		
		int totalCnt = userService.getUserCntByCriteria(criteria);
		Pagination pagination = new Pagination(pageNo, totalCnt, 5, 5);
		
		criteria.setBeginIndex(pagination.getBeginIndex());
		criteria.setEndIndex(pagination.getEndIndex());
		List<User> userCriteria = userService.getUserByCriteria(criteria);
		model.addAttribute("criteria", userCriteria );
		model.addAttribute("pagination", pagination);
		
		return "admin/customer";
	}
}

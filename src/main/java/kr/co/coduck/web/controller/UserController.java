package kr.co.coduck.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.coduck.dto.LessonDto;
import kr.co.coduck.dto.OrderTestDetailDto;
import kr.co.coduck.dto.SearchTestDetailDto;
import kr.co.coduck.dto.SearchTestDto;
import kr.co.coduck.form.UserRegisterForm;
import kr.co.coduck.service.CouponService;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.OrderTestService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.service.UserService;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private LectService lectService;
	@Autowired
	private CouponService couponService;
	@Autowired 
	private TestService testService;
	
	private final String photoSaveDirectory = "C:\\projects\\spring_workspace\\coduck\\src\\main\\webapp\\resources\\images\\userImageFilename";
	
	@GetMapping("/profile-check.hta")
	public String checkPassword(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		
		model.addAttribute("id", user.getId());
		return "user/check-myprofile";
	}
	
	@PostMapping("/profile-check.hta")
	public String checkPassword(HttpSession session, String pwd) {
		User user = (User)session.getAttribute("LU");
		User findUser = userService.login(user.getId(), pwd);
	
		if(findUser == null) {
			return "redirect:/user/profile-check.hta?error=fail";
		}
		return "redirect:/user/userprofil.hta";
	}
	
	@GetMapping("/userprofil.hta")
	public String userprofil(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		User userProfil = userService.getUserProfil(user.getNo());
		model.addAttribute("userProfil", userProfil);
		
		return "user/userprofil";
	}
	
	@GetMapping("/userlecting.hta")
	public String userlecting(HttpSession session, Model model, @RequestParam(value = "sort", required = false, defaultValue = "1") int sort) {
		User user = (User)session.getAttribute("LU");
		
		List<LessonDto> userLectList = lectService.getLectListUserByNo(user.getNo());
		
		List<LessonDto> userLectProcessivity = lectService.getLectProcessivityByUserNo(user.getNo());
		
		model.addAttribute("userLectProcessivity", userLectProcessivity);
		model.addAttribute("userLectList", userLectList);
		
		System.out.println(userLectList);
		return "user/userlecting";
	}
	
	@GetMapping("/login.hta")
	public String loginform() {
		return "user/loginform";
	}
	
	@RequestMapping("/logout.hta")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home.hta";
	}

	@PostMapping("/login.hta")
	public String login(@RequestParam("id") String userId, @RequestParam("pwd") String userPassword, HttpSession session) {
		User user = userService.login(userId, userPassword);
		
		if(user == null) {
			return "redirect:/user/login.hta?error=fail";
		}else if(user.getRole().equals("A")) {
			return "redirect:/admin/home.hta";
		}
		session.setAttribute("LU", user);
		return "redirect:/home.hta";
	}
	
	@GetMapping("/register.hta")//get방식의 요청은 여기로
	public String registerform() {
		
		return "user/registerform";	//WEB-INF/views/user/registerform.jsp
	}
	
	@PostMapping("/register.hta")
	public String register(UserRegisterForm registerForm) throws Exception {
		System.out.println(registerForm);
		
		User user = new User();
		user.setName(registerForm.getName());
		user.setId(registerForm.getId());
		user.setPassword(registerForm.getPwd());
		user.setEmail(registerForm.getEmail());
		user.setNickname(registerForm.getNickname());
		user.setSelfInfo(registerForm.getSelfInfo());
		user.setBankNumber(registerForm.getBanknumber());
		//user.setEnabled(registerForm.setEnabled("Y"));
		user.setEnabled("Y");
		
		MultipartFile imgfile = registerForm.getImgfile();
		if(!imgfile.isEmpty()) {
			String filename = imgfile.getOriginalFilename();
			
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveDirectory, filename));
			
			user.setImageFilename(filename);
		}
		
		boolean isSuccess = userService.addNewUser(user);
		if(!isSuccess) {
			return "redirect:/user/register.hta?error=fail";
		}
		return "redirect:/home.hta";
	}
	
	@PostMapping("/userupdate.hta")
	public String userupdate(UserRegisterForm registerForm, HttpSession session) throws Exception {
		User user = (User)session.getAttribute("LU");
		User userProfilUpDate = userService.getUserProfil(user.getNo());
		userProfilUpDate.setNickname(registerForm.getNickname());
		userProfilUpDate.setEmail(registerForm.getEmail());
		userProfilUpDate.setSelfInfo(registerForm.getSelfInfo());
		userProfilUpDate.setPassword(registerForm.getPwd());
		userProfilUpDate.setBankNumber(registerForm.getBanknumber());
		
		
		
		MultipartFile imgfile = registerForm.getImgfile();
		if(!imgfile.isEmpty()) {
			String filename = imgfile.getOriginalFilename();
			
			FileCopyUtils.copy(imgfile.getBytes(), new File(photoSaveDirectory, filename));
			
			userProfilUpDate.setImageFilename(filename);
			
		}
		
		userService.userProfilUpdate(userProfilUpDate);
		
		return "redirect:/home.hta";
	}
	
	@GetMapping("/mycouponlist.hta")
	public String mycouponlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<Coupon> couponDetails = couponService.getCouponsByUserNo(user.getNo());
		model.addAttribute("couponDetails", couponDetails);
		return "/user/mycouponlist";
	}
	
	@GetMapping("/mybytestlist.hta")
	public String mybytestlist(HttpSession session, Model model) {
		User user = (User)session.getAttribute("LU");
		List<SearchTestDetailDto> userOrderTestLists = testService.userBySearchTestList(user.getNo());
		List<SearchTestDetailDto> done = new ArrayList<SearchTestDetailDto>();;
		List<SearchTestDetailDto> notYet = new ArrayList<SearchTestDetailDto>();
		for(SearchTestDetailDto e : userOrderTestLists) {
			if(e.getTestDone().equals("Y")){
				done.add(e);
			} else {
				notYet.add(e);
			}
		}
		model.addAttribute("userOrderTestLists", userOrderTestLists);
		model.addAttribute("done", done);
		model.addAttribute("notYet", notYet);
		return "user/mybytestlist";
	}
	
}



package kr.co.coduck.web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coduck.form.CouponAddForm;
import kr.co.coduck.form.CouponUpdateForm;
import kr.co.coduck.service.CouponService;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.CouponUsedTest;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/coupon")
public class CouponController {

   @Autowired
   private CouponService couponService;
//   
//   @GetMapping("/insertUsedCouponInTest.hta")
//   @ResponseBody
//   public String insertUsedCouponInTest(HttpSession session, 
//		   @RequestParam("couponNo") int couponNo, @RequestParam("testNo") int testNo) {
//	   User user = (User)session.getAttribute("LU");
//	   CouponUsedTest couponUsedTest = new CouponUsedTest();
//	   couponUsedTest.setUserNo(user.getNo());
//	   couponUsedTest.setTestNo(testNo);
//	   
//	   CouponUsedTest result = couponService.isUsedCouponInTest(couponUsedTest);
//	   couponUsedTest.setCouponNo(couponNo);
//	   if(result != null) {
//		   if(result.getCouponNo() == couponNo) {
//			   System.out.println("4444444444444444444444444444444444444");
//			   if(result.getTestNo() == testNo) {
//				   System.out.println("333333333333333333333333333333333");
//				   return "none";
//			   }
//			   System.out.println("++++++++++++++++++++++++++++++++");
//			   System.out.println("22222222222222222222222222222222");
//			   couponService.deleteUsedCouponIntest(couponUsedTest);
//			   couponService.insertUsedCouponInTest(couponUsedTest);
//			   return "ok";
//		   }
//		   couponService.updateCouponInTest(couponUsedTest);
//		   return "ok";
//	   }
//	   
//	   couponService.insertUsedCouponInTest(couponUsedTest);
//	   return "ok";
//   }
   
   @GetMapping("/insertUsedCouponInTest.hta")
   @ResponseBody
   public int insertUsedCouponInTest(HttpSession session, 
		   		@RequestParam("couponNo") int couponNo, @RequestParam("testNo") int testNo) {
	   User user = (User)session.getAttribute("LU");
	   CouponUsedTest couponUsedTest = new CouponUsedTest();
	   couponUsedTest.setUserNo(user.getNo());
	   couponUsedTest.setCouponNo(couponNo);
	   System.out.println("11111111111111111111111111111");
	   
	   //쿠폰번호로 쿠폰 사용 여부 확인
	   CouponUsedTest result = couponService.isUsedCouponInTest(couponUsedTest);
	   if(result != null) {
		   int no = result.getTestNo();
		   System.out.println("22222222222222222222222222222222222");
		   couponUsedTest.setTestNo(testNo);
		   couponService.deleteUsedCouponIntestByTestNo(couponUsedTest);
		   //상품번호와 쿠폰번호 업데이트 구분해야함..
		   //couponService.updateTestNoAtAppliedCoupon(couponUsedTest);
		   couponService.updateTestNoAtAppliedCoupon(couponUsedTest);
		   return no;
	   }
	   System.out.println("333333333333333333333333333333");
	   //상품번호로 쿠폰 사용 여부 확인
	   couponUsedTest.setCouponNo(0);
	   couponUsedTest.setTestNo(testNo);
	   CouponUsedTest result2 = couponService.isUsedCouponInTest(couponUsedTest);
	   couponUsedTest.setCouponNo(couponNo);
	   if(result2 != null) {
		   couponService.updateCouponNoAtAppliedCoupon(couponUsedTest);
		   return -1;//?
	   }
	   
	   System.out.println("444444444444444444444444444444");
	   couponService.insertUsedCouponInTest(couponUsedTest);
	   //couponService.deleteUsedCouponIntestByTestNo(couponUsedTest);
	   return -1;
   }
   
   @GetMapping("/getAppliedCouponInTest.hta")
   @ResponseBody
   public CouponUsedTest getAppliedCouponInTest(HttpSession session, @RequestParam("testNo") int testNo) {
	   
	   User user = (User)session.getAttribute("LU");
	   
	   CouponUsedTest couponUsedTest = new CouponUsedTest();
	   couponUsedTest.setUserNo(user.getNo());
	   couponUsedTest.setTestNo(testNo);
	   CouponUsedTest result = couponService.isUsedCouponInTest(couponUsedTest);
	   return result;
   }
		   
   
   @GetMapping("/isUsedInTest.hta")
   @ResponseBody
   public CouponUsedTest isUsedInTest(HttpSession session, @RequestParam("couponNo") int couponNo) {
	   User user = (User)session.getAttribute("LU");
	   
	   CouponUsedTest couponUsedTest = new CouponUsedTest();
	   couponUsedTest.setCouponNo(couponNo);
	   couponUsedTest.setUserNo(user.getNo());
	   
	   return couponService.isUsedCouponInTest(couponUsedTest);
   }
   
   @GetMapping("/coupon.hta")
   public String coupon(Model model) throws Exception {
      List<Coupon> coupons = couponService.getCouponsByAdmin();
      model.addAttribute("coupons", coupons);
      model.addAttribute("size", coupons.size());
      
      return "admin/coupon";
   }
   
   @PostMapping("/addcoupon.hta")
   public String addNewCoupon(CouponAddForm form) throws Exception {
      Coupon coupon = new Coupon();      
      BeanUtils.copyProperties(form, coupon);
      if (form.getAmount() > 0) {
         coupon.setLimited("Y");
      }
      
      couponService.addNewCoupon(coupon);
      
      return "redirect:/coupon/coupon.hta";
   }

   @PostMapping("/updatecoupon.hta")
   public String updateCouponByAdmin(CouponUpdateForm form, @RequestParam("couponno") int couponNo) throws Exception {
      Coupon coupon = couponService.getCouponByCouponNo(couponNo);
      BeanUtils.copyProperties(form, coupon);
      if (form.getAmount() > 0) {
         coupon.setLimited("Y");
      }
      
      couponService.updateCouponByAdmin(coupon);;
      
      return "redirect:/coupon/coupon.hta";
   }
   
   @GetMapping("/couponDetails.hta")
   @ResponseBody
   public List<Coupon> couponDetails(HttpSession session){
      User user = (User)session.getAttribute("LU");
      List<Coupon> couponDetails = couponService.getCouponsByUserNo(user.getNo());
      return couponDetails;
   }
   
   @GetMapping("/couponDetail.hta")
   // Json 응답을 줄 때 필요한 어노테이션 @ResponseBody
   @ResponseBody
   public Coupon getCouponByCouponNo(@RequestParam("couponno") int couponNo) {
      Coupon couponDetail = couponService.getCouponByCouponNo(couponNo);
      
      return couponDetail;
   }
   
   @GetMapping("/deletecoupon.hta")
   public String deleteCoupon(@RequestParam("couponno") int couponNo) {
      couponService.deleteCoupon(couponNo);
      
      return "redirect:/coupon/coupon.hta";
   }
   
   @GetMapping("/deletecheckcoupons.hta")
   public String deleteCheckCoupons(@RequestParam("couponno") int[] couponNos) {
      
      couponService.deleteCoupons(couponNos);
      
      return "redirect:/coupon/coupon.hta";
   }
   
   @PostMapping("/insertCouponByAdmin.hta")
   public String insertCouponByAdmin(@RequestParam("couponno") int couponNo, @RequestParam("userno") int[] userNos) {
      
      couponService.insertCouponByAdmin(couponNo, userNos);
      
      return "redirect:/coupon/coupon.hta";
   }
}
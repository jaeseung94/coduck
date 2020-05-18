package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.UserCouponBoxDto;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.CouponUsedTest;

public interface CouponService {

	//int isUsedCouponInTest(Map<String, Integer> map);
	void deleteUsedCouponIntestByTestNo(CouponUsedTest couponUsedTest);
	void deleteUsedCouponIntestByCouponNo(CouponUsedTest couponUsedTest);
	
	void updateCouponNoAtAppliedCoupon(CouponUsedTest couponUsedTest);
	void updateTestNoAtAppliedCoupon(CouponUsedTest couponUsedTest);
	CouponUsedTest isUsedCouponInTest(CouponUsedTest couponUsedTest);
	
	void insertUsedCouponInTest(CouponUsedTest couponUsedTest);
	
	void deleteCoupon(int couponNo);
	void addNewCoupon(Coupon coupon);
	void updateCouponByAdmin(Coupon coupon);
	Coupon getCouponByCouponNo(int couponNo);
	List<Coupon> getCouponsByAdmin();
	List<Coupon> getEnabledCouponsByAdmin();
	List<Coupon> getCouponsByUserNo(int userNo);
	
	// 체크된 쿠폰들(배열로 담겨있음)을 삭제
	void deleteCoupons(int[] couponNos);
	void insertCouponByAdmin(int couponNo, int[] userNos);	
	void insertCoupon(int couponNo, int userNo);
	
	List<UserCouponBoxDto> getUserCouponboxByAdmin(int userNo);
	void deleteCouponByAdmin(int couponNo, int userNo);
}
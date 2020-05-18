package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.CouponBox;

public interface CouponDao {

	// 쿠폰 발송
	void insertCouponByAdmin(CouponBox couponBox);
	
	// 쿠폰 추가
	void addNewCoupon(Coupon coupon);
	// 쿠폰 수정
	void updateCouponByAdmin(Coupon coupon);
	// 쿠폰 조회 (쿠폰번호)
	Coupon getCouponByCouponNo(int couponNo);
	// 쿠폰 조회 (관리자기준)
	List<Coupon> getCouponsByAdmin();
	// 쿠폰 삭제
	void deleteCoupon(int couponNo);
	
	List<Coupon> getCouponsByUserNo(int userNo);
	
	void deleteCouponBoxByCouponNo(int couponNo);
	
}

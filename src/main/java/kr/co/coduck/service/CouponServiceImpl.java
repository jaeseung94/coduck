package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.CouponDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.UserCouponBoxDto;
import kr.co.coduck.vo.Coupon;
import kr.co.coduck.vo.CouponBox;
import kr.co.coduck.vo.CouponUsedTest;
import kr.co.coduck.vo.User;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private CouponDao couponDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public void updateCouponNoAtAppliedCoupon(CouponUsedTest couponUsedTest) {
		couponDao.updateCouponNoAtAppliedCoupon(couponUsedTest);
		
	}
	
	@Override
	public void updateTestNoAtAppliedCoupon(CouponUsedTest couponUsedTest) {
		couponDao.updateTestNoAtAppliedCoupon(couponUsedTest);
		
	}
	
	@Override
	public void deleteUsedCouponIntestByCouponNo(CouponUsedTest couponUsedTest) {
		couponDao.deleteUsedCouponIntestByCouponNo(couponUsedTest);
		
	}@Override
	public void deleteUsedCouponIntestByTestNo(CouponUsedTest couponUsedTest) {
		couponDao.deleteUsedCouponIntestByTestNo(couponUsedTest);
	}
	
	@Override
	public void insertUsedCouponInTest(CouponUsedTest couponUsedTest) {
		couponDao.insertUsedCouponInTest(couponUsedTest);
	}
	
	@Override
	public CouponUsedTest isUsedCouponInTest(CouponUsedTest couponUsedTest) {
		return couponDao.isUsedCouponInTest(couponUsedTest);
	}
	
	@Override
	public void addNewCoupon(Coupon coupon) {
		couponDao.addNewCoupon(coupon);
	}

	@Override
	public List<Coupon> getCouponsByAdmin() {
		return couponDao.getCouponsByAdmin();
	}
	
	@Override
	public List<Coupon> getCouponsByUserNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<Coupon> userCouponLists = couponDao.getCouponsByUserNo(user.getNo());
		return userCouponLists;
	}

	@Override
	public void updateCouponByAdmin(Coupon coupon) {
		couponDao.updateCouponByAdmin(coupon);
		
	}

	@Override
	public Coupon getCouponByCouponNo(int couponNo) {
		return couponDao.getCouponByCouponNo(couponNo);
	}

	@Override
	public void deleteCoupon(int couponNo) {
		couponDao.deleteCoupon(couponNo);
	}

	@Override
	public void deleteCoupons(int[] couponNos) {
		for (int couponNo : couponNos) {
			couponDao.deleteCoupon(couponNo);
		}
	}

	@Override
	public void insertCouponByAdmin(int couponNo, int[] userNos) {
		for (int userNo : userNos) {
			CouponBox couponBox = new CouponBox();
			couponBox.setCouponNo(couponNo);
			couponBox.setUserNo(userNo);
			
			Coupon coupon = couponDao.getCouponByCouponNo(couponNo);
			
			if (coupon.getAmount() > 0 && coupon.getLimited().equals("Y")) {			
				coupon.setAmount(coupon.getAmount() - 1);			
				if (coupon.getAmount() == 0 && coupon.getLimited().equals("Y")) {
					coupon.setEnabled("N");			
				}
			}
			
			couponDao.updateCouponByAdmin(coupon);
			couponDao.insertCouponByAdmin(couponBox);
		}
	}

	@Override
	public List<Coupon> getEnabledCouponsByAdmin() {
		return couponDao.getEnabledCouponsByAdmin();
	}

	@Override
	public void insertCoupon(int couponNo, int userNo) {
		CouponBox couponBox = new CouponBox();
		couponBox.setCouponNo(couponNo);
		couponBox.setUserNo(userNo);
		
		Coupon coupon = couponDao.getCouponByCouponNo(couponNo);
		
		if (coupon.getAmount() > 0 && coupon.getLimited().equals("Y")) {			
			coupon.setAmount(coupon.getAmount() - 1);			
			if (coupon.getAmount() == 0 && coupon.getLimited().equals("Y")) {
				coupon.setEnabled("N");			
			}
		}
		
		couponDao.updateCouponByAdmin(coupon);
		couponDao.insertCouponByAdmin(couponBox);	
	}

	@Override
	public List<UserCouponBoxDto> getUserCouponboxByAdmin(int userNo) {
		return couponDao.getUserCouponboxByAdmin(userNo);
	}

	@Override
	public void deleteCouponByAdmin(int couponNo, int userNo) {
		CouponBox couponBox = new CouponBox();
		couponBox.setUserNo(userNo);
		couponBox.setCouponNo(couponNo);
		
		couponDao.deleteCouponByAdmin(couponBox);
	}

}
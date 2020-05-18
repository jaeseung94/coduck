package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.CouponDao;
import kr.co.coduck.dao.OrderTestDao;
import kr.co.coduck.dao.TestCartDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.OrderTestDetailListDto;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
import kr.co.coduck.vo.User;

@Service
public class OrderTestServiceImpl implements OrderTestService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private TestCartDao testCartDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private OrderTestDao orderTestDao;
	
	@Override
	public void insertOrderTest(int userNo, Integer couponNo, int[] testNos, int testTotalPrice, String bankNo) {
		OrdTest ordTest = new OrdTest();
		ordTest.setUserNo(userNo);
		ordTest.setTotalPrice(testTotalPrice);
		ordTest.setStatus("결제완료");
		orderTestDao.insertOrderTest(ordTest);
		
		OrdTestInfo ordTestInfo = new OrdTestInfo();
		
		int TestNo = 0;
		for(int i = 0; i<testNos.length; i++) {
			TestNo = testNos[i];
			ordTestInfo.setOrderNo(ordTest.getNo());
			ordTestInfo.setCouponNo(couponNo);
			ordTestInfo.setTestNo(TestNo);
			orderTestDao.insertOrderTestInfo(ordTestInfo);
		}
		
		int cartDeleteTestNo = 0;
		for(int i = 0; i<testNos.length; i++) {
			cartDeleteTestNo = testNos[i];
			
			testCartDao.deleteCartTest(cartDeleteTestNo);
		}
		
		if (couponNo != null) {
	    	  
	    	  couponDao.deleteCouponBoxByCouponNo(couponNo);
	    }
		
		int point = (int)(testTotalPrice * 0.001);
	      
	      User user = userDao.getUserProfilByNo(userNo);
	      user.setPoint(user.getPoint() + point);
	      userDao.updateUser(user);
		
		
	}

	@Override
	public void insertOrderTestInfo(OrdTestInfo ordTestInfo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<OrderTestDetailListDto> getOrderTestInfoByOrderNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<OrderTestDetailListDto> userOrderList = orderTestDao.getOrderTestInfoByOrderNo(user.getNo());
		return userOrderList;
	}

	@Override
	public OrdTest getOrdTestByTestNoNUserNo(Map<String, Integer> map) {
		return orderTestDao.getOrdTestByTestNoNUserNo(map);
	}

}

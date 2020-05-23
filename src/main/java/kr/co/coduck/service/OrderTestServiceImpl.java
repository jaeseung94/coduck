package kr.co.coduck.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestHttpClientJava.IamportClient;

import kr.co.coduck.dao.CouponDao;
import kr.co.coduck.dao.OrderTestDao;
import kr.co.coduck.dao.TestCartDao;
import kr.co.coduck.dao.TestDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.OrderTestDetailListDto;
import kr.co.coduck.vo.CouponUsedTest;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.User;

@Service
@Transactional(rollbackFor = Exception.class)
public class OrderTestServiceImpl implements OrderTestService{

	private final String API_KEY = "0478914633649164";
	private final String API_SECRET = "e6TnRo0WPMLOUepiA1IAen0e1e9UuDzJJs6BR7yGTjuOxU68WOIacIpeXy8rcHbVahx1p5Iiod7W8d44";
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private TestDao testDao;
	@Autowired
	private TestCartDao testCartDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private OrderTestDao orderTestDao;
	
	@Override
	public void deleteOrdTest(int orderNo) {
		orderTestDao.deleteOrdTest(orderNo);
	}
	
	@Override
	public int getOrderNo() {
		return orderTestDao.getOrderNo();
	}

	@Override
	public int insertOrderTestInfo(List<Integer> testNos, int userNo, int orderNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		OrdTestInfo ordTestInfo = new OrdTestInfo();
		ordTestInfo.setOrderNo(orderNo);
		int totalPrice = 0;
		
//		2.리스트가 끝날때까지 반복한다.
		for(Integer e :  testNos) {
//			2.1.상품번호로 상품정보를 조회한다.
			Test test = testDao.getTestByNo(e);
			ordTestInfo.setTestNo(e);
//			2.2 쿠폰적용테이블에서 해당 상품번호를 찾는다.
			map.put("userNo", userNo);
			map.put("testNo", test.getNo());
			CouponUsedTest used = couponDao.getCouponUsedTestByUserNoNTestNo(map);
//			2.3. 있다면
			if(used != null) {
//				2.3.1 쿠폰금액과 상품금액으로 주문금액 계산한다.
				int discountPrice = 0;
				if(used.getDiscountWay().equals("percent")){
					discountPrice = (int)(test.getPrice() * ((100-used.getDiscountPrice()) * 0.01));
				} else {
					discountPrice = test.getPrice() - used.getDiscountPrice();
				}
				if(discountPrice <= 0) {
					discountPrice = 0;
				}
//				2.3.2 주문상세테이블에 저장한다.
				ordTestInfo.setCouponNo(used.getCouponNo());
				orderTestDao.insertOrderTestInfo(ordTestInfo);
//				2.3.3 쿠폰적용테이블에서 삭제한다.		
				couponDao.deleteUsedCouponIntestByCouponNo(used);
				//쿠폰박스에서 사용한 쿠폰 삭제하기
				map.put("couponNo", used.getCouponNo());
				couponDao.deleteCouponAtCounponBox(map);
//				2.3.4 총주문금액에 더한다.
				totalPrice += discountPrice;
			} else {//2.4 없다면
//				2.4.1 주문상세테이블에 저장한다.
				ordTestInfo.setCouponNo(null);
//				2.4.2 상품금액을 총주문금액에 더한다.	
				totalPrice += test.getPrice();
			}
//			2.5 상품번호를 장바구니에서 삭제한다.
			testCartDao.deleteCartTest(e);
		}
		return totalPrice;
	}
	
	@Override
	public int insertOrderTest(int userNo, List<Integer> testNos, int point, int orderNo) {
		OrdTest ordTest = new OrdTest();
		//아임포트 모듈 쓰기 전에 임시로 주문정보 저장
		if(testNos == null && point == -1) {
			orderTestDao.insertOrderTest(ordTest);
			ordTest.setTotalPrice(point);
			ordTest.setUserNo(userNo);
			ordTest.setNo(orderNo);
			return -1;
		}
		
		this.deleteOrdTest(orderNo);
		
		IamportClient iamportClient = new IamportClient(API_KEY, API_SECRET );
		int totalPrice = insertOrderTestInfo(testNos, userNo, orderNo);
//		3. 포인트를 총주문금액에서 뺀다.
		totalPrice -= point;
//		4. 주문정보테이블에 저장한다.
		ordTest.setNo(orderNo);
		ordTest.setUserNo(userNo);
		ordTest.setTotalPrice(totalPrice);
		orderTestDao.insertOrderTest(ordTest);
		
		return orderNo;
	}
	
//	public void insertOrderTest(int userNo, Integer couponNo, int[] testNos, int testTotalPrice, String bankNo) {
//		OrdTest ordTest = new OrdTest();
//		ordTest.setUserNo(userNo);
//		ordTest.setTotalPrice(testTotalPrice);
//		ordTest.setStatus("결제완료");
//		orderTestDao.insertOrderTest(ordTest);
//		
//		OrdTestInfo ordTestInfo = new OrdTestInfo();	
//		
//		int TestNo = 0;
//		for(int i = 0; i<testNos.length; i++) {
//			TestNo = testNos[i];
//			ordTestInfo.setOrderNo(ordTest.getNo());
//			ordTestInfo.setCouponNo(couponNo);
//			ordTestInfo.setTestNo(TestNo);
//			orderTestDao.insertOrderTestInfo(ordTestInfo);
//		}
//		
//		int cartDeleteTestNo = 0;
//		for(int i = 0; i<testNos.length; i++) {
//			cartDeleteTestNo = testNos[i];
//			
//			testCartDao.deleteCartTest(cartDeleteTestNo);
//		}
//		
//		if (couponNo != null) {
//	    	  
//	    	  couponDao.deleteCouponBoxByCouponNo(couponNo);
//	    }
//		
//		int point = (int)(testTotalPrice * 0.001);
//	      
//	      User user = userDao.getUserProfilByNo(userNo);
//	      user.setPoint(user.getPoint() + point);
//	      userDao.updateUser(user);
//		
//		
//	}

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

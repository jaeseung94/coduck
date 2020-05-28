package kr.co.coduck.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.siot.IamportRestHttpClientJava.IamportClient;
import com.siot.IamportRestHttpClientJava.request.CancelData;
import com.siot.IamportRestHttpClientJava.response.IamportResponse;
import com.siot.IamportRestHttpClientJava.response.Payment;

import kr.co.coduck.dao.CouponDao;
import kr.co.coduck.dao.OrderTestDao;
import kr.co.coduck.dao.TestCartDao;
import kr.co.coduck.dao.TestDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.OrderTestDetailDto;
import kr.co.coduck.vo.CouponUsedTest;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
import kr.co.coduck.vo.PointHistory;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.User;

@Service
public class OrderTestServiceImpl implements OrderTestService{

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
	
	private IamportClient iamportClient;
	
	public OrderTestServiceImpl() {
		iamportClient  = new IamportClient("0478914633649164", "e6TnRo0WPMLOUepiA1IAen0e1e9UuDzJJs6BR7yGTjuOxU68WOIacIpeXy8rcHbVahx1p5Iiod7W8d44");
	}
	
	@Override
	public List<OrderTestDetailDto> getOrderTestByUserNo(Map<String, Object> map) {
		return orderTestDao.getOrderTestByUserNo(map);
	}
	
	@Override
	public IamportResponse<Payment> getIamportPayment(int orderNo) throws Exception {
		
		return iamportClient.paymentByMerchantUid(String.valueOf(orderNo));
	}
	
	@Override
	public PointHistory getPointHistoryByOrdNo(PointHistory history) {
		return orderTestDao.getPointHistoryByOrdNo(history);
	}
	
	@Override
	public void insertPointHistory(PointHistory pointHistory) {
		orderTestDao.insertPointHistory(pointHistory);
	}
	
	@Override
	public void cancelIamportPayment(String orderNo) throws Exception {
		CancelData cancelData = new CancelData(orderNo, false);
		iamportClient.cancelPayment(cancelData);
	}
	
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
				orderTestDao.insertOrderTestInfo(ordTestInfo);
//				2.4.2 상품금액을 총주문금액에 더한다.	
				totalPrice += test.getPrice();
			}
//			2.5 상품번호를 장바구니에서 삭제한다.
			testCartDao.deleteCartTest(e);
		}
		return totalPrice;
	}
	
	@Override
	public int insertOrderTest(int userNo, List<Integer> testNos, int point, int orderNo) throws Exception {
		OrdTest ordTest = new OrdTest();
		User user = userDao.getUserByUserNo(userNo);
		PointHistory history = new PointHistory();
		history.setOrdLectNo(null);
		history.setOrdTestNo(orderNo);
		history.setUserNo(userNo);
		System.out.println("포포포포포포포포ㅗ포포ㅗ포포포포포ㅗㅍ");
		System.out.println(point);
		
		int totalPrice = insertOrderTestInfo(testNos, userNo, orderNo);
		if(point > 0) {
			//유저에서 포인트 뺴기
			user.setPoint(user.getPoint()-point);
			
			history.setContents("상품 구매시 포인트 사용");
			history.setPoint(point);
			history.setRole("M");
			
		} else if(point == 0) {
			//포인트를 사용안했을 경우
			//구매 금액의 5% 적립
			int addPoint = user.getPoint() + (int)(totalPrice * 0.05);
			history.setContents("상품 구매로 포인트 적립");
			history.setPoint((int)(totalPrice * 0.05));
			history.setRole("P");
			user.setPoint(addPoint);
		}
		this.insertPointHistory(history);
		userDao.updateUser(user);
//		3. 포인트를 총주문금액에서 뺀다.
		totalPrice -= point;
//		4. 주문정보테이블에 저장한다.
		IamportResponse<Payment> response = iamportClient.paymentByMerchantUid(Integer.toString(orderNo));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(response.getResponse().getAmount().intValue());
		if(response.getResponse().getAmount().intValue() != totalPrice) {
			System.out.println("결제 불일치");
			throw new RuntimeException();
		}
		System.out.println("결제 일치");
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
	public List<OrderTestDetailDto> getOrderTestInfoByOrderNo(int orderNo) {
		List<OrderTestDetailDto> userOrderList = orderTestDao.getOrderTestInfoByOrderNo(orderNo);
		return userOrderList;
	}
	
	@Override
	public OrdTest getOrderTestByOrderNo(int orderNo) {
		return orderTestDao.getOrderTestByOrderNo(orderNo);
	}

}

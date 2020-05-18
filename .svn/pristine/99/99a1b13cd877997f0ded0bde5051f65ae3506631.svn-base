package kr.co.coduck.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import kr.co.coduck.dao.TestCartDao;
import kr.co.coduck.dao.TestDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestCart;
import kr.co.coduck.vo.User;

@Service
public class CartTestServiceImpl implements CartTestService{

	@Autowired
	private TestCartDao testCartDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private TestDao testDao;
	
	@Autowired
	private PlatformTransactionManager txManager;
	
	@Override
	public List<CartTestDto> getCartTestListUserByNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<CartTestDto> userCartTestLists = testCartDao.getCartTestListUserByNo(user.getNo());
		return userCartTestLists;
	}

	@Override
	public CartChoiceTestListDto getCartChoiceTestListByCartChoiceTestNo(Map<String, Object> criteria) {
		return testCartDao.getCartChoiceTestListByCartChoiceTestNo(criteria);
	}

	@Override
	public void deleteCartTest(int testNo) {
		testCartDao.deleteCartTest(testNo);
	}

	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public Map<String, Object> insertCartTest(List<Integer> testNos, int userNo) {
		
		DefaultTransactionDefinition txDefinition = new DefaultTransactionDefinition();
		TransactionStatus status = txManager.getTransaction(txDefinition);
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<String> items = new ArrayList<String>();
		
		boolean isExist = false;
		
		for(int i=0; i<testNos.size(); i++) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("testNo", testNos.get(i));
			map.put("userNo", userNo);
			TestCart findTestCart = getCartTestByTestNoNUserNo(map);
			System.out.println("findTestCart : " + findTestCart);
			if(findTestCart != null) {
				isExist = true;
				Test test = testDao.getTestByNo(testNos.get(i));
				items.add(test.getName() + "-" + test.getEp());
			}
			
			TestCart testCart = new TestCart();
			testCart.setTestNo(testNos.get(i));
			testCart.setUserNo(userNo);
			testCartDao.insertCartTest(testCart);
		}
		
		if (isExist) {
			txManager.rollback(status);
			result.put("status", "fail");
			result.put("items", items);
			return result;
		}
		
		txManager.commit(status);
		result.put("status", "success");
		
		return result;
	}

	@Override
	public TestCart getCartTestByTestNoNUserNo(Map<String, Integer> map) {
		return testCartDao.getCartTestByTestNoNUserNo(map);
	}

	@Override
	public void insertOneCartTest(TestCart testCart) {
		testCartDao.insertCartTest(testCart);
	}
	
	
}

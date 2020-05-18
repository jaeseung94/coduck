package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.TestCartDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.vo.User;

@Service
public class CartTestServiceImpl implements CartTestService{

	@Autowired
	private TestCartDao testCartDao;
	
	@Autowired
	private UserDao userDao;
	
	@Override
	public List<CartTestDto> getCartTestListUserByNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<CartTestDto> userCartTestLists = testCartDao.getCartTestListUserByNo(user.getNo());
		return userCartTestLists;
	}

	
}

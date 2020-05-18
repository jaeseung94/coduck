package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.LectCartDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.CartChoiceLectListDto;
import kr.co.coduck.dto.CartLectDto;
import kr.co.coduck.vo.User;

@Service
public class CartLectServiceImpl implements CartLectService{

	@Autowired
	private LectCartDao lectCartDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public List<CartLectDto> getCartLectListByUserNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<CartLectDto> userCartLectLists = lectCartDao.getCartLectListByUserNo(user.getNo());
		return userCartLectLists;
	}

	@Override
	public void deleteCartLect(int lectNo) {
		lectCartDao.deleteCartLect(lectNo);
		
	}

	@Override
	public CartChoiceLectListDto getCartChoiceLecttByCartChoiceLectNo(Map<String, Object> criteria) {
		
		return lectCartDao.getCartChoiceLecttByCartChoiceLectNo(criteria);
	}
	
	
}

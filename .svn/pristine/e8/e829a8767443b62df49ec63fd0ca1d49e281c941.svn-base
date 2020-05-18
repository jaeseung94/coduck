package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dao.UserQuestionDao;
import kr.co.coduck.dto.UserQuestionDto;
import kr.co.coduck.vo.User;
@Service
public class UserQuestionServiceImpl implements UserQuestionService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	
	@Override
	public List<UserQuestionDto> getUserQuestionListByUserNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<UserQuestionDto> userQuestionList = userQuestionDao.getUserQuestionListByUserNo(user.getNo());
		return userQuestionList;
	}

	@Override
	public List<UserQuestionDto> searchQuestion(Map<String, Object> criteria) {
		return userQuestionDao.searchQuestion(criteria);
	}

}

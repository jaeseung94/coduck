package kr.co.coduck.service;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.UserCriteria;
import kr.co.coduck.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public boolean addNewUser(User user) {
		User prevUser = userDao.getUserById(user.getId());
		if(prevUser != null) {
			return false;
		}
		String shaPassword = DigestUtils.sha1Hex(user.getPassword());
		user.setPassword(shaPassword);
		userDao.insertUser(user);
		
		return true;
	}

	@Override
	public User login(String userId, String userPassword) {
		User user = userDao.getUserById(userId);
		if(user == null) {
			return null;
		}
		String shaPassword = DigestUtils.sha1Hex(userPassword);
		if(!user.getPassword().equals(shaPassword)) {
			return null;
		}
		return user;
	}

	@Override
	public User getUserProfil(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		return user;
	}

	@Override
	public void userProfilUpdate(User user) {
		userDao.getUserById(user.getId());
		String shaPassword = DigestUtils.sha1Hex(user.getPassword());
		user.setPassword(shaPassword);
		userDao.updateUser(user);
		
	}

	@Override
	public List<User> selectAllUsersByAdmin() {
		List<User> users = userDao.selectAllUsersByAdmin();
		return users;
	}

	@Override
	public User getUserByUserNo(int userNo) {
		return userDao.getUserByUserNo(userNo);
	}

	@Override
	public void updateUserByAdmin(int userNo) {
		User user = userDao.getUserByUserNo(userNo);
		user.setEnabled("N");
		userDao.updateUser(user);
	}

	@Override
	public List<User> getUserByCriteria(UserCriteria userCriteria) {		
		return userDao.getUserByCriteria(userCriteria);
	}

	@Override
	public int getUserCntByCriteria(UserCriteria userCriteria) {	
		return userDao.getUserCntByCriteria(userCriteria);
	}

}

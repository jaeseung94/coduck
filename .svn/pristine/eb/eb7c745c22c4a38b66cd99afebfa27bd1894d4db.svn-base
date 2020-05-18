package kr.co.coduck.service;

import org.springframework.transaction.annotation.Transactional;

import kr.co.coduck.vo.User;
@Transactional
public interface UserService {

	boolean addNewUser(User user);
	User login(String userId, String userPassword);
	User getUserProfil(int userNo);
	void userProfilUpdate(User user);
}

package kr.co.coduck.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import kr.co.coduck.vo.User;
@Transactional
public interface UserService {

	boolean addNewUser(User user);
	User login(String userId, String userPassword);
	User getUserProfil(int userNo);
	void userProfilUpdate(User user);
	List<User> selectAllUsersByAdmin();
	
	User getUserByUserNo(int userNo);
	
	// 유저 탈퇴처리
	void updateUserByAdmin(int userNo);
}

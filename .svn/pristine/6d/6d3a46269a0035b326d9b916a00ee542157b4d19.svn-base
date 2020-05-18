package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.LikeLectDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.LikeLectListDto;
import kr.co.coduck.vo.Likelect;
import kr.co.coduck.vo.User;

@Service
public class LikeLectServiceImpl implements LikeLectService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private LikeLectDao likeLectDao;
	
	@Override
	public List<LikeLectListDto> getLikeLectsByUserNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<LikeLectListDto> userLikeLectList = likeLectDao.getLikeLectsByUserNo(user.getNo());
		return userLikeLectList;
	}

	@Override
	public void insertLikeLect(int userNo, int lectNo) {
		Likelect likelect = new Likelect();
		likelect.setUserNo(userNo);
		likelect.setLectNo(lectNo);
		likeLectDao.insertLikeLect(likelect);
	}

}

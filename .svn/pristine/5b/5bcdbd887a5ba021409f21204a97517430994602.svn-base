package kr.co.coduck.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.coduck.dao.AdminQnaDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dao.UserQuestionDao;
import kr.co.coduck.dto.UserQuestionDto;
import kr.co.coduck.form.userQuestionToAdm;
import kr.co.coduck.vo.AdQna;
import kr.co.coduck.vo.AdQnaFile;
import kr.co.coduck.vo.User;
@Service
public class UserQuestionServiceImpl implements UserQuestionService{

	@Autowired
	private UserDao userDao;
	@Autowired
	private UserQuestionDao userQuestionDao;
	
	// 파일을 저장할 경로 지정하기
    @Value("${user.question.img.directory}")
    private String imageDirectory;
	
	//
	@Override
	public List<AdQnaFile> getAdQnaFilesByQnaNo(int qnaNo) {
		return userQuestionDao.getAdQnaFilesByQnaNo(qnaNo);
	}
	
	//
	@Override
	public List<AdQna> getAdQnasByUserNo(int userNo) {
		return userQuestionDao.getAdQnasByUserNo(userNo);
	}
	
	@Override
	public AdQna getAdQnaByNo(int no) {
		return userQuestionDao.getAdQnaByNo(no);
	}
	
	@Override
	public void insertAdQnaFile(AdQnaFile file) {
		userQuestionDao.insertAdQnaFile(file);
	}
	
	@Override
	public int insertAdQna(userQuestionToAdm form, int userNo) throws IOException {
		AdQna adQna = new AdQna();
        adQna.setUserNo(userNo);
        adQna.setTitle(form.getTitle());
        adQna.setContent(form.getContent());
        userQuestionDao.insertAdQna(adQna);
        
        for(MultipartFile image : form.getFiledatas()) {
            String originalName = image.getOriginalFilename();
            
            System.out.println("===================================================");
            
            System.out.println("originName :"+ originalName);
   
            //image.transferTo(new File(imageDirectory, originalName));
            FileCopyUtils.copy(image.getBytes(), new File(imageDirectory, originalName));
            
            AdQnaFile qnaFile = new AdQnaFile();
            qnaFile.setFileName(originalName);
            qnaFile.setAdQnaNo(adQna.getNo());
            
            userQuestionDao.insertAdQnaFile(qnaFile);
      	  	
        }
        return adQna.getNo();
	}
	
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

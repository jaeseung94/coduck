package kr.co.coduck.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.coduck.form.FilenameNSizeForm;
import kr.co.coduck.form.userQuestionToAdm;
import kr.co.coduck.service.QuestionService;

@Controller
@RequestMapping("/user")
public class QuestionController {
	
	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
    
    @Value("${user.question.img.directory}")
    private String imageDirectory;
	
	@GetMapping("/userqueston.hta")
	public String userqueston() {
		return "user/userquestion";
	}
	

	 //로직은 언제나 Service에서 짜도록 하자.
    //중간실패시 rollback은 고려하지 않았음.
    //@RequestMapping(value="/questionImageupload.hta", method=RequestMethod.POST)
//    @RequestMapping("/questionImageupload.hta")
//    public int insertAdQna(userQuestionToAdm form) throws IOException {
//        long sizeSum = 0;
//        System.out.println();
//        for(MultipartFile image : form.getFiledatas()) {
//            String originalName = image.getOriginalFilename();
//            
//            System.out.println("===================================================");
//            
//            System.out.println("originName :"+ originalName);
//            //확장자 검사
//            if(!isValidExtension(originalName)){
//                return RESULT_UNACCEPTED_EXTENSION;
//            }
//            
//            //용량 검사
//            sizeSum += image.getSize();
//            if(sizeSum >= LIMIT_SIZE) {
//                return RESULT_EXCEED_SIZE;
//            }
//            //image.transferTo(new File(imageDirectory, originalName));
//            FileCopyUtils.copy(image.getBytes(), new File(imageDirectory, originalName));
//      	  	
//        }
//        
//        //실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
//        //특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
//        return RESULT_SUCCESS;
//    }
//
//    //required above jdk 1.7 - switch(String)
//    private boolean isValidExtension(String originalName) {
//        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
//        switch(originalNameExtension) {
//        case "jpg":
//        case "JPG":
//        case "png":
//        case "PNG":
//        case "gif":
//        case "GIF":
//            return true;
//        }
//        return false;
//    }
}



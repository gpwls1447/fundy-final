package com.kh.fundy.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProjectWriteController {
	
	@RequestMapping("/finaltest.do")
	public String test() {
		return "projectWrite/writeMain";
	}
	@RequestMapping("/finaltest1.do")
	public String test12() {
		return "projectWrite/writeFundRewardOption";
	}
	@RequestMapping("/finaltest2.do")
	public String test2() {
		return "projectWrite/writeProjectIntro";
	}
	@RequestMapping("/finaltest3.do")
	public String test3() {
		return "projectWrite/writeAccount";
	}
	@RequestMapping("/test.do")
	public String testEditor() {
		return "projectWrite/testEditor";
	}
	
    // 다중파일업로드
    @RequestMapping(value = "/upload/multiplePhotoUpload.do", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:\\Users\\kkjhj\\git\\Final_fundy\\final_fundy\\src\\main\\webapp\\resources\\projectIntroImages\\";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:9090/fundy/resources/projectIntroImages/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
    
    @RequestMapping("/addReward.do")
    public String addReward() {
    	return "projectWrite/rewardFrame";
    }
    @RequestMapping("/addRewardProduct.do")
    public String addRewardProduct() {
    	return "projectWrite/rewardProductFrame";
    }
}

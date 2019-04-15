package com.kh.fundy.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Category;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.service.ProjectWriteService;

import net.sf.json.JSONArray;


@Controller
public class ProjectWriteController {
	@Autowired
	private ProjectWriteService service;
	
	private ModelAndView mv;
	
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
            String filePath = request.getSession().getServletContext().getRealPath("/resources/projectIntroImages/");
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
              .append("&sFileURL=").append(request.getContextPath() + "/resources/projectIntroImages/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }
    
    @RequestMapping("/upload/projectThumnail.do")
    public void uploadThumnail(MultipartFile[] upFile, HttpServletRequest re, HttpServletResponse res, String projectNo) {
    	String saveDir = re.getSession().getServletContext().getRealPath("/resources/projectRepresent");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String thumnailSrc = service.selectThumnail(projectNo);
		//파일삭제
		if(thumnailSrc != null) {
			File file = new File(saveDir + "/" + thumnailSrc);
	        
	        if( file.exists() ){
	            if(file.delete()){
	            }else{
	            	
	            }
	        }else{
	        	
	        }
		}
		
		
		String reNameFile = "";
		for(MultipartFile f: upFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int rndNum = (int)(Math.random()*10000);
				reNameFile = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + ext;
				
				try {
					f.transferTo(new File(saveDir + "/" + reNameFile));
					Map<String, String> map = new HashMap<String, String>();
					map.put("projectNo", projectNo);
					map.put("oriFileName", oriFileName);
					map.put("reNameFile", reNameFile);
					service.updateProjectThumnail(map);
					//service.insertProjectImageSrc(map);
					res.getWriter().print(re.getContextPath() + "/resources/projectRepresent/" + reNameFile);
				}
				catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
    }
    
    @RequestMapping("/upload/memberProfile.do")
    public void uploadMemberProfile(MultipartFile[] upFile, HttpServletRequest re, HttpServletResponse res, String memberEmail) {
    	String saveDir = re.getSession().getServletContext().getRealPath("/resources/memberProfile");
		File dir = new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String profileSrc = service.selectProfileImage(memberEmail);
		
		//파일삭제
		if(profileSrc != null) {
			File file = new File(saveDir + "/" + profileSrc);
	        
	        if( file.exists() ){
	            if(file.delete()){
	            }else{
	            	
	            }
	        }else{
	        	
	        }
		}
        
		String reNameFile = "";
		for(MultipartFile f: upFile) {
			if(!f.isEmpty()) {
				String oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.indexOf("."));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int rndNum = (int)(Math.random()*10000);
				reNameFile = sdf.format(new Date(System.currentTimeMillis())) + "_" + rndNum + ext;
				
				try {
					f.transferTo(new File(saveDir + "/" + reNameFile));
					Map<String, String> map = new HashMap<String, String>();
					map.put("memberEmail", memberEmail);
					map.put("reNameFile", reNameFile);
					service.updateProfileImage(map);
					res.getWriter().print(re.getContextPath() + "/resources/memberProfile/" + reNameFile);
				}
				catch(IOException e) {
					e.printStackTrace();
				}
			}
		}
    }
    
    @RequestMapping("/projectWrite/addReward.do")
    public String addReward() {
    	return "projectWrite/rewardFrame";
    }
    @RequestMapping("/projectWrite/addRewardProduct.do")
    public String addRewardProduct() {
    	return "projectWrite/rewardProductFrame";
    }
    @RequestMapping("/project/projectWrite.do")
	public ModelAndView projectWrite(HttpSession session ,String majorCategory) {
    	mv = new ModelAndView();
    	
    	Member m = (Member)session.getAttribute("loggedMember");
    	m = service.selectMember(m);
    	
    	//신청 목록에있는 프로젝트 검사 있으면 작성중인 프로젝트로이동 아니면 새로 생성후 작성페이지로 이동
    	int projectWritedCnt = service.projectWritedCnt(m.getMemberEmail());
    	System.out.println(projectWritedCnt);
    	if(projectWritedCnt >= 5) {
    		int projectNo = service.selectSavedProjectNo(m.getMemberEmail());
    		mv.addObject("msg", "작성중인 프로젝트가 존재합니다. 작성중인 프로젝트신청페이지로 이동합니다.");
    		mv.addObject("loc", "");
    		mv.setViewName("common/msg");
    		return mv;
    	}
    	else {
    		service.insertProject(m.getMemberEmail());
        	int projectNo = service.selectProjectNo();
        	
        	List<Category> midList = service.selectMidCategorys(majorCategory);
        	List<Category> list = service.selectMinorCategorys(majorCategory);
        	mv.addObject("midCategoryList", midList);
        	mv.addObject("minorCategoryList", list);
        	mv.addObject("projectNo", projectNo);
        	mv.addObject("creator", m);
        	mv.setViewName("projectWrite/writeMain");
    		return mv;
    	}
	}
    
    //신청서 임시저장
    //신청서부분
    @RequestMapping(value="/projectWrite/tempSaveProject.do", method=RequestMethod.POST)
    @ResponseBody
    public void tempSaveProject(HttpServletResponse res, @RequestBody Map<String, Object> project, String projectNo) throws IOException {
    	project.put("endDate", (String)project.get("endDate") + " 00:00:00.0");
    	
    	if(!project.get("endDate").equals(" 00:00:00.0")) {
    		java.sql.Timestamp t = java.sql.Timestamp.valueOf((String)project.get("endDate"));
        	project.put("endDate", t);
    	}
    	else {
    		project.put("endDate", null);
    	}
    	if(project.get("goalPrice").equals("")) {
    		project.put("goalPrice", 0);	//0이면 공백으로간주 컬럼에 null이 들어갈수없어서 0으로 초기화함
    	}
    	
    	project.put("projectNo", projectNo);
    	service.updateTempSaveProject(project);
    	
    	if(project.get("accNum").equals("")) {
    		project.put("accNum", 0);	//목표금액과 같은이유 계좌번호에 null값이 못들어감
    	}
    	service.deleteProjectAccount(project);
    	service.tempSaveProjectAccount(project);
    	service.deleteRewards(project);
    	res.getWriter().print("saved");
    }
    //리워드부분
    @SuppressWarnings("unchecked")
	@RequestMapping(value="/projectWrite/tempSaveProjectReward.do", method=RequestMethod.POST)
    @ResponseBody
    public void tempSaveProjectReward(HttpServletResponse res, @RequestBody Map<String, Object> reward, String projectNo) throws IOException {
    	reward.put("deliDay", (String)reward.get("deliDay") + " 00:00:00.0");
    	
    	if(!reward.get("deliDay").equals(" 00:00:00.0")) {
    		java.sql.Timestamp t = java.sql.Timestamp.valueOf((String)reward.get("deliDay"));
    		reward.put("deliDay", t);
    	}
    	else {
    		reward.put("deliDay", null);
    	}
    	if(reward.get("rewardMoney").equals("")) {
    		reward.put("rewardMoney", 0);	//0이면 공백으로간주 컬럼에 null이 들어갈수없어서 0으로 초기화함
    	}
    	reward.put("projectNo", Integer.parseInt(projectNo));
    	
    	service.saveFundingOption(reward);
    	
    	List<Map<String,Object>> resultMap = new ArrayList<Map<String,Object>>();
        resultMap = JSONArray.fromObject(reward.get("products"));
             
        for (Map<String, Object> map : resultMap) {
            service.insertOptionDetail(map);
        }
    	
    	res.getWriter().print("saved");
    }
    
    //신청서 검토요청
    @RequestMapping("/projectWrite/entryProject.do")
    public void entryProject(String projectNo, HttpServletResponse res) throws IOException{
    	int pNo = Integer.parseInt(projectNo);
    	service.updateEntryProject(pNo);
    	res.getWriter().print("Entry!");
    }
}

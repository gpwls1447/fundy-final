package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.model.vo.RndPackage;
import com.kh.fundy.service.DatagenService;
import com.kh.fundy.service.MemberService;
import com.kh.fundy.service.PayService;

@Controller
public class DatagenController {
	
	
	@Autowired
	private MemberService mService;
	@Autowired
	private DatagenService dService;
	@Autowired
	private PayService pService;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
		
	private final int rndTimeMonthlyTerm = 2;
	private final int targetMemberCount = 300;
	private final int targetProjectCount = 400;
	private final int targetFundingLogCount = 3500;
	private final int targetCommentCount = 1000;

	@RequestMapping("/commentGen.do")
	public ModelAndView commentGen()
	{
		ModelAndView mv = new ModelAndView();
		
		String[] contents = {"물건 잘 받았습니다. 생각했던 것보다 좋네요.", "별로없입니다. 재구매는 없을 것 같네요.", "좋은 일에 동참할 수 있어 기쁩니다.", "조금이나마 도움이 되었으면 좋겠습니다.", "물건 정말 기대되네요." };
		
		Comment c = new Comment();
		
		int result = 0;
		
		while(result < targetCommentCount)
		{
			Member m = dService.selectRndMember((int)(Math.random()*targetMemberCount)+1);		
			c.setProjectNo((int)(Math.random()*targetProjectCount)+1);
			c.setMemberEmail(m.getMemberEmail());
			c.setCommentContent(contents[(int)(Math.random()*6)]);
			Timestamp rndCommentDate = getRandomTime();
			c.setCommentDate(rndCommentDate);
		}
		
		mv.addObject("result", result);
		mv.setViewName("jasonView");
		return mv;
	}
	
	
	@RequestMapping("/fundingLogDatagen.do")
	public ModelAndView fundingLogDatagen()
	{
		ModelAndView mv = new ModelAndView();
		
		FundingLog fl = new FundingLog();
		Member m;
		
		int result = 0;
		while(result < targetFundingLogCount)
		{
			m = dService.selectRndMember((int)(Math.random()*targetMemberCount)+1);			
			fl.setMemberEmail(m.getMemberEmail());
						
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("projectNo", (int)(Math.random()*targetProjectCount)+1);
			map.put("rnum", (int)(Math.random()*5)+1);
			RndPackage rp = dService.selectRndPackage(map);
			
			fl.setProjectNo(rp.getProjectNo());
			fl.setDeliveryStatCode("DS01");
			fl.setPackageNo(rp.getPackageNo());
			fl.setPackageAmount((int)(Math.random()*2)+1);
			
			if((int)(Math.random()*51)>49) {fl.setExtraMoney(10000);}
			else {fl.setExtraMoney(0);}
			
			fl.setFunderDate(new Timestamp(rp.getEndDate().getTime() - ((int)(Math.random()*30)*86400000L)));
			fl.setAnonymous("N");
			result += pService.insertFundingLog(fl);
		}
		
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	@RequestMapping("/datagen.do")
	public ModelAndView run()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", memberDatagen());
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping("/projectgen.do")
	public ModelAndView projectDatagen()
	{
		ModelAndView mv = new ModelAndView();
		
		Project p = new Project();
		Member m;
		
		String[] rndTitle = {"노인 돕기 프로젝트", "오지는 제품을 만나보시겠습니까?", "필수 인싸옷, 갑옷 후드 ", "댕댕이 사진전", "시집 \"얼음과 불의 노래\"", "아동 구호 모금"};
		String[] rndSumary = {"사각지대에 놓인 노인분들을 돕고자 합니다.", "운동화에 스카이콩콩이 달렸다! X이젝스.", "갑옷 후드, 강력한 방한성에 어그로는 덤으로", "인간을 뛰어넘는 감성 표현력", "유노우낫띵 존스노우", "어린이가 살기 좋은 세상이 좋은 세상입니다."};
		
		StringBuilder sb = new StringBuilder();
		
		int rndIndex;
		int rndCodeNo;
		
		int result = 0;
		while(result < targetProjectCount)
		{
			rndIndex = (int)(Math.random()*5);
			m = dService.selectRndMember((int)(Math.random()*targetMemberCount)+1);
			Timestamp rndBeginDate = getRandomTime();
			Timestamp endDate = new Timestamp(rndBeginDate.getTime() + 2629800000L);

			rndCodeNo = (int)(Math.random()*30)+1;
			if(rndCodeNo < 10) sb.append("C0"+rndCodeNo);
			else sb.append("C"+rndCodeNo);
			
			p.setProjectThumnail("thumnail_sample_"+String.valueOf(rndIndex)+".jpg");
			p.setProjectTitle(rndTitle[rndIndex]);
			p.setProjectContent("냉무");
			p.setBeginDate(rndBeginDate);
			p.setEndDate(endDate);
			p.setGoalPrice(10000*((int)(Math.random()*100)+1));
			
			if(endDate.getTime() > System.currentTimeMillis()){p.setProjectStatCode("PS03");}
			else {p.setProjectStatCode("PS04");}
			
			p.setAnchorCount(0);
			p.setProjectSumary(rndSumary[rndIndex]);
			p.setProjectEmail(m.getMemberEmail());
			p.setProjectPhone("01050694404");
			p.setMemberEmail(m.getMemberEmail());
			p.setMinorCode(sb.toString()); sb.setLength(0);
			p.setProjectFormDate(rndBeginDate);
			result += dService.insertProject(p);
		}
		mv.addObject("result", result);
		mv.setViewName("jsonView");
		return mv;
	}
	
	
	public int memberDatagen()
	{
		StringBuilder sb = new StringBuilder();
		
		String[] fnames = {"김", "이", "박", "최", "정", "강", "조", "윤", "장", "임", "한", "오", "서", "신", "권", "황", "안", "송", "전", "홍", "유", "고", "문", "양", "손", "배", "조" , "백", "허", "남"};
		String[] lnames = {"서준", "하준", "도윤", "시우", "지호", "민준", "예준", "주원", "은우", "서진", "지안", "하윤", "서아", "하린", "하은", "서연", "수아", "지우", "지유", "민서", "채원", "다은", "예준", "건우", "환희", "재성", "동윤", "라나", "민예", "가인"};
		String[] initF = {"k", "l", "p", "c", "j", "k", "c", "y", "j", "l", "h", "o", "s", "s", "k", "h", "a", "s", "j", "h", "y", "k", "m", "y", "s", "b", "c", "b", "h", "n"};
		String[] initL = {"sj", "hj", "dw", "sw", "jh", "mj", "yj", "jw", "uw", "sj", "ja", "hy", "sa", "hl", "hu", "sy", "sa", "jw", "jy", "ms", "cw", "du", "yj", "gw", "hh", "jw", "dy", "ln", "my", "ki"};
		
		int cCount = mService.memberCount();
		if(cCount != 0) {mService.memberDeleteAll();}
		System.out.println("회원데이터 생성 시작");
	
		int result = 0;
		
		Member m = new Member();
		while(result < targetMemberCount)
		{
			int fIndex = (int)(Math.random()*fnames.length);
			int lIndex = (int)(Math.random()*fnames.length);
			String rnum = sb.append((int)(Math.random()*10))
					.append((int)(Math.random()*10))
					.append((int)(Math.random()*10))
					.append((int)(Math.random()*10))
					.toString();
			sb.setLength(0);
			
			m.setMemberEmail(sb.append(initF[fIndex]).append(initL[lIndex]).append(rnum).append("@kh.co.kr").toString());
			sb.setLength(0);
			m.setMemberPw(encrpyt(rnum));
			m.setMemberName(sb.append(fnames[fIndex]).append(lnames[lIndex]).toString());
			sb.setLength(0);
			m.setMemberNick(sb.append(initF[fIndex]).append(initL[lIndex]).append(rnum).toString());
			sb.setLength(0);
			m.setMemberProfile("default_profile.png");
			m.setIntro("");
			m.setEmailAuthKey("");
			m.setPhoneAuthKey("");
			Timestamp tempTime = new Timestamp(System.currentTimeMillis()-7889400000L);
			m.setEnrollDate(tempTime);
			m.setLastLoggedIn(tempTime);
			
			result += mService.insertOne(m);
		}

		
		if(result == targetMemberCount)
		{
			System.out.println("회원데이터 생성 완료");
		}
		else {
			System.out.println("회원데이터 생성중 오류 발생");
		}
		
		return result;
	}
	
	public Timestamp getRandomTime()
	{
		long ctm = System.currentTimeMillis();
		long rm = (long)(Math.random()*2629800000L*rndTimeMonthlyTerm);
		Timestamp timestamp = new Timestamp(ctm-rm);
		return timestamp;
	}
	
	public String encrpyt(String pw)
	{
		return pwEncoder.encode(pw);
	}
	
}

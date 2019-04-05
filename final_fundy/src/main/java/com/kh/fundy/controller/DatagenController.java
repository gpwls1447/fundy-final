package com.kh.fundy.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.fundy.model.vo.FundingOption;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.OptionDetail;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.service.MemberService;

@Controller
public class DatagenController {
	
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
		
	private final int targetMemberCount = 200;
	private final int targetProjectCount = 200;

	@RequestMapping("/datagen.do")
	@ResponseBody
	public int run()
	{
		return memberDatagen();
	}
	
	
	public int projectDatagen()
	{
		Project p = new Project();
		FundingOption fo = new FundingOption();
		OptionDetail od = new OptionDetail();
		
		String[] rndTitle = {"노인 돕기 프로젝트", "오지는 제품을 받아보시겠습니까?", "이것만 입으면 당신도 인싸", "댕댕이 사진전", "시집 \"존스노우 유노우낫띵\""};
		
		int result = 0;
		while(result < targetProjectCount)
		{
			
		}

		
		
		
		return 0;
		
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
			m.setMemberProfile("");
			m.setIntro("");
			m.setEmailAuthKey("");
			m.setPhoneAuthKey("");
			Timestamp tempTime = getRandomTime();
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
		long rm = (long)(Math.random()*31250000001L);
		Timestamp timestamp = new Timestamp(ctm-rm);
		return timestamp;
	}
	
	public String encrpyt(String pw)
	{
		return pwEncoder.encode(pw);
	}
	
}

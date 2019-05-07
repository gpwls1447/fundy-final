package com.kh.fundy.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Comment;
import com.kh.fundy.model.vo.CommentReply;
import com.kh.fundy.model.vo.FundingLog;
import com.kh.fundy.model.vo.Member;
import com.kh.fundy.model.vo.Notice;
import com.kh.fundy.model.vo.Project;
import com.kh.fundy.model.vo.RndPackage;
import com.kh.fundy.service.CommentService;
import com.kh.fundy.service.DatagenService;
import com.kh.fundy.service.MemberService;
import com.kh.fundy.service.NoticeService;
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
	private CommentService cService;
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
		
	private final int rndTimeMonthlyTerm = 2;
	private final int targetMemberCount = 200;
	private final int targetProjectCount = 400;
	private final int targetFundingLogCount = 3500;
	private final int targetCommentCount = 2500;
	private final int targetNoticeCount = 120;

	@RequestMapping("/datagen.do")
	public ModelAndView run()
	{
		ModelAndView mv = new ModelAndView();
		mv.addObject("mResult", memberDatagen());
		mv.addObject("pResult", projectDatagen());
		mv.addObject("flResult", fundingLogDatagen());
		mv.addObject("cResult", commentGen());
		mv.setViewName("jsonView");
		return mv;
	}
	
	public int commentGen()
	{	
		String[] contents = {"물건 잘 받았습니다. 생각했던 것보다 좋네요.", "별로입니다. 재구매는 없을 것 같네요.", "좋은 일에 동참할 수 있어 기쁩니다.", "조금이나마 도움이 되었으면 좋겠습니다.", "물건 정말 기대되네요." };
		String[] replies = {"동감합니다.", "저는 그렇게 생각하지 않습니다.", "저는 그저 그렇네요", "맞습니다.", "인정"};
		
		Comment c = new Comment();
		CommentReply cr = new CommentReply();
		
		int result = 0;
		
		while(result < targetCommentCount)
		{
			Member m = dService.selectRndMember((int)(Math.random()*targetMemberCount)+1);		
			c.setProjectNo((int)(Math.random()*targetProjectCount)+1);
			c.setMemberEmail(m.getMemberEmail());
			c.setCommentContent(contents[(int)(Math.random()*5)]);
			Timestamp rndCommentDate = getRandomTime();
			c.setCommentDate(rndCommentDate);
			result += cService.insertComment(c);
			
			if((int)(Math.random()*11) > 8)
			{
				for(int i = 0 ; i < 2 ; i++)
				{
					m = dService.selectRndMember((int)(Math.random()*targetMemberCount)+1);
					cr.setCommentNo(c.getCommentNo());
					cr.setMemberEmail(m.getMemberEmail());
					cr.setCommentReplyContent(replies[(int)(Math.random()*5)]);
					
					Timestamp rndReplyDate = new Timestamp(rndCommentDate.getTime() + 86400000L);				
					cr.setCommentReplyDate(rndReplyDate);
					cService.insertCommentReply(cr);
				}
			}
		}
		return result;
	}
	
	public int fundingLogDatagen()
	{	
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
			
			fl.setFunderDate(new Timestamp(System.currentTimeMillis() - ((int)(Math.random()*30)*86400000L)));
			fl.setAnonymous("N");
			result += pService.insertFundingLog(fl);
		}
		
		return result;
	}
	
	public int projectDatagen()
	{
		Project p = new Project();
		Member m;
		
		String[] rndTitle = {"잠이 솔솔 '아로마' 향초", "우리아이를 위한 '민들레 아기씨'", "뚠뚜니양이 ", "차오름향초", "멍멍이 에코백", "혀 살살녹 디저트", "한국의 이상한 식물사전 [괴초록]", "자매는 처음이라 사진전시회", "너말고 다 있다 키링", "몰랑이 쫀득 복숭아 슬리퍼와 인형", "자몽디퓨저 '잠옴'", "장애묘 입양", "시장을 통해 알아보는 [도시인류학]"};
		String[] rndSumary = {"잠이 솔솔 옵니다.", "민들레 아가씨는 예뻐요.", "고양이 봉제인형 '뚠뚜니냥이'를 만나보세.요", "내 곁에 머무르는 차내음 차오름향초.", "강아지 집사들 필수템!", "프랑스 음식 만나보실래요?", "정말 괴상합니다.", "정말로 처음입니다.", "없으면 아싸됨.", "너무 쫀득해서 먹고싶음.", "맨날 좋은 꿈 꾸게 해줄게요.", "장애 유기묘를 입양하세요", "꿀잼입니다."};
		
		StringBuilder sb = new StringBuilder();
		
		int rndIndex;
		int rndCodeNo;
		
		int result = 0;
		while(result < targetProjectCount)
		{
			rndIndex = (int)(Math.random()*12);
			m = dService.selectRndMember((int)(Math.random()*targetMemberCount)+1);
			Timestamp rndBeginDate = getRandomTime();
			Timestamp endDate = new Timestamp(rndBeginDate.getTime() + 2629800000L);

			rndCodeNo = (int)(Math.random()*35)+1;
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
		
		return result;
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
		
		return result;
	}
	
	public int noticeGen()
	{
		int count = 0;
		while(count < targetNoticeCount)
		{
			Notice n = new Notice();
			n.setNoticeTitle("공지사항");
			n.setNoticeContent("공지사항입니다.");
			n.setNoticeDate(new Timestamp(System.currentTimeMillis()));
			count += nService.insertNotice(n, new ArrayList<Attachment>());
		}
		return count;
	}
	
	public Timestamp getRandomTime()
	{
		long ctm = System.currentTimeMillis();
		long rm = (long)(Math.random()*2629800000L*rndTimeMonthlyTerm);
		return new Timestamp(ctm-rm);
	}
	
	public String encrpyt(String pw)
	{
		return pwEncoder.encode(pw);
	}
	
}

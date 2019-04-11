package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.NoticeDao;
import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	
	//공지사항 리스트
	@Override
	public List<Notice> selectList(int cPage, int numPerPage) {
		return dao.selectList(cPage,numPerPage);
	}

	//공지사항 숫자세기
	@Override
	public int selectCount() {
		return dao.selectCount();
	}

	//공지사항 입력
	@Override
	public int insertNotice(Notice notice, List<Attachment> attachmentList) {
		
		int result=0;
	
			result=dao.insertNotice(notice);
			/*if(result==0)*/
			if(attachmentList.size()>0)
			{
				for(Attachment a:attachmentList)
				{
					a.setNoticeNo(notice.getNoticeNo());
					result=dao.insertAttachment(a);
					
				}
			}
	
		
		
		return 0;
	}

	//공지사항 상세보기
	@Override
	public Notice noticeView(int noticeNo) {
		return dao.noticeView(noticeNo);
	}

	//공지사항 삭제
	@Override
	public int noticeDelete(int noticeNo) {
		return dao.noticeDelete(noticeNo);
	}

	//공지사항 수정
	@Override
	public int noticeUpdate(Notice notice) {
		return dao.noticeUpdate(notice);
	}
	
	
	
	
}

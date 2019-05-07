package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.fundy.common.BoardException;
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
	@Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.DEFAULT, rollbackFor = Exception.class)
	public int insertNotice(Notice notice, List<Attachment> attachmentList) {
		
		int result = dao.insertNotice(notice);
		try {
			if(result == 0) throw new BoardException("게시물 등록에 실패하였습니다.");
			if(attachmentList.size() > 0)
			{
				for(Attachment a : attachmentList)
				{
					a.setNoticeNo(notice.getNoticeNo());
					result=dao.insertAttachment(a);			
				}
			}			
		} catch(Exception e)
		{
			throw e;
		}
		return result;
	}

	//공지사항 상세보기
	@Override
	public Notice noticeView(int noticeNo) {
		return dao.noticeView(noticeNo);
	}

	//공지사항 삭제
	@Override
	public int noticeDelete(Notice notice) {
		return dao.noticeDelete(notice);
	}

	//공지사항 수정
	@Override
	public int noticeUpdate(Notice notice) {
		return dao.noticeUpdate(notice);
	}
	
	
	
	
}

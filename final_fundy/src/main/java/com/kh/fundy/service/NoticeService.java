package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Notice;

public interface NoticeService {

	//공지사항 리스트 불러오기
	List<Notice> selectList(int cPage,int numPerPage);
	//공지사항수 카운트
	int selectCount();
	//공지사항 작성
	int insertNotice(Notice notice, List<Attachment> attachmentList);
	//공지사항 상세보기
	Notice noticeView(int noticeNo);
	//공지사항 삭제
	int noticeDelete(int noticeNo);
	//공지사항 수정
	int noticeUpdate(Notice notice);
	
	
	
}

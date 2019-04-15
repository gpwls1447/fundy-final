package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Notice;

public interface NoticeDao {

	//공지사항 전체 목록
	List<Notice> selectList(int cPage,int numPerPage);
	//공지글 숫자세기
	int selectCount();
	//공지사항 입력
	int insertNotice(Notice notice);
	//공지사항 파일입력
	int insertAttachment(Attachment a);
	//공지사항 상세보기
	Notice noticeView(int noticeNo);
	//공지사항 수정
	int noticeUpdate(Notice notice);
	//공지사항 삭제
	int noticeDelete(Notice notice);
}

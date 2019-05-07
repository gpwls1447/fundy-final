package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Notice;

public interface NoticeService {

	List<Notice> selectList(int cPage,int numPerPage);
	int selectCount();
	int insertNotice(Notice notice, List<Attachment> attachmentList);
	Notice noticeView(int noticeNo);
	int noticeDelete(Notice notice);
	int noticeUpdate(Notice notice);
}

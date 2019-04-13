package com.kh.fundy.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Attachment;
import com.kh.fundy.model.vo.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate session;

	//공지사항 전체목록
	@Override
	public List<Notice> selectList(int cPage, int numPerPage) {
		return session.selectList("notice.selectList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	//공지사항 숫자 카운트
	@Override
	public int selectCount() {
		return session.selectOne("notice.selectCount");
	}

	//공지사항 입력
	@Override
	public int insertNotice(Notice notice) {
		return session.insert("notice.insertNotice",notice);
	}
	
	//공지사항 파일업로드
	@Override
	public int insertAttachment(Attachment a) {
		return session.insert("notice.insertAttachment",a);
	}

	//공지사항 상세보기
	@Override
	public Notice noticeView(int noticeNo) {
		return session.selectOne("notice.noticeView",noticeNo);
	}

	//공지사항 수정
	@Override
	public int noticeUpdate(Notice notice) {
		return session.update("notice.noticeUpdate",notice);
	}

	//공지사항 삭제
	@Override
	public int noticeDelete(Notice notice) {
		return session.update("notice.noticeDelete",notice);
	}
	
	
	
	
}

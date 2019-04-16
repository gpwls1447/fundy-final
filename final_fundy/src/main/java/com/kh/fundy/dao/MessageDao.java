package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Message;

public interface MessageDao {

	//메세지 리스트 불러오기
	List<Message> messageList(String receiverEmail);
	//받은메세지 불러오기
	List<Message> reMessageList(Message ms);
	//보낸 메세지 불러오기
	List<Message> seMessageList(Message ms);
	//메세지 입력하기
	int insertMsg(Message ms);
	//보낸회원 정보조회
	List<Message> msgMemberList(Message ms);
}

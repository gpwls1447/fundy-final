package com.kh.fundy.dao;

import java.util.List;

import com.kh.fundy.model.vo.Message;

public interface MessageDao {

	//메세지 리스트 불러오기
	List<Message> messageList(String receiverEmail);
}

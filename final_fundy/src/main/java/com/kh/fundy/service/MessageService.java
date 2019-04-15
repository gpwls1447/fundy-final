package com.kh.fundy.service;

import java.util.List;

import com.kh.fundy.model.vo.Message;

public interface MessageService {

	//메세지 리스트 불러오기
	List<Message> messageList(String receiverEmail);
}

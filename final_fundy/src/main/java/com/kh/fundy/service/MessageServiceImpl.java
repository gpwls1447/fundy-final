package com.kh.fundy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.MessageDao;
import com.kh.fundy.model.vo.Message;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDao dao;
	
	//메세지 리스트 불러오기
	@Override
	public List<Message> messageList(String receiverEmail) {
		return dao.messageList(receiverEmail);
	}
	
	
	
}

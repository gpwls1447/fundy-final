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

	//받은메세지 불러오기
	@Override
	public List<Message> reMessageList(Message ms) {
		return dao.reMessageList(ms);
	}

	//보낸메세지 불러오기
	@Override
	public List<Message> seMessageList(Message ms) {
		return dao.seMessageList(ms);
	}

	//메세지 입력하기
	@Override
	public int insertMsg(Message ms) {
		return dao.insertMsg(ms);
	}
	
	
	
	
}

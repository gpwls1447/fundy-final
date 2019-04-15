package com.kh.fundy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.fundy.model.vo.Message;

@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSessionTemplate session;

	//메세지 리스트 불러오기
	@Override
	public List<Message> messageList(String receiverEmail) {
		return session.selectList("message.messageList",receiverEmail);
	}
	
	
}

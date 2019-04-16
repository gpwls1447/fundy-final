package com.kh.fundy.common;

import java.util.Comparator;

import com.kh.fundy.model.vo.Message;

public class DescDate implements Comparator<Message> {

	
	@Override
	public int compare(Message o1, Message o2) {
		// TODO Auto-generated method stub
		return o1.getMessageDate().compareTo(o2.getMessageDate());
	}
	
}

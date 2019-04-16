package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.MainDao;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDao dao;
	
	@Override
	public List<Map<String, Object>> selectProjectList(Map<String, String> ctgMap) {
		return dao.selectProjectList(ctgMap);
	}

	@Override
	public List<Map<String, Object>> selectEditorProjectList(Map<String, String> ctgMap) {
		return dao.selectEditorProjectList(ctgMap);
	}
	
	@Override
	public List<Map<String, Object>> selectNewSoonProjectList(String midCtg, String condition, String majorCode) {
		return dao.selectNewSoonProjectList(midCtg, condition, majorCode);
	}
	
	@Override
	public List<Map<String, String>> selectPagingList(Map<String, String> paraMap) {
		return dao.selectPagingList(paraMap);
	}
	
	@Override
	public int selectTotalCount(String majorCode) {
		return dao.selectTotalCount(majorCode);
	}
}

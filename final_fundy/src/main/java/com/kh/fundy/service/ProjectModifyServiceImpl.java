package com.kh.fundy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.fundy.dao.ProjectModifyDao;

@Service
public class ProjectModifyServiceImpl implements ProjectModifyService {
	@Autowired
	private ProjectModifyDao dao;
}

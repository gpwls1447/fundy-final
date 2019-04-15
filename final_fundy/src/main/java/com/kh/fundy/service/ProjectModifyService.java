package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

public interface ProjectModifyService {
	Map<String, Object> selectProject(int projectNo);
	List<Map<String, Object>> selectFundingOption(int projectNo);
	List<Map<String, Object>> selectOptionDetail(int projectNo);
}

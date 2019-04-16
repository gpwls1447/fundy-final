package com.kh.fundy.service;

import java.util.List;
import java.util.Map;

public interface MainService {
	List<Map<String, Object>> selectProjectList(Map<String, String> ctgMap);
	List<Map<String, Object>> selectEditorProjectList(Map<String, String> ctgMap);
	List<Map<String, Object>> selectNewSoonProjectList(String midCtg, String condition, String majorCode);
	List<Map<String, String>> selectPagingList(Map<String, String> paraMap);
	int selectTotalCount(String majorCode);
}

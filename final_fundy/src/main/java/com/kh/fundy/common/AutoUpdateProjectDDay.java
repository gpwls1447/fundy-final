package com.kh.fundy.common;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

@Configuration
@EnableScheduling
@Repository
public class AutoUpdateProjectDDay {
	@Autowired
	SqlSessionTemplate session;
	
	@Scheduled(cron="0/10 * * * * *")	//테스트로 10초마다, 401번 프로젝트 업데이트문 실행
	public void autoUpdate() {
		int result = session.update("autoUpdate.projectEndUpdate");
		
		System.out.println(result);
	}
}

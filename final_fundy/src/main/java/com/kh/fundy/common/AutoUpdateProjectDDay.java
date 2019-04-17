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
	
	@Scheduled(cron="0 0/10 * * * *")	//10분마다 메소드 실행
	public void autoUpdate() {
		session.update("autoUpdate.projectEndUpdate");
	}
}

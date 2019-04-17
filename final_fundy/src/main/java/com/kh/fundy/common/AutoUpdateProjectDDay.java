package com.kh.fundy.common;

import java.util.concurrent.Executors;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ConcurrentTaskScheduler;
import org.springframework.stereotype.Repository;

@Configuration
@EnableScheduling
@Repository
public class AutoUpdateProjectDDay {
	@Autowired
	SqlSessionTemplate session;
	
	@Bean
    public MyBean myBean () {
        return new MyBean();
    }

    @Bean
    public TaskScheduler taskExecutor () {
        return new ConcurrentTaskScheduler(
                  Executors.newScheduledThreadPool(3));
    }
    
    public class MyBean {
    	@Scheduled(cron="* 0/10 * * * *")	//10분마다 마감시간지난 프로젝트 상태코드 변경하도록 설정
    	public void autoUpdate() {
    		session.update("autoUpdate.projectEndUpdate");
    	}
    }
}

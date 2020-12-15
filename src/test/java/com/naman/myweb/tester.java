package com.naman.myweb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)	
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/db-context.xml")
public class tester {
	
	@Autowired
	HikariDataSource ds;
	
	@Test
	public void test() {
		
		
		System.out.println("test");
		System.out.println(ds);
	}
}

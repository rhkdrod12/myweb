package com.naman.myweb;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.naman.common.util.HangleCho;
import com.zaxxer.hikari.HikariDataSource;

@RunWith(SpringJUnit4ClassRunner.class)	
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring-config/db-context.xml")
public class tester {
	
	static final String InitArr = "ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ";
	static final String VoweArr = "ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ";
	static final String FinArr = "ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ";
	
	@Autowired
	HikariDataSource ds;
	
	@Test
	public void test() {
		
		String test = "가나다라마바사asdada01231490";
		
		test = HangleCho.getStr(test);
		String s = " ";
		System.out.println(s.codePointAt(0));
		/*
		 * char s = '가';
		 * 
		 * System.out.println((int)s);
		 * 
		 * int code = (int)s;
		 * 
		 * int init = (code - 44032)/(588); int vowe = (code - 44032 - (init*588))/28;
		 * int fin = (code - 44032 - init - vowe);
		 * 
		 * System.out.println();
		 */
		
		
	}
}

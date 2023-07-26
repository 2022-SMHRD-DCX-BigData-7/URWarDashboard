package com.smhrd.database;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	static SqlSessionFactory sqlSessionFactory;
	// 다른곳에서 SqlSessionManager 객체를 호출할때
	// 자동으로 한번 실행되게끔 하기 위함
	static {
		try {
			// MyBatis 설정 파일 config.xml을 읽어 DB에 연결
			String resource = "com/smhrd/database/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =
			  new SqlSessionFactoryBuilder().build(inputStream);
			// SqlSessionFactoryBuilder : 설정파일을 바탕으로 SqlSessionFactory 생성
			// SqlSessionFactory : SqlSession을 생성(Connection 객체와 같은 역할)
			// SqlSession : SQL 실행, 트랜잭션 관리
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// SqlSessionFactory를 DAO에서 사용할 수 있게 만드는 메소드
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
	
	
	

}

package com.smhrd.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class idcheckDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
		public idcheck idsearchMember(idcheck search_id) {
			idcheck idsearchMember = null;
			
			try {
				idsearchMember = sqlSession.selectOne("search_id");
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			
			return idsearchMember;
		}

	
	
	
}

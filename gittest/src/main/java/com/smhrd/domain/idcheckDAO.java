package com.smhrd.domain;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class idcheckDAO {
    SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
    SqlSession sqlSession = sqlSessionFactory.openSession();

    public String idsearchMember(idcheck search_id) {
        String idsearchMember = null;

        try {
            idsearchMember = sqlSession.selectOne("idsearchMember", search_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }

        return idsearchMember;
    }
}
package com.smhrd.domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class memberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	// 아이디 중복조회 기능 구현
	public member idselectMember(member id) {
		member idselectMember = null;
		try {
			idselectMember = sqlSession.selectOne("idselectMember",id);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return idselectMember;
	}
	
	
	// 회원가입 기능 구현
	public int insertMember(member joinMember) {
		int cnt = 0;
		try {
			// insert("MemberMapper.xml SQL태그 id", 넣어줄 값)
			// Mapper가 여러개인경우 com.smhrd.database.MemberMapper.insertMember
			cnt = sqlSession.insert("insertMember", joinMember);
			// 내가 원하는 일을 성공했다면 DB에 반영
			if(cnt>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 빌려온 연결고리를 반납
			sqlSession.close();
		}//finally 끝
		return cnt;
	}// insertMember 메소드 끝
	
	
	// 로그인 기능 구현
	public member selectMember(member login) {
		member loginMember = null;
		try {
			loginMember = sqlSession.selectOne("selectMember",login);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return loginMember;
	}// selectMember 메소드 끝
	
	
	// 회원정보수정 기능 구현
	public int updateMember(member update) {
		int cnt = 0;
		try {
			// update("MemberMapper.xml SQL태그 id", 넣어줄 값)
			// Mapper가 여러개인경우 com.smhrd.database.MemberMapper.updateMember
			cnt = sqlSession.update("updateMember", update);
			// 내가 원하는 일을 성공했다면 DB에 반영
			if(cnt>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 빌려온 연결고리를 반납
			sqlSession.close();
		}//finally 끝
		return cnt;
		
	}// updateMember 끝
	
	
	// 회원 전체 조회 기능 구현
	public List<member> selectAll() {
		List<member> memberList = null;
		
		try {
			memberList = sqlSession.selectList("selectAll");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return memberList;
	}// selectAll 끝
	
	// 회원삭제 기능 구현
	public int deleteMember(String id) {
		int cnt = 0;
		try {
			cnt = sqlSession.delete("deleteMember", id);
			// 내가 원하는 일을 성공했다면 DB에 반영
			if(cnt>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 빌려온 연결고리를 반납
			sqlSession.close();
		}//finally 끝
		return cnt;
}
	
// 아이디 조회 기능
	public String idsearchMember(member search_id) {
		String idsearchMember = null;
		
		try {
			idsearchMember = sqlSession.selectOne("search_id");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return idsearchMember;
	} 
	
	
// 비밀번호 조회 기능
	public String pwsearchMember(member search_pw) {
		String pwsearchMember = null;
		
		try {
			pwsearchMember = sqlSession.selectOne("search_pw");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return pwsearchMember;
	}

}

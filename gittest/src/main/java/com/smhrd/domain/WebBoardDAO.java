package com.smhrd.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.*;

public class WebBoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	    public WebBoardDAO() {

	        try {

	            String JDBC_URL = "jdbc:oracle:thin:@project-db-stu2.smhrd.com:1524:xe";

	            String JDBC_ID = "suncheon_0713_2";

	            String JDBC_Password = "smhrd2";

	            Class.forName("JDBC_DRIVER");

	            conn = DriverManager.getConnection(JDBC_URL, JDBC_ID, JDBC_Password);

	        } catch (Exception e) {
	            e.printStackTrace();

	        }
	    }

	 

	    // 현재시간가져오는것
	    public String getDate() {
	        String SQL = "SELECT NOW()";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL); //conn객체를 이용 SQL문장을 실행준비로 만듬
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                return rs.getString(1); //1을해서 현재날짜 그대로 반환
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return ""; //데이터베이스오류
	    }

	 

	    // 아이디가져오는것
	    public int getNext() {
	        String SQL = "SELECT WB_SEQ FROM TB_WEBBOARD ORDER BY WB_SEQ DESC"; // 내림차순하여 가장 마지막에쓰인 글번호를 가져올 수 있도록함
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL); // conn객체를 이용 SQL문장을 실행준비로 만듬
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	               return rs.getInt(1) +1; //1을 더해서 그다음 게시글이 들어갈 수 있도록한다.
	            }
	            return 1; // 현재가 첫번째 게시물인 경우
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return -1; //데이터베이스오류
	    }

	 

	    // 글쓰기 기능
	    public int write(String WB_TITLE, String WB_CONTENT, String ID)  {
	        String SQL = "INSERT INTO TB_WEBBOARD VALUES(?, ?, ?, ?)";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL); 
	            pstmt.setInt(1, getNext()); // 다음번에 쓰게될 게시물번호
	            pstmt.setString(2, WB_TITLE);
	            pstmt.setString(3, WB_CONTENT);
	            pstmt.setString(4, ID);
	            return pstmt.executeUpdate();
	            
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return -1; //데이터베이스오류
	    }
	    
	    
	    // 게시글 리스트
	    public ArrayList<WebBoard> getList(int pageNumber) {
	    	 String SQL = "select * from WebBoard where WB_SEQ <? and WB_SEQ = 1 order by WB_SEQ desc limit 10";
	        ArrayList<WebBoard> list = new ArrayList<WebBoard>(); 
	        try {
	        	PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber -1 ) * 10);//getnext 다음으로 작성될글의 번호
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	            	WebBoard TB_WEBBOARD = new WebBoard();//BBS에 담긴 데이터 가져오기
	            	TB_WEBBOARD.setWB_SEQ(rs.getInt(1));
	            	TB_WEBBOARD.setWB_TITLE(rs.getString(2));
	            	TB_WEBBOARD.setWB_CONTENT(rs.getString(3));
	            	TB_WEBBOARD.setWB_FILE(rs.getString(4));
	            	TB_WEBBOARD.setWB_VIEWS(rs.getInt(5));
	            	TB_WEBBOARD.setWB_LIKES(rs.getInt(6));
	            	TB_WEBBOARD.setCREATED_AT(rs.getString(7));
	            	TB_WEBBOARD.setID(rs.getString(8));
	                list.add(TB_WEBBOARD);//모든 내용이 담긴 게시글 인스턴스를 리스트에 담아 반환
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return list;
	    }

	 

	    // 페이징 처리 함수
	    public boolean nextPage(int pageNumber) {
	    		String SQL = "select * from WebBoard where WB_SEQ <? and WB_SEQ = 1";
	       try {
	    	    PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber -1 ) * 10);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	                return true;
	            }
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	    
	    

	    // 글상세보기 기능    
	    public WebBoard getWebBoard(int WB_SEQ) {
	    	String SQL = "SELECT * FROM WebBoard WHERE WB_SEQ = ?";
	    	ArrayList<WebBoard>list = new ArrayList<WebBoard>();
		       try {
		    	    PreparedStatement pstmt = conn.prepareStatement(SQL);
		            pstmt.setInt(1, WB_SEQ);
		            rs = pstmt.executeQuery();
		            if (rs.next()) {
		            	WebBoard TB_WEBBOARD = new WebBoard();  
		            	TB_WEBBOARD.setWB_SEQ(rs.getInt(1));
		            	TB_WEBBOARD.setWB_TITLE(rs.getString(2));
		            	TB_WEBBOARD.setWB_CONTENT(rs.getString(3));
		            	TB_WEBBOARD.setWB_FILE(rs.getString(4));
		            	TB_WEBBOARD.setWB_VIEWS(rs.getInt(5));
		            	TB_WEBBOARD.setWB_LIKES(rs.getInt(6));
		            	TB_WEBBOARD.setCREATED_AT(rs.getString(7));
		            	TB_WEBBOARD.setID(rs.getString(8));
		                return TB_WEBBOARD;
		            }
		        } catch(Exception e) {
		            e.printStackTrace();
		        }
		        return null;
		    }

	    // 글수정하기
	    public int update(String WB_TITLE, String WB_CONTENT, int WB_SEQ)  {
	        String SQL = "update WebBoard set WB_TITLE=?, WB_CONTENT=?, WB_SEQ=?";   
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL); 
	            pstmt.setString(1, WB_TITLE);
	            pstmt.setString(2, WB_CONTENT);
	            pstmt.setInt(3, WB_SEQ);
	            return pstmt.executeUpdate();
	          } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return -1; //데이터베이스오류
	    }
	
	    //글삭제하기
	    public int delete(int WB_SEQ)  {
	         try {
	            pstmt.setInt(1, WB_SEQ);
	            return pstmt.executeUpdate();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	        return -1; //데이터베이스오류
	    }
	 
}


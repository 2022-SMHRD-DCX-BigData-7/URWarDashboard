package com.smhrd.domain;

//newscmtDAO.java

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class newscmtDAO {
 private Connection conn;
 private PreparedStatement pstmt;
 private ResultSet rs;

 // 생성자, 커넥션 연결 메서드 등은 자신의 프로젝트에 맞게 작성해주세요.

 // 뉴스 순번에 해당하는 댓글 목록을 가져오는 메서드
 public List<newscmt> getCommentsByNewsSeq(int news_seq) {
     List<newscmt> commentList = new ArrayList<>();
     try {
         String sql = "SELECT * FROM TB_COMMENT WHERE NEWS_SEQ = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, news_seq);
         rs = pstmt.executeQuery();

         while (rs.next()) {
             int cmt_seq = rs.getInt("CMT_SEQ");
             String cmt_content = rs.getString("CMT_CONTENT");
             Date cmt_at = rs.getDate("CMT_AT");
             String id = rs.getString("ID");

             newscmt comment = new newscmt(cmt_seq, news_seq, cmt_content, cmt_at, id);
             commentList.add(comment);
         }
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         // 리소스 해제
     }
     return commentList;
 }

 // 댓글 추가 메서드
 public void addComment(newscmt comment) {
     try {
         String sql = "INSERT INTO TB_COMMENT (CMT_SEQ, NEWS_SEQ, CMT_CONTENT, CMT_AT, ID) VALUES (?, ?, ?, ?, ?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, comment.getCmt_seq());
         pstmt.setInt(2, comment.getNews_seq());
         pstmt.setString(3, comment.getCmt_content());
         pstmt.setDate(4, new java.sql.Date(comment.getCmt_at().getTime()));
         pstmt.setString(5, comment.getId());

         pstmt.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         // 리소스 해제
     }
 }

 // 댓글 수정 메서드
 public void updateComment(int cmt_seq, String newContent) {
     try {
         String sql = "UPDATE TB_COMMENT SET CMT_CONTENT = ? WHERE CMT_SEQ = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, newContent);
         pstmt.setInt(2, cmt_seq);

         pstmt.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         // 리소스 해제
     }
 }

 // 댓글 삭제 메서드
 public void deleteComment(int cmt_seq) {
     try {
         String sql = "DELETE FROM TB_COMMENT WHERE CMT_SEQ = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, cmt_seq);

         pstmt.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         // 리소스 해제
     }
 }
 
 // 댓글 순번으로 댓글 정보를 가져오는 메서드
 public newscmt getCommentBySeq(int cmt_seq) {
     newscmt comment = null;
     try {
         String sql = "SELECT * FROM TB_COMMENT WHERE CMT_SEQ = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, cmt_seq);
         rs = pstmt.executeQuery();

         if (rs.next()) {
             int news_seq = rs.getInt("NEWS_SEQ");
             String cmt_content = rs.getString("CMT_CONTENT");
             Date cmt_at = rs.getDate("CMT_AT");
             String id = rs.getString("ID");

             comment = new newscmt(cmt_seq, news_seq, cmt_content, cmt_at, id);
         }
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         // 리소스 해제
     }
     return comment;
 }

 // 댓글 작성자 ID를 이용하여 댓글 정보를 가져오는 메서드
 public newscmt getCommentByWriter(int cmt_seq, String id) {
     newscmt comment = null;
     try {
         String sql = "SELECT * FROM TB_COMMENT WHERE CMT_SEQ = ? AND ID = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, cmt_seq);
         pstmt.setString(2, id);
         rs = pstmt.executeQuery();

         if (rs.next()) {
             int news_seq = rs.getInt("NEWS_SEQ");
             String cmt_content = rs.getString("CMT_CONTENT");
             Date cmt_at = rs.getDate("CMT_AT");

             comment = new newscmt(cmt_seq, news_seq, cmt_content, cmt_at, id);
         }
     } catch (SQLException e) {
         e.printStackTrace();
     } finally {
         // 리소스 해제
     }
     return comment;
 }

}

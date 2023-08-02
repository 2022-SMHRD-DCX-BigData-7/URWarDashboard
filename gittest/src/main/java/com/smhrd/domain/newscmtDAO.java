package com.smhrd.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class newscmtDAO {
    final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    final String JDBC_URL = "jdbc:oracle:thin:@project-db-stu2.smhrd.com:1524:xe";

    public Connection open() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, "suncheon_0713_2", "smhrd2");
    }

    public List<newscmt> getCommentsByNewsSeq(int news_seq) {
        List<newscmt> commentList = new ArrayList<>();
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM TB_COMMENT WHERE NEWS_SEQ = ?")) {
            pstmt.setInt(1, news_seq);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int cmt_seq = rs.getInt("CMT_SEQ");
                    String cmt_content = rs.getString("CMT_CONTENT");
                    Date cmt_at = rs.getDate("CMT_AT");
                    String id = rs.getString("ID");
                    newscmt comment = new newscmt(cmt_seq, news_seq, cmt_content, cmt_at, id);
                    commentList.add(comment);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

    public void addComment(newscmt comment) {
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(
                     "INSERT INTO TB_COMMENT (CMT_SEQ, NEWS_SEQ, CMT_CONTENT, CMT_AT, ID) VALUES (?, ?, ?, ?, ?)")) {
            pstmt.setInt(1, comment.getCmt_seq());
            pstmt.setInt(2, comment.getNews_seq());
            pstmt.setString(3, comment.getCmt_content());
            pstmt.setDate(4, new java.sql.Date(comment.getCmt_at().getTime()));
            pstmt.setString(5, comment.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateComment(int cmt_seq, String newContent) {
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(
                     "UPDATE TB_COMMENT SET CMT_CONTENT = ? WHERE CMT_SEQ = ?")) {
            pstmt.setString(1, newContent);
            pstmt.setInt(2, cmt_seq);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteComment(int cmt_seq) {
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(
                     "DELETE FROM TB_COMMENT WHERE CMT_SEQ = ?")) {
            pstmt.setInt(1, cmt_seq);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public newscmt getCommentBySeq(int cmt_seq) {
        newscmt comment = null;
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(
                     "SELECT * FROM TB_COMMENT WHERE CMT_SEQ = ?")) {
            pstmt.setInt(1, cmt_seq);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int news_seq = rs.getInt("NEWS_SEQ");
                    String cmt_content = rs.getString("CMT_CONTENT");
                    Date cmt_at = rs.getDate("CMT_AT");
                    String id = rs.getString("ID");
                    comment = new newscmt(cmt_seq, news_seq, cmt_content, cmt_at, id);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }

    public newscmt getCommentByWriter(int cmt_seq, String id) {
        newscmt comment = null;
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(
                     "SELECT * FROM TB_COMMENT WHERE CMT_SEQ = ? AND ID = ?")) {
            pstmt.setInt(1, cmt_seq);
            pstmt.setString(2, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int news_seq = rs.getInt("NEWS_SEQ");
                    String cmt_content = rs.getString("CMT_CONTENT");
                    Date cmt_at = rs.getDate("CMT_AT");
                    comment = new newscmt(cmt_seq, news_seq, cmt_content, cmt_at, id);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comment;
    }
}

package com.smhrd.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class WebBoardDAO {
    final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
    final String JDBC_URL = "jdbc:oracle:thin:@project-db-stu2.smhrd.com:1524:xe";

    public Connection open() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, "suncheon_0713_2", "smhrd2");
    }

    public Date getCREATE_AT() {
        String SQL = "SELECT sysdate from dual";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getDate(1); // 1을 해서 현재날짜 그대로 반환
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // 데이터베이스 오류
    }

    public int getNext() {
        String SQL = "SELECT WB_SEQ FROM TB_WEBBOARD ORDER BY WB_SEQ DESC"; // 내림차순하여 가장 마지막에 쓰인 글번호를 가져올 수 있도록 함
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1) + 1; // 1을 더해서 그 다음 게시글이 들어갈 수 있도록 함
            }
            return 1; // 현재가 첫번째 게시물인 경우
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int write(String WB_TITLE, String WB_CONTENT, String ID) {
        String SQL = "INSERT INTO TB_WEBBOARD (WB_SEQ, WB_TITLE, WB_CONTENT, ID, WB_VIEWS, WB_LIKES, CREATED_AT) " +
                     "VALUES (TB_WEBBOARD__SEQ.nextval, ?, ?, ?, 0, 0, SYSDATE)";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, WB_TITLE);
            pstmt.setString(2, WB_CONTENT);
            pstmt.setString(3, ID);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int getall() {
        String SQL = "SELECT COUNT(wb_seq) FROM TB_WebBoard";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1;
    }

 // 게시글 리스트
    public ArrayList<WebBoard> getList() {
        String SQL = "SELECT * FROM TB_WebBoard ORDER BY WB_SEQ DESC";
        ArrayList<WebBoard> list = new ArrayList<>();
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                WebBoard TB_WEBBOARD = new WebBoard();
                TB_WEBBOARD.setWB_SEQ(rs.getInt(1));
                TB_WEBBOARD.setWB_TITLE(rs.getString(2));
                TB_WEBBOARD.setWB_CONTENT(rs.getString(3));
                TB_WEBBOARD.setWB_FILE(rs.getString(4));
                TB_WEBBOARD.setWB_VIEWS(rs.getInt(5));
                TB_WEBBOARD.setWB_LIKES(rs.getInt(6));
                TB_WEBBOARD.setCREATED_AT(rs.getDate(7));
                TB_WEBBOARD.setID(rs.getString(8));
                list.add(TB_WEBBOARD);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // 글상세보기 기능
    public WebBoard getWebBoard(int WB_SEQ) {
        String SQL = "SELECT * FROM TB_WebBoard WHERE WB_SEQ = ?";
        WebBoard TB_WEBBOARD = null;
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, WB_SEQ);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    TB_WEBBOARD = new WebBoard();
                    TB_WEBBOARD.setWB_SEQ(rs.getInt(1));
                    TB_WEBBOARD.setWB_TITLE(rs.getString(2));
                    TB_WEBBOARD.setWB_CONTENT(rs.getString(3));
                    TB_WEBBOARD.setWB_FILE(rs.getString(4));
                    TB_WEBBOARD.setWB_VIEWS(rs.getInt(5));
                    int WB_VIEWS = rs.getInt(6);
                    TB_WEBBOARD.setWB_VIEWS(WB_VIEWS);
                    WB_VIEWS++;
                    TB_WEBBOARD.setCREATED_AT(rs.getDate(7));
                    TB_WEBBOARD.setID(rs.getString(8));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return TB_WEBBOARD;
    }

    // 글수정하기
    public void update(String WB_TITLE, String WB_CONTENT, int WB_SEQ) {
        String SQL = "UPDATE TB_WebBoard SET WB_TITLE=?, WB_CONTENT=? WHERE WB_SEQ=?";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setString(1, WB_TITLE);
            pstmt.setString(2, WB_CONTENT);
            pstmt.setInt(3, WB_SEQ);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 글삭제하기
    public void delete(int WB_SEQ) {
        String SQL = "DELETE FROM TB_WebBoard WHERE WB_SEQ=?";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, WB_SEQ);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	    
	    
    public int updateWB_VIEWS(int WB_SEQ) {
        String incrementViewsSQL = "UPDATE TB_WEBBOARD SET WB_VIEWS = WB_VIEWS + 1 WHERE WB_SEQ = ?";
        String getViewsSQL = "SELECT WB_VIEWS FROM TB_WEBBOARD WHERE WB_SEQ = ?";
        try (Connection conn = open();
             PreparedStatement incrementPstmt = conn.prepareStatement(incrementViewsSQL);
             PreparedStatement getPstmt = conn.prepareStatement(getViewsSQL)) {
            // 먼저 조회수를 1 증가시킵니다.
            incrementPstmt.setInt(1, WB_SEQ);
            incrementPstmt.executeUpdate();
            
            // 현재 조회수를 가져와서 반환합니다.
            getPstmt.setInt(1, WB_SEQ);
            ResultSet rs = getPstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("WB_VIEWS");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int updateWB_LIKES(int WB_SEQ) {
        String SQL = "UPDATE TB_WEBBOARD SET WB_LIKES = WB_LIKES + 1 WHERE WB_SEQ = ?";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, WB_SEQ);
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}

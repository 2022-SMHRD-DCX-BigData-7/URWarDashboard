package com.smhrd.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class NewsDAO {
	final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final String JDBC_URL = "jdbc:oracle:thin:@project-db-stu2.smhrd.com:1524:xe";

	public Connection open() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "suncheon_0713_2", "smhrd2");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void addNews(News n) throws Exception {
	    Connection conn = open();

	    String sql = "INSERT INTO TB_NEWS(NEWS_SEQ, NEWS_TITLE, NEWS_CONTENT, NEWS_PRESS, NEWS_AT, NEWS_REPORTER, NEWS_LINK) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    PreparedStatement pstmt = conn.prepareStatement(sql);

	    try {
	        pstmt.setInt(1, n.getNEWS_SEQ());
	        pstmt.setString(2, n.getNEWS_TITLE());
	        pstmt.setString(3, n.getNEWS_CONTENT());
	        pstmt.setString(4, n.getNEWS_PRESS());
	        pstmt.setString(5, n.getNEWS_AT());
	        pstmt.setString(6, n.getNEWS_REPORTER());
	        pstmt.setString(7, n.getNEWS_LINK());
	        pstmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
	

	public List<News> getAll() throws Exception {
		Connection conn = open();
		List<News> newsList = new ArrayList<>();
		
		String sql = "select NEWS_SEQ,NEWS_TITLE,NEWS_AT,NEWS_PRESS from TB_NEWS ORDER BY NEWS_SEQ ASC";
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            News n = new News();
	            n.setNEWS_SEQ(rs.getInt("NEWS_SEQ"));
	            n.setNEWS_TITLE(rs.getString("NEWS_TITLE"));	         
	            n.setNEWS_AT(rs.getString("NEWS_AT"));
	            n.setNEWS_PRESS(rs.getString("NEWS_PRESS"));
	            newsList.add(n);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return newsList;
	}


	public News getNews(int NEWS_SEQ) throws SQLException {
	    Connection conn = open();
	    News n = new News();
	    String sql = "SELECT NEWS_SEQ, NEWS_TITLE, NEWS_AT, NEWS_PRESS FROM TB_NEWS ORDER BY NEWS_SEQ ASC WHERE NEWS_SEQ=?";
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, NEWS_SEQ);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            n.setNEWS_SEQ(rs.getInt("NEWS_SEQ"));
	            n.setNEWS_TITLE(rs.getString("NEWS_TITLE"));
	            n.setNEWS_AT(rs.getString("NEWS_AT"));
	            n.setNEWS_PRESS(rs.getString("NEWS_PRESS"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        if (rs != null) {
	            try {
	                rs.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (pstmt != null) {
	            try {
	                pstmt.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return n;
	}

    public static void sortByNewsSeq(List<News> newsList) {
        Collections.sort(newsList, (n1, n2) -> Integer.compare(n1.getNEWS_SEQ(), n2.getNEWS_SEQ()));
	}
}

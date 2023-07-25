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
			conn = DriverManager.getConnection(JDBC_URL, "sejin", "1234");
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void addNews(News n) throws Exception {
		Connection conn = open();
		
		String sql = "insert into news(seq,title,content,press,at,reporter,link) values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		 try{
			 	pstmt.setString();
			 	
			 } catch(Exception e) {
			 	e.printStackTrace();
			 } finally {
			 	pstmt.close();
			 	conn.close();
			 }
		
		}










}

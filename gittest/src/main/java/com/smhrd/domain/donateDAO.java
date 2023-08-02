package com.smhrd.domain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class donateDAO {
    private Connection conn;

    // 데이터베이스 연결
    public donateDAO() {
        String dbUrl = "jdbc:mysql://localhost:3306/your_database_name";
        String dbUser = "your_database_username";
        String dbPassword = "your_database_password";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    // 후원 정보를 데이터베이스에 저장
    public void addDonate(donate donate) {
        String sql = "INSERT INTO donation (ID, DONATE_SUM, CREATED_AT, DONATE_POINT) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, donate.getId());
            pstmt.setInt(2, donate.getDonateSum());
            pstmt.setDate(3, new java.sql.Date(donate.getCreatedAt().getTime()));
            pstmt.setInt(4, donate.getDonatePoint());

            pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 특정 사용자의 후원 내역 조회
    public List<donate> getDonationByUser(String id) {
        List<donate> donationList = new ArrayList<>();
        String sql = "SELECT * FROM donation WHERE ID = ?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                donate donate = new donate();
                donate.setDonateSeq(rs.getInt("DOONATE_SEQ"));
                donate.setId(rs.getString("ID"));
                donate.setDonateSum(rs.getInt("DONATE_SUM"));
                donate.setCreatedAt(rs.getDate("CREATED_AT"));
                donate.setDonatePoint(rs.getInt("DONATE_POINT"));

                donationList.add(donate);
            }

            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return donationList;
    }

    // 데이터베이스 연결 해제
    public void close() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

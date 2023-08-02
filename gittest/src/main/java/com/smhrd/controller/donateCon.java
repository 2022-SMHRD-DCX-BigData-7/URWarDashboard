package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import com.smhrd.domain.donate;
import com.smhrd.domain.donateDAO;

public class donateCon extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        donateDAO donateDAO = new donateDAO();

        if ("donate".equals(action)) {
            String id = request.getParameter("id");
            int donateSum = Integer.parseInt(request.getParameter("donateSum"));
            int donatePoint = (int) (donateSum * 0.05);
            Date createdAt = new Date();

            donate donate = new donate();
            donate.setId(id);
            donate.setDonateSum(donateSum);
            donate.setCreatedAt(createdAt);
            donate.setDonatePoint(donatePoint);

            donateDAO.addDonate(donate);
        }

        String id = request.getParameter("id");
        List<donate> donationList = donateDAO.getDonationByUser(id);

        donateDAO.close();
        request.setAttribute("donationList", donationList);
        request.getRequestDispatcher("donation_history.jsp").forward(request, response);
    }
}

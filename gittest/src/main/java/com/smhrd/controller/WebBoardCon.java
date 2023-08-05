package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.WebBoard;
import com.smhrd.domain.WebBoardDAO;


@WebServlet("/webboard")
public class WebBoardCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        WebBoardDAO webBoardDAO = new WebBoardDAO();

        if ("list".equals(action)) {
            ArrayList<WebBoard> boardList = webBoardDAO.getList();
            
            request.setAttribute("boardList", boardList);
            request.getRequestDispatcher("board.jsp").forward(request, response); // 여기서 "list.jsp"를 "board.jsp"로 변경
        } else if ("view".equals(action)) {
            int WB_SEQ = Integer.parseInt(request.getParameter("WB_SEQ"));
            WebBoard board = webBoardDAO.getWebBoard(WB_SEQ);
            
            // 글 보기 로직
            request.setAttribute("board", board);
            request.getRequestDispatcher("view.jsp").forward(request, response);
        } else if ("like".equals(action)) {
            int WB_SEQ = Integer.parseInt(request.getParameter("WB_SEQ"));
            webBoardDAO.updateWB_LIKES(WB_SEQ);
            
            // 좋아요 로직
            response.sendRedirect("webboard?action=board"); // 좋아요 후 목록으로 이동
        } else {
            response.sendRedirect("board.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        WebBoardDAO webBoardDAO = new WebBoardDAO();

        if ("write".equals(action)) {
            String WB_TITLE = request.getParameter("WB_TITLE");
            String WB_CONTENT = request.getParameter("WB_CONTENT");
            String ID = request.getParameter("ID");

            int result = webBoardDAO.write(WB_TITLE, WB_CONTENT, ID);
            if (result > 0) {
                response.sendRedirect("view.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } else if ("update".equals(action)) {
            int WB_SEQ = Integer.parseInt(request.getParameter("WB_SEQ"));
            String WB_TITLE = request.getParameter("WB_TITLE");
            String WB_CONTENT = request.getParameter("WB_CONTENT");

            webBoardDAO.update(WB_TITLE, WB_CONTENT, WB_SEQ);
            response.sendRedirect("webboard?action=view&WB_SEQ=" + WB_SEQ);
        } else if ("delete".equals(action)) {
            int WB_SEQ = Integer.parseInt(request.getParameter("WB_SEQ"));

            webBoardDAO.delete(WB_SEQ);
            response.sendRedirect("board.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}

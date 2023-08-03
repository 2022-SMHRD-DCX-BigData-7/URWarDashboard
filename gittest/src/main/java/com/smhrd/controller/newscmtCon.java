package com.smhrd.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.newscmt;
import com.smhrd.domain.newscmtDAO;

public class newscmtCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("index.jsp"); // 적절한 페이지로 리다이렉트 또는 처리 로직 추가
        } else {
            newscmtDAO dao = new newscmtDAO(); // newscmtDAO 객체 생성

            switch (action) {
                case "addComment":
                    addComment(request, response, dao);
                    break;
                case "updateComment":
                    updateComment(request, response, dao);
                    break;
                case "deleteComment":
                    deleteComment(request, response, dao);
                    break;
                default:
                    response.sendRedirect("index.jsp"); // 적절한 페이지로 리다이렉트 또는 처리 로직 추가
            }
        }
    }
    
    
    // 댓글 추가 동작을 처리하는 메서드
    private void addComment(HttpServletRequest request, HttpServletResponse response, newscmtDAO dao) throws IOException {
        int news_seq = Integer.parseInt(request.getParameter("news_seq"));
        String id = request.getParameter("id");
        String cmt_content = request.getParameter("cmt_content");

        try (Connection conn = dao.open()) {
            newscmt comment = new newscmt();
            comment.setNews_seq(news_seq);
            comment.setId(id);
            comment.setCmt_content(cmt_content);
            comment.setCmt_at(new Date());
            dao.addComment(comment);

            response.sendRedirect("news.nhn?action=getNews&NEWS_SEQ=" + news_seq);
        } catch (Exception e) {
            e.printStackTrace();
            // 처리 중에 예외 발생 시 적절한 예외 처리 로직 추가
        }
    }

    // 댓글 수정 동작을 처리하는 메서드
    private void updateComment(HttpServletRequest request, HttpServletResponse response, newscmtDAO dao) throws IOException {
        int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
        String newContent = request.getParameter("new_content");
        String id = request.getParameter("id");

        try (Connection conn = dao.open()) {
            newscmt comment = dao.getCommentBySeq(cmt_seq);
            if (comment != null && comment.getId().equals(id)) {
                dao.updateComment(cmt_seq, newContent);
            } else {
            	System.out.println("comment"+comment);
            	System.out.println("comment.getId()"+comment.getId());
            	System.out.println("id"+id);
                response.sendRedirect("news.nhn?action=getNews&NEWS_SEQ=" + comment.getNews_seq() + "&permissionError=true");
                return;
            }

            response.sendRedirect("news.nhn?action=getNews&NEWS_SEQ=" + comment.getNews_seq());
        } catch (Exception e) {
            e.printStackTrace();
            // 처리 중에 예외 발생 시 적절한 예외 처리 로직 추가
        }
    }

    // 댓글 삭제 동작을 처리하는 메서드
    private void deleteComment(HttpServletRequest request, HttpServletResponse response, newscmtDAO dao) throws IOException {
        int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
        String id = request.getParameter("id");

        try (Connection conn = dao.open()) {
            newscmt comment = dao.getCommentBySeq(cmt_seq);
            if (comment != null && comment.getId().equals(id)) {
                dao.deleteComment(cmt_seq);
            } else {
                response.sendRedirect("news.nhn?action=getNews&NEWS_SEQ=" + comment.getNews_seq() + "&permissionError=true");
                return;
            }

            response.sendRedirect("news.nhn?action=getNews&NEWS_SEQ=" + comment.getNews_seq());
        } catch (Exception e) {
            e.printStackTrace();
            // 처리 중에 예외 발생 시 적절한 예외 처리 로직 추가
        }
    }
}

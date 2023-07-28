package com.smhrd.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.domain.newscmt;
import com.smhrd.domain.newscmtDAO;


public class newscmtCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // doGet에서 처리할 로직이 있다면 여기에 작성합니다.
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // doPost에서 처리할 로직이 있다면 여기에 작성합니다.
        String action = request.getParameter("action");

        if (action == null) {
            // action 파라미터가 없는 경우
            response.sendRedirect("index.jsp"); // 적절한 페이지로 리다이렉트 또는 처리 로직 추가
        } else {
            switch (action) {
                case "addComment":
                    addComment(request, response);
                    break;
                case "updateComment":
                    updateComment(request, response);
                    break;
                case "deleteComment":
                    deleteComment(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp"); // 적절한 페이지로 리다이렉트 또는 처리 로직 추가
            }
        }
    }

    // 댓글 추가 동작을 처리하는 메서드
    private void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int news_seq = Integer.parseInt(request.getParameter("news_seq"));
        String id = request.getParameter("id");
        String cmt_content = request.getParameter("cmt_content");

        newscmtDAO dao = new newscmtDAO();
        newscmt comment = new newscmt();
        comment.setNews_seq(news_seq);
        comment.setId(id);
        comment.setCmt_content(cmt_content);
        comment.setCmt_at(new Date());
        dao.addComment(comment);

        response.sendRedirect("newsView.jsp?news_seq=" + news_seq); // 댓글 추가 후 해당 뉴스로 리다이렉트
    }

    // 댓글 수정 동작을 처리하는 메서드
    private void updateComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
        String newContent = request.getParameter("new_content");
        String id = request.getParameter("id");

        newscmtDAO dao = new newscmtDAO();
        newscmt comment = dao.getCommentBySeq(cmt_seq);
        if (comment != null && comment.getId().equals(id)) {
            dao.updateComment(cmt_seq, newContent);
        } else {
            // 댓글 작성자가 아닌 경우 수정 권한이 없음을 처리하는 로직 추가
            response.sendRedirect("newsView.jsp?news_seq=" + comment.getNews_seq() + "&permissionError=true");
            return;
        }

        response.sendRedirect("newsView.jsp?news_seq=" + comment.getNews_seq()); // 댓글 수정 후 해당 뉴스로 리다이렉트
    }

    // 댓글 삭제 동작을 처리하는 메서드
    private void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int cmt_seq = Integer.parseInt(request.getParameter("cmt_seq"));
        String id = request.getParameter("id");

        newscmtDAO dao = new newscmtDAO();
        newscmt comment = dao.getCommentBySeq(cmt_seq);
        if (comment != null && comment.getId().equals(id)) {
            dao.deleteComment(cmt_seq);
        } else {
            // 댓글 작성자가 아닌 경우 삭제 권한이 없음을 처리하는 로직 추가
            response.sendRedirect("newsView.jsp?news_seq=" + comment.getNews_seq() + "&permissionError=true");
            return;
        }

        response.sendRedirect("newsView.jsp?news_seq=" + comment.getNews_seq()); // 댓글 삭제 후 해당 뉴스로 리다이렉트
    }
}

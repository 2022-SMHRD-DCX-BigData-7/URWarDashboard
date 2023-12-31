<%@page import="com.smhrd.domain.newscmt"%>
<%@page import="com.smhrd.domain.newscmtDAO"%>
<%@page import="com.smhrd.domain.member"%>
<%@page import="com.smhrd.domain.News"%>
<%@page import="com.smhrd.domain.NewsDAO"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  
 <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
<title>뉴스 관리 앱</title>
 <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />

  <!-- login stylesheet -->
  <link href='css/font-awesome.min.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/l_style.css"> <!-- Resource style -->
	<link rel="stylesheet" href="css/demo.css"> <!-- Demo style -->
		<style>
	  .card-title {
	    font-size: 18px;
	    width: 100%;
	    white-space: pre-wrap; /* 줄바꿈 설정 */
	  }
	</style>
</head>
<body>

<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      
      <div class="header_bottom">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.jsp">
              <img src="images/logo.png" alt="">
            </a>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="index.jsp">홈<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="service.jsp">차 트</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="about.jsp"> 뉴 스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="board.jsp">게 시 판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="donate.jsp">후 원</a>
                </li>
                <form class="form-inline">
                  <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button>
                </form>
              </ul>
              <%
	member loginMember = null;
	if (session.getAttribute("loginMember") != null) {
  	loginMember = (member)session.getAttribute("loginMember");}
%>
<% if(loginMember==null) {%>
<!--login section -->
<nav class="cd-main-nav js-main-nav">
	<ul class="cd-main-nav__list js-signin-modal-trigger">
		<!-- inser more links here -->
		<li><a class="cd-main-nav__item cd-main-nav__item--signin" href="#0" data-signin="login">로그인</a></li>
		<li><a class="cd-main-nav__item cd-main-nav__item--signup" href="#0" data-signin="signup">회원가입</a></li>
	</ul>
		</nav>
    <div class="cd-signin-modal js-signin-modal"> <!-- this is the entire modal form, including the background -->
      <div class="cd-signin-modal__container"> <!-- this is the container wrapper -->
        <ul class="cd-signin-modal__switcher js-signin-modal-switcher js-signin-modal-trigger">
          <li><a href="#0" data-signin="login" data-type="login">로그인</a></li>
          <li><a href="#0" data-signin="signup" data-type="signup">회원가입</a></li>
        </ul>
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="login"> <!-- log in form -->
          <form class="cd-signin-modal__form" action="LoginCon" method="post">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--id cd-signin-modal__label--image-replace" for="signin-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-id" name="signin_id" type="text" placeholder="ID">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signin-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-password" name="signin_pw" type="text"  placeholder="Password">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input type="checkbox" id="remember-me" checked class="cd-signin-modal__input ">
              <label for="remember-me">Remember me</label>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width" type="submit" value="로그인">
            </p>
          </form>
          
          <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="reset">비밀번호를 잊어버리셨나요??</a></p>
        </div> <!-- cd-signin-modal__block -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="signup"> <!-- sign up form -->
          <form class="cd-signin-modal__form" action="JoinCon" method="post">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" name="signup_id" type="text" placeholder="ID"  onchange="joinform_check()">
              
              <!-- id check start -->
         
             <!-- id check end -->
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
            
  
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-password" name="signup_pw" type="text"  placeholder="Password">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" name="signup_username" type="text" placeholder="Username">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" name="signup_email" type="email" placeholder="E-mail">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input type="checkbox" id="accept-terms" class="cd-signin-modal__input ">
              <label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit"  value="회원가입">
            </p>
          </form>
        </div> <!-- cd-signin-modal__block -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="reset"> <!-- reset password form -->
          <p class="cd-signin-modal__message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>
  
          <form class="cd-signin-modal__form">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="reset-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="reset-email" type="email" placeholder="E-mail">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="Reset password">
            </p>
          </form>
  
          <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="login">다시 로그인 페이지로</a></p>
        </div> <!-- cd-signin-modal__block -->
        <a href="#0" class="cd-signin-modal__close js-close">Close</a>
      </div> <!-- cd-signin-modal__container -->
    </div> <!-- cd-signin-modal -->
  
<!-- login section end -->
<%}else {%> 
 	<nav class="cd-main-nav js-main-nav">
	<ul class="cd-main-nav__list js-signin-modal-trigger">
		<!-- inser more links here -->
		<li><a class="cd-main-nav__item cd-main-nav__item--signin" href="LogoutCon" data-signin="login">로그아웃</a></li>
		<li><a class="cd-main-nav__item cd-main-nav__item--signup" href = "#0" data-signin="signup">개인정보</a></li>
	</ul>
	<div class="cd-signin-modal js-signin-modal"> <!-- this is the entire modal form, including the background -->
      <div class="cd-signin-modal__container"> <!-- this is the container wrapper -->
          <a href="#0" data-signin="signup" data-type="signup">개인정보</a>
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="signup"> <!-- sign up form -->
          <form class="cd-signin-modal__form" action="UpdateCon" method="post">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" name="update_id" type="text" readonly="readonly"placeholder="" >
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-password" name="update_pw" type="text"  placeholder="Password">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" name="update_username" type="text" placeholder="Username">
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" name="update_email" type="email" placeholder="E-mail">
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit"  value="개인정보 수정">
            </p>
          </form>
        </div> <!-- cd-signin-modal__block -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="reset"> <!-- reset password form -->
          <p class="cd-signin-modal__message">회원 탈퇴를 하시겠습니까? 하단에 해당 회원의 비밀번호를 입력해주세요.</p>
  
          <form class="cd-signin-modal__form">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="delete-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="delete-password"name="delete_password" type="password" placeholder="Password">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="탈퇴">
            </p>
          </form>
        </div> <!-- cd-signin-modal__block -->
        <a href="#0" class="cd-signin-modal__close js-close">Close</a>
      </div> <!-- cd-signin-modal__container -->
    </div> <!-- cd-signin-modal --> 
<%};%>
            </div>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->
</div>
  
  <br>
	<!-- 기사 섹션 -->
	<div style="width: 70%; margin:0 auto;">
		<h1 class="fw-bolder mb-1" style="font-size: 28px">${news.NEWS_SEQ} | ${news.NEWS_TITLE}</h1>
		<br>
		<span style="font-size: 15px" class="text-muted fst-italic mb-2">작성일자: ${news.NEWS_AT}</span>
		<br><br>
		<span style="font-size: 15px" class="text-muted fst-italic mb-2">${news.NEWS_PRESS}</span>
		<div></div>
		<span style="font-size: 15px" class="text-muted fst-italic mb-2">${news.NEWS_TAG}</span>
		<br>
		<span style="font-size: 15px" class="text-muted fst-italic mb-2">키워드: ${news.NEWS_KEYWORD}</span>
		<hr>
		<section class="mb-5">
			
		</section>
		<div class="card w-100 mx-auto">
			<div class="card-body" style="width: 100%">

				<p class="card-title" style="font-size: 20px; width: 100%"></p>
    			<img src="${news.NEWS_PIC}" alt="뉴스 이미지" style="width: 100%">
    			<br><br>
				    <pre class="card-title" style="font-size: 15px; width: 100%"> 
				      ${news.NEWS_CONTENT}
				    </pre>
			</div>
		</div>	
		<hr>
		    <hr>
    <section class="mb-5">
        <!-- 댓글 목록을 보여주는 부분 -->
		<%
	    newscmtDAO dao = new newscmtDAO(); // 댓글 DAO 객체 생성
	    int news_seq = Integer.parseInt(request.getParameter("NEWS_SEQ"));
	    List<newscmt> commentList = dao.getCommentsByNewsSeq(news_seq);
	    pageContext.setAttribute("commentList", commentList); 
		%>

        <h3>댓글 목록</h3><br><br>
        <c:if test="${not empty commentList}">
        <c:forEach var="comment" items="${commentList}">
        	<span class="card-text">${comment.id}</span>
        	
			<span style="text-align: right">${comment.cmt_at}</span>
            <div class="card mb-2">
                <div class="card-body">
                    <p class="card-text">${comment.cmt_content}</p>
                </div>
            </div>
            <div style="text-align: right">
	    	    <button class="edit-btn" data-cmtseq="${comment.cmt_seq}" data-cmtcontent="${comment.cmt_content}">수정</button>
	            <button class="delete-btn" data-cmtseq="${comment.cmt_seq}">삭제</button>
            </div>
        </c:forEach>
        </c:if>
    </section>

    <hr>

    <!-- 댓글 작성 폼 -->
    <h3>댓글 작성</h3>
    <form action="newscmtCon" method="post">
        <input type="hidden" name="action" value="addComment">
        <input type="hidden" name="news_seq" value="${news.NEWS_SEQ}">
        <input type="hidden" name="id" value="${loginMember.id}">
        <div class="form-group">
            <textarea class="form-control" name="cmt_content" rows="3" placeholder="댓글을 입력해주세요"></textarea>
        </div>
        <button type="submit" class="btn btn-primary">댓글 작성</button>
    </form>

    <hr>
		<a href="javascript:history.back()" class="btn btn-primary"> << Back</a>
		
	</div>
	
  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="https://html.design/">Free Html Templates</a>
      </p>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!--  OwlCarousel 2 - Filter -->
  <script src="https://huynhhuynh.github.io/owlcarousel2-filter/dist/owlcarousel2-filter.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <!-- sejin js -->
  <script src="js/sejin.js"></script>
<script>
    const editButtons = document.querySelectorAll(".edit-btn");
    const deleteButtons = document.querySelectorAll(".delete-btn");

    editButtons.forEach(button => {
        button.addEventListener("click", () => {
            const cmtSeq = button.getAttribute("data-cmtseq");
            const cmtContent = button.getAttribute("data-cmtcontent");
            const loginMember = "${sessionScope.loginMember}"; // JSP 코드로 세션에 저장된 사용자 ID 가져오기

            if (loginMember) {
                const newContent = prompt("댓글을 수정해주세요:", cmtContent);

                if (newContent !== null) {
                    // 서블릿으로 수정 요청을 보내는 코드 추가
                    const encodedNewContent = encodeURIComponent(newContent);
                    const form = document.createElement("form");
                    form.method = "POST";
                    form.action = "newscmtCon";
                    const actionInput = document.createElement("input");
                    actionInput.type = "hidden";
                    actionInput.name = "action";
                    actionInput.value = "updateComment";
                    const cmtSeqInput = document.createElement("input");
                    cmtSeqInput.type = "hidden";
                    cmtSeqInput.name = "cmt_seq";
                    cmtSeqInput.value = cmtSeq;
                    const newContentInput = document.createElement("input");
                    newContentInput.type = "hidden";
                    newContentInput.name = "new_content";
                    newContentInput.value = newContent;
                    const loginMemberInput = document.createElement("input");
                    loginMemberInput.type = "hidden";
                    loginMemberInput.name = "id";
                    loginMemberInput.value = loginMember;
                    form.appendChild(actionInput);
                    form.appendChild(cmtSeqInput);
                    form.appendChild(newContentInput);
                    form.appendChild(loginMemberInput); // 사용자 ID 추가
                    document.body.appendChild(form);
                    form.submit();
                }
            } else {
                alert("로그인 후에 수정할 수 있습니다.");
            }
        });
    });


    deleteButtons.forEach(button => {
        button.addEventListener("click", () => {
            const cmtSeq = button.getAttribute("data-cmtseq");
            const loginMember = "${sessionScope.loginMember}"; // JSP 코드로 세션에 저장된 사용자 ID 가져오기

            if (loginMember) {
                const confirmDelete = confirm("정말 삭제하시겠습니까?");

                if (confirmDelete) {
                    // 서블릿으로 삭제 요청을 보내는 코드 추가
                    const form = document.createElement("form");
                    form.method = "POST";
                    form.action = "newscmtCon";
                    const actionInput = document.createElement("input");
                    actionInput.type = "hidden";
                    actionInput.name = "action";
                    actionInput.value = "deleteComment";
                    const cmtSeqInput = document.createElement("input");
                    cmtSeqInput.type = "hidden";
                    cmtSeqInput.name = "cmt_seq";
                    cmtSeqInput.value = cmtSeq;
                    form.appendChild(actionInput);
                    form.appendChild(cmtSeqInput);
                    document.body.appendChild(form);
                    form.submit();
                }
            } else {
                alert("로그인 후에 삭제할 수 있습니다.");
            }
        });
    });
</script>
  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  
  <script src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!--  OwlCarousel 2 - Filter -->
  <script src="https://huynhhuynh.github.io/owlcarousel2-filter/dist/owlcarousel2-filter.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>
  <script src="./js/main.js"></script>
  <script src="js/placeholders.min.js">

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.smhrd.domain.WebBoard" %>
<%@ page import="com.smhrd.domain.WebBoardDAO" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8" />
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
 <meta name="description" content="" />
 <meta name="author" content="" />
<title>게시판</title>

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
  <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="css/l_style.css"> <!-- Resource style -->
	<link rel="stylesheet" href="css/demo.css"> <!-- Demo style -->
</head>
<body>
 <%
        String ID = null;
        if(session.getAttribute("ID") != null) {
            ID = (String) session.getAttribute("ID"); //로그인한 사람들은 해당아이디가 userID에 저장
        }

        if (ID == null) {//로그인이 안됐을 경우
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.')");
            script.println("location.href = 'kakaologin.html'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }
        int WB_SEQ = 0; // 게시글 번호
        if (request.getParameter("WB_SEQ") != null) {
        	WB_SEQ = Integer.parseInt(request.getParameter("WB_SEQ"));//게시글 번호 받아오기
        }
        if (WB_SEQ == 0) {//게시글이 존재하지 않는 다는 얘기
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.')");
            script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }
        //현재 작성한 글이 작성한 본인이 한건지 확인
        WebBoard WebBoard = new WebBoardDAO().getWebBoard(WB_SEQ);
        if (!ID.equals(WebBoard.getID())) { // !userID세션값과 bbs.getUserID 작성한사람 동일한지
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 업습니다.')");
            script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
            script.println("</script>");
        }
    %>
<body class="sub_page">

  <div class="hero_area">
    <!-- header section strats -->
    <header class="header_section">
      
      <div class="header_bottom">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.html">
              <img src="images/logo.png" alt="">
            </a>
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="index.html">홈 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="service.html">차 트</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.jsp"> 뉴 스</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="board.jsp">게 시 판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="testimonial.html">후 원</a>
                </li>
                <form class="form-inline">
                  <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button>
                </form>
              </ul>
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
      <form class="cd-signin-modal__form">
        <p class="cd-signin-modal__fieldset">
          <label class="cd-signin-modal__label cd-signin-modal__label--id cd-signin-modal__label--image-replace" for="signin-id">ID</label>
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-id" type="text" placeholder="ID">
          <span class="cd-signin-modal__error">Error message here!</span>
        </p>

        <p class="cd-signin-modal__fieldset">
          <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signin-password">Password</label>
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-password" type="text"  placeholder="Password">
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
      <form class="cd-signin-modal__form">
        <p class="cd-signin-modal__fieldset">
          <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" type="text" placeholder="ID">
          <a href="#0" class="cd-signin-modal__check_id" onclick="alert">중복조회</a>
          <!-- 비동기 방식으로 중복확인 만들것 -->
          <span class="cd-signin-modal__error">Error message here!</span>
        </p>
        

        <p class="cd-signin-modal__fieldset">
          <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-password" type="text"  placeholder="Password">
          <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
          <span class="cd-signin-modal__error">Error message here!</span>
        </p>

        <p class="cd-signin-modal__fieldset">
          <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" type="email" placeholder="E-mail">
          <span class="cd-signin-modal__error">Error message here!</span>
        </p>

        <p class="cd-signin-modal__fieldset">
          <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-tel">Tel</label>
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-tel" type="tel" placeholder="Tel">
          <span class="cd-signin-modal__error">Error message here!</span>
        </p>

        <p class="cd-signin-modal__fieldset">
          <input type="checkbox" id="accept-terms" class="cd-signin-modal__input ">
          <label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
        </p>

        <p class="cd-signin-modal__fieldset">
          <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="Create account">
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
<script src="js/placeholders.min.js"></script> <!-- polyfill for the HTML5 placeholder attribute -->
<script src="js/main.js"></script> <!-- Resource JavaScript -->
<!-- login section end -->
        </div>
      </nav>
    </div>
  </div>
</header>
<!-- end header section -->
            </div>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->
  </div>
  
  
  
  
   <div class = "container">
        <div class="row">
            <form method="post" action="updateAction.jsp?WB_SEQ=<%=WB_SEQ%>">
                <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                    <thead>
                        <tr>
                            <th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <tr>
                            <td><input type="text" class="form-control" placeholder="글 제목" name="WB_TITLE" maxlength="600" value="<%=WebBoard.getWB_TITLE() %>"></td>
                        </tr>
                        <tr>
                            <td><textarea class="form-control" placeholder="글 내용" name="WB_CONTENT" maxlength="4000" style="height: 350px;"><%=WebBoard.getWB_CONTENT() %></textarea></td>
                        </tr>
                    </tbody>
                </table>
                <input type="submit" class="btn btn-primary pull-right" value="글수정">
            </form>
        </div>
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
</body>
</html>
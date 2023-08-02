<%@page import="com.smhrd.domain.member"%>
<%@page import="com.smhrd.domain.News"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.NewsDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<c:set var="cnt" value="0"/>
<!DOCTYPE html>
<html>
<%
	NewsDAO dao = new NewsDAO();
	List<News> newsList = dao.getAll();
	pageContext.setAttribute("newsList", newsList);
%>
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

  <title>전참시</title>


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
<script src="js/placeholders.min.js"></script> <!-- polyfill for the HTML5 placeholder attribute -->
<script src="js/main.js"></script> <!-- Resource JavaScript -->
  
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
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->
  </div>


  <!-- about section -->
	<div class="container w-75 mt-5 mx-auto">
        <h2>뉴스 목록</h2>
        <hr>
    <ul class="list-group">
        <% int pageSize = 20; %>
        <% int currentPage = (request.getParameter("page") == null) ? 1 : Integer.parseInt(request.getParameter("page")); %>
        <% int totalNewsCount = dao.getTotalNewsCount(); %>
        <% int totalPages = (totalNewsCount + pageSize - 1) / pageSize; %>
        <% int startIndex = (currentPage - 1) * pageSize; %>
        <% int endIndex = Math.min(currentPage * pageSize, totalNewsCount); %>
        <%
        pageContext.setAttribute("pageSize", pageSize);
        pageContext.setAttribute("currentPage", currentPage);
        pageContext.setAttribute("totalNewsCount", totalNewsCount);
        pageContext.setAttribute("totalPages", totalPages);
        pageContext.setAttribute("startIndex", startIndex);
        pageContext.setAttribute("endIndex", endIndex);
        
        %>
        <c:forEach var="cnt" begin="0" end="19">
            <%-- Calculate the index of the news in the newsList --%>
            <c:set var="index" value="${startIndex + cnt}" />
            <%-- Get the news object from the newsList using the calculated index --%>
            <c:set var="news" value="${newsList[index]}" />
            
            <li class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                <a href="news.nhn?action=getNews&NEWS_SEQ=${news.NEWS_SEQ}" class="text-decoration-none">
                    [${news.NEWS_SEQ},${news.NEWS_PRESS}] ${news.NEWS_TITLE}, ${news.NEWS_AT}]
                </a>
            </li>
        </c:forEach>
    </ul>
    <hr>
    
    <!-- 페이지 링크를 추가합니다 -->
    <div class="pagination mt-3" style="height:20px">
        <%-- newsList가 비어있지 않은 경우에만 페이지 목록 버튼을 생성합니다 --%>
<c:if test="${not empty newsList}">
    <c:if test="${currentPage > 1}">
        <a href="?page=1" class="btn btn-sm btn-outline-primary">처음</a>
        <a href="?page=${currentPage - 1}" class="btn btn-sm btn-outline-primary">&laquo; 이전</a>
    </c:if>
    
    <c:forEach var="pageNumber" begin="1" end="${totalPages}" step="1" varStatus="status">
        <c:choose>
            <c:when test="${pageNumber eq currentPage}">
                <a href="?page=${pageNumber}" class="btn btn-sm btn-primary">${pageNumber}</a>
            </c:when>
            <c:otherwise>
                <a href="?page=${pageNumber}" class="btn btn-sm btn-outline-primary">${pageNumber}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    
    <c:if test="${currentPage < totalPages}">
        <a href="?page=${currentPage + 1}" class="btn btn-sm btn-outline-primary">다음 &raquo;</a>
        <a href="?page=${totalPages}" class="btn btn-sm btn-outline-primary">마지막</a>
    </c:if>
</c:if>
        
    </div><%-- /pagination mt-3 --%>
        		<div class="collapse" id="addForm">
			<div class="card card-body">
				<form method="post" action="/jwbook/news.nhn?action=addNews"
				enctype="multipart/form-data">
					<label class="form-label">제목</label>
					<input type="text" name="NEWS_TITLE" class="form-control">
					<label class="form-label">언론사</label>
					<input type="text" name="NEWS_PRESS" class="form-control">
					<label class="form-label">기자</label>
					<input type="text" name="NEWS_REPORTER" class="form-control">
					<label class="form-label">날짜</label>
					<input type="text" name="NEWS_AT" class="form-control">
					<label class="form-label">기사 내용</label>
					<textarea cols="50" rows="5" name="NEWS_CONTENT" class="form-control"></textarea>
					<button type="submit" class="btn btn-success mt-3">저장</button>
				</form>
			</div><%-- /card card-body --%>
        </div><%-- /collapse --%>
</div><%-- /container w-75 mt-5 mx-auto --%>

          <!-- 뉴스 통계 시작 -->
<div style="height: 50px; width: 80%; margin: auto;">
    <button id="newsButton" style="width: 33.333%; height: 100%; float: left">월별 기사 수</button>
    <button id="keyButton" style="width: 33.333%; height: 100%;">주요 키워드</button>
    <button id="wordButton" style="width: 33.333%; height: 100%; float: right">워드클라우드</button>
</div>

<div id="iframeContainer" style="height: 500px; width: 80%; display: none; margin: auto;">
    <iframe id="myIframe" src="news_count.html" style="width: 100%; height: 100%;" frameborder="0"></iframe>
</div>

<div id="iframeContainer2" style="height: 500px; width: 80%; display: none; margin: auto;">
    <iframe id="myIframe2" src="keyword_count.html" style="width: 100%; height: 100%;" frameborder="0"></iframe>
</div>

<div id="imgContainer" style="height: 500px; width: 80%; display: none; margin: auto;">
    <iframe id="myIframe3" src="wordcloud.html" style="width: 100%; height: 100%;" frameborder="0"></iframe>
</div>

          <!-- 뉴스 통계 끝 -->
  
  <!-- end about section -->


  <!-- info section -->
  <section class="info_section ">
    <div class="container">
      <div class="info_bottom">
        <div class="row">
          <div class="col-md-2">
            <div class="info_logo">
              <a href="">
                <!-- 로고변경 -->
                <img src="images/logo2.png" alt="">
              </a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>
  <!-- end info_section -->

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

</body>

</html>

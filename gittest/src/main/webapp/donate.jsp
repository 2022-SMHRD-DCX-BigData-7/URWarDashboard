<%@page import="com.smhrd.domain.memberDAO"%>
<%@page import="com.smhrd.domain.member"%>
<%@page import="com.smhrd.domain.donate"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.donateDAO"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


  <title>전참시</title>  
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

  <!--owl slider stylesheet -->
  <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

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
  
  <!--본문 css  -->
  <link href="css/donate.css" rel="stylesheet" />

</head>

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

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
              aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav  ">
                <li class="nav-item ">
                  <a class="nav-link" href="index.jsp">홈 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="service.jsp">차 트</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.jsp">뉴 스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="board.jsp">게 시 판</a>
                </li>
                <li class="nav-item active">
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
  	loginMember = (member)session.getAttribute("loginMember");
  	}
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
  <!-- 로그인 -->
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
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width" type="submit" value="로그인">
            </p>
          </form>
          
          <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="search-id">아이디 / </a><a href="#0" data-signin="search-pw">비밀번호를 잊어버리셨나요?</a></p>
        </div> <!-- cd-signin-modal__block -->
        
	<!-- 회원가입 -->
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="signup" name="signup"> <!-- sign up form -->
          <form class="cd-signin-modal__form" action="JoinCon" method="post">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" name="signup_id" type="text" placeholder="ID" >
              
              <a href="javascript:alert('<%
            		  
            		request.setCharacterEncoding("UTF-8");
            		String id = request.getParameter("signup_id");
            		
            		member mid = new member(id);
            		memberDAO dao = new memberDAO();
            		member duplicate = dao.idselectMember(mid);
            		System.out.print(id);
              		 
              		if(duplicate==null){
              			out.print("사용 가능한 아이디 입니다.");
          		  }else{out.print("사용 불가능한 아이디 입니다. 다른 아이디를 입력해 주십시오.");}
            		  
            		  
            		  %>');" 
              style="display: inline-block;
    				position: absolute;
    				right: 0;
				    top: 0;
				    padding: 6px 15px;
				    border-left: 1px solid #d2d8d8;
				    top: 50%;
				    bottom: auto;
				    -webkit-transform: translateY(-50%);
				    -ms-transform: translateY(-50%);
				    transform: translateY(-50%);
				    font-size: 1.4rem;
				    color: #343642;"
              >중복확인</a>
              
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
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit"  value="회원가입">
            </p>
          </form>
        </div> <!-- cd-signin-modal__block -->
  
  <!-- 아이디 검색  -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="search-id"> <!-- reset password form -->
          <p class="cd-signin-modal__message">사용자의 이름과 이메일 주소를 입력하여 주십시오.</p>
  
          <form class="cd-signin-modal__form" action="IdSearchCon" method="post">

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="search-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" name="search_username" type="text" placeholder="Username">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="search-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" name="search_email" type="email" placeholder="E-mail">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="아이디 찾기">
            </p>
          </form>
          <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="login">다시 로그인 페이지로</a></p>
        </div> <!-- cd-signin-modal__block -->
         
         <!--비밀번호 검색  -->
          
          <div class="cd-signin-modal__block js-signin-modal-block" data-type="search-pw"> <!-- reset password form -->
          <p class="cd-signin-modal__message">사용자의 아이디와 이름, 이메일 주소를 입력하여 주십시오.</p>
  
          <form class="cd-signin-modal__form" action="PwSearchCon" method="post">
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" name="search_id" type="text" placeholder="ID" >
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" name="search_username" type="text" placeholder="Username">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" name="search_email" type="email" placeholder="E-mail">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="비밀번호 찾기">
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
		<li><a class="cd-main-nav__item cd-main-nav__item--signin" href="#0" data-signin="login">로그아웃</a></li>
		<li><a class="cd-main-nav__item cd-main-nav__item--signup" href="#0" data-signin="signup">개인정보</a></li>
	</ul>
		</nav>
    <div class="cd-signin-modal js-signin-modal"> <!-- this is the entire modal form, including the background -->
      <div class="cd-signin-modal__container"> <!-- this is the container wrapper -->
        <ul class="cd-signin-modal__switcher js-signin-modal-switcher js-signin-modal-trigger">
          <li><a href="#0" data-signin="login" data-type="login">로그아웃</a></li>
          <li><a href="#0" data-signin="signup" data-type="signup">개인정보</a></li>
        </ul>
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="login"> <!-- log in form -->
          <form class="cd-signin-modal__form" action="LogoutCon" method="post">
  			<p align="center">
            	<span>로그아웃 하시겠습니까?</span>
            </p>
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width" type="submit" value="로그아웃">
            </p>
          </form>
          
        </div> <!-- cd-signin-modal__block -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="signup"> <!-- sign up form -->
          <form class="cd-signin-modal__form" action="UpdateCon" method="post">
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" name="update_id" type="text" readonly="readonly"
              placeholder="<%
            String id = loginMember.getId();
            out.print(id); %>" >
            
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-password" name="update_pw" type="text"  
              placeholder="Password">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" name="update_username" type="text" 
              placeholder="<%
            String userid = loginMember.getUsername();
            out.print(userid); %>" >
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" name="update_email" type="email" 
              placeholder="<%
            String email = loginMember.getEmail();
            out.print(email); %>" >
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit"  value="개인정보 수정">
            </p>
          </form>
   <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="reset">회원탈퇴</a></p>
          
        </div> <!-- cd-signin-modal__block -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="reset"> <!-- reset password form -->
          <p class="cd-signin-modal__message">회원 탈퇴를 하시겠습니까? 하단에 해당 회원의 비밀번호를 입력해주세요.</p>
  
          <form class="cd-signin-modal__form" action="DeleteCon" method="post">
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
	
<%}%>
            </div>
          </nav>
        </div>
      </div>
    </header>
    <!-- end header section -->
  </div>
  <!-- donation section -->
  	<br>
  	<div class="img-wrap">
  		<div class="img">
  		<img src="https://d2k5miyk6y5zf0.cloudfront.net/article/MYH/20220603/MYH20220603013100038.jpg">
  		</div>
  		<div class="txt">
		<h1 class="redtext"> 여전히 우크라이나는 전쟁중입니다</h1>
		<br><br>
		<h1 class="whitetext">
		아무리 시대가 최첨단의 시대를 달려가도 지상전은 여전히 존재하고 전쟁의 피해는 고스란히 힘겨운 사람들의 몫으로 남습니다.<br>
		우크라이나 전쟁난민이 여기저기 있습니다. 함께나누는세상은 우크라이나 전쟁난민을 위해 보온물병을 지원하였습니다.<br> 
		앞으로 더욱 많은 사람들에게 다양한 생필품을 지원할 수 있도록 여러분의 도움을 부탁드립니다.</h1>
		</div>
	</div>

	<div style="overflow: auto;" class="donate_list">
		<div class="banner">
			<a href="https://www.unhcr.or.kr/ukraine-emergency/">
				<img src="https://d32gkk464bsqbe.cloudfront.net/company-profiles/o/e445022d6e803b97576f5782364935eb64aa5e74.jpeg?v=6.8.8" width="100%" height="100%">
				<p>UNHCR(유엔난민기구)</p>
			</a>
		</div>
		<div class="banner">
			<a href="https://www.redcross.or.kr/donation_campaign/togetherofhumanity/index.htm">
				<img src="https://blog.kakaocdn.net/dn/da5px0/btqxXKEWwmb/Jug7fCc3agPTLo0X18KYr0/img.jpg" width="100%" height="100%">
				<p>대한적십자사</p>
			</a>
		</div>
		<div class="banner">
			<a href="https://happybean.naver.com/search">
				<img src="https://www.webeconomy.co.kr/data/photos/20221252/art_16722802285065_b3d71d.png" width="100%" height="100%">
				<p>해피빈</p>
			</a>
		</div>
		<div class="banner">
			<a href="https://www.rescue.org/kr/article/ukraine-war-one-year-irc-support?&utm_source=naver-pc&utm_medium=searchAD&utm_campaign=ukraine1&utm_content=searchAD&utm_term=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_media=27758&n_query=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_rank=1&n_ad_group=grp-a001-01-000000034525542&n_ad=nad-a001-01-000000250011766&n_keyword_id=nkw-a001-01-000005371952437&n_keyword=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_campaign_type=1&n_ad_group_type=1&NaPm=ct%3Dlkuqf5i0%7Cci%3D0zG0002JdGHyd2islvmC%7Ctr%3Dsa%7Chk%3Da48e646f7c2ddbba7ec47863ee01a5ca91f72c2c">
				<img src="https://www.rescue.org/sites/default/files/2022-09/og-image-default.jpeg" width="100%" height="100%">
				<p>International Rescue Committee</p>
			</a>
		</div>		
		<div class="banner">
			<a href="https://samaritanspurse.or.kr/gift-giving/ukraine-story/?utm_source=naver&utm_medium=keyword&utm_campaign=Ukraine_2023&NaPm=ct%3Dlkuqfa4o%7Cci%3D0yK0002PdGHyqapSLvpO%7Ctr%3Dsa%7Chk%3D6a4d438de5bb0da0c784b153adc94380b0484d8a">
				<img src="https://cdn-j.samaritanspurse.or.kr/wp-content/uploads/2021/06/SP_Korea_logo_horz_rgb-1024x210.png" width="100%" height="100%">
				<p>사마리안퍼스 코리아</p>
			</a>
		</div>
		<div class="banner">
			<a href="https://www.worldvision.or.kr/campaign/wv/wv_ver01.asp?key=22_SBShopeTV&utm_source=naver&utm_medium=searchad&utm_campaign=searchad&utm_term=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&mcode=2889&n_media=27758&n_query=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_rank=4&n_ad_group=grp-a001-01-000000026800118&n_ad=nad-a001-01-000000238246081&n_keyword_id=nkw-a001-01-000004497247501&n_keyword=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_campaign_type=1&n_ad_group_type=1&NaPm=ct%3Dlkuqfwi8%7Cci%3D0yC0003gdGHyPMUP4fj3%7Ctr%3Dsa%7Chk%3D3ce6f676c1465bdb136b59febda4c43afcc7583a">
				<img src="https://m.worldvision.or.kr/images/common/thumb_vi.png?v=1709" width="100%" height="100%">
				<p>월드비전</p>
			</a>
		</div>
		<div class="banner">
			<a href="https://www.kfhi.or.kr/support/campaign/782">
				<img src="https://hope.kfhi.or.kr/upload_file/biz/%EB%A1%9C%EA%B3%A0_%ED%9D%AC%EB%A7%9D%EC%B9%9C%EA%B5%AC%EA%B8%B0%EC%95%84%EB%8C%80%EC%B1%85CI%EA%B5%AD%EB%AC%B8%EA%B5%AD%EB%AC%B8%EC%8A%AC%EB%A1%9C%EA%B1%B4_10(5).png" width="100%" height="100%">
				<p>희망친구 기아대책</p>
			</a>
		</div>
		<div class="banner">
			<a href="https://www.sc.or.kr/saveone2/?utm_source=naver_pc&utm_medium=paid_search&utm_campaign=saveone2&utm_content=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98&utm_term=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&BSCPN=SC_PC&n_media=27758&n_query=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_rank=8&n_ad_group=grp-a001-01-000000025990313&n_ad=nad-a001-01-000000172668813&n_keyword_id=nkw-a001-01-000004372282478&n_keyword=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&n_campaign_type=1&n_ad_group_type=1&NaPm=ct%3Dlkuqgw00%7Cci%3D0yu00000dWHyxDpHcvm3%7Ctr%3Dsa%7Chk%3D3f6a6bc39908011886e81d1aa10d39356a87dcbe">
				<img src="https://yt3.googleusercontent.com/Qc7CJtJnZTIBPsUh9mtszYmMqMQ9FZr72u47fYl5AfUm-eKe3-424zrohxGZEVVLKkEi7t13=s900-c-k-c0x00ffffff-no-rj" width="100%" height="100%">
				<p>세이브더칠드런</p>
			</a>
		</div>					
		<div class="banner">
			<a href="https://bethere.amnesty.or.kr/Ukrainecrisis?utm_source=naver&utm_medium=cpc&utm_campaign=brand&utm_content=21.%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98_PC&utm_term=%EC%9A%B0%ED%81%AC%EB%9D%BC%EC%9D%B4%EB%82%98%ED%9B%84%EC%9B%90&NaPm=ct%3Dlkuqhseo%7Cci%3D0z40000EdWHyeWuuMLot%7Ctr%3Dsa%7Chk%3Daf39edc764a995e2d8e7cec5761d0f11fadd311c">
				<img src="https://www.nanumkorea.go.kr/gibuwas/upload/2021/12/01/20211201_20aa1316-54f1-4a7d-bab2-ae27c2202d37_s.png" width="100%" height="100%">
				<p>국제앰네스티</p>
			</a>
		</div>				
	</div>

  <!-- end donation section -->


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
  <section class="footer_section">
    <div class="container">
      <p>
        &copy; <span id="displayYear"></span> All Rights Reserved By
        <a href="https://html.design/">Free Html Templates</a>
      </p>
    </div>
  </section>
  <!-- footer section -->

  <!-- jQery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
  </script>
  <!-- bootstrap js -->
  <script type="text/javascript" src="js/bootstrap.js"></script>
  <!-- owl slider -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
  </script>
  <!--  OwlCarousel 2 - Filter -->
  <script src="https://huynhhuynh.github.io/owlcarousel2-filter/dist/owlcarousel2-filter.min.js"></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/custom.js"></script>
  <script src="./js/main.js"></script>
     <script src="js/placeholders.min.js"></script>

</body>


</html>
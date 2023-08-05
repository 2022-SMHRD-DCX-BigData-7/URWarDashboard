<%@page import="com.smhrd.domain.memberDAO"%>
<%@page import="com.smhrd.domain.member"%>
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
  <link href="css/font-awesome.min.css" rel="stylesheet">

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

<body  class="sub_page">

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
                <li class="nav-item">
                  <a class="nav-link" href="index.jsp">홈 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="service.jsp">차 트</a>
                </li>
                <li class="nav-item">
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
          <form class="cd-signin-modal__form" action="LoginCon" method="post" >
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--id cd-signin-modal__label--image-replace" for="signin-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-id" name="signin_id" type="text" placeholder="ID" oninput="return validateForm()">
               <div class="error-message" id="id-error"></div>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signin-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-password" name="signin_pw" type="text"  placeholder="Password" oninput="return validateForm()">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
               <div class="error-message" id="password-error"></div>
            </p>	
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width" type="submit" value="로그인">
            </p>
            
          </form>
          
          <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="search-id">아이디 / </a><a href="#0" data-signin="search-pw">비밀번호를 잊어버리셨나요?</a></p>
        </div> <!-- cd-signin-modal__block -->
     <style>
  .error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
  }
</style>

<script>
  function validateForm() {
    var id = document.getElementById("signin-id").value.trim();
    var password = document.getElementById("signin-password").value.trim();

    var idErrorDiv = document.getElementById("id-error");
    var passwordErrorDiv = document.getElementById("password-error");

    idErrorDiv.innerHTML = ""; // Clear previous error message
    passwordErrorDiv.innerHTML = ""; // Clear previous error message

    var hasError = false;

    if (id === "") {
      idErrorDiv.innerHTML = "아이디를 입력하여 주십시오.";
      hasError = true;
    }

    if (password === "") {
      passwordErrorDiv.innerHTML = "비밀번호를 입력하여 주십시오.";
      hasError = true;
    }

    return !hasError; // Allow form submission if there are no errors
  }
</script>
        
	<!-- 회원가입 -->
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="signup" name="signup"> <!-- sign up form -->
          <form class="cd-signin-modal__form" action="JoinCon" method="post" >
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-id">ID</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-id" name="signup_id" type="text" placeholder="ID"  oninput="return validateForm2()">
              
              <a href="#" onclick="idcheck()"
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
              
              <div class="error-message" id="sid-error"></div>
              
              <script>
function idcheck() {
    var inputElement = document.getElementById("signup-id");
    var errorElement = document.getElementById("sid-error");

    // 아이디 입력값 가져오기
    var signup_id = inputElement.value.trim();

    // AJAX를 이용하여 아이디의 사용 가능성을 확인합니다.
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText.trim() === "unavailable") {
                errorElement.innerHTML = "사용할 수 없는 아이디입니다.";
                errorElement.style.color = "red";
            } else {
                errorElement.innerHTML = "사용할 수 있는 아이디입니다.";
                errorElement.style.color = "green";
            }
        }
    };
    
    // IdCheckCon 서블릿으로 아이디 전송
    xhttp.open("POST", "IdCheckCon", true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("signup_id=" + signup_id);
}
</script>
              
            </p>
            
  
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-password" name="signup_pw" type="text"  placeholder="Password" oninput="return validateForm2()">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
              <div class="error-message" id="spassword-error"></div>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" name="signup_username" type="text" placeholder="Username" oninput="return validateForm2()">
              <div class="error-message" id="susername-error"></div>
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" name="signup_email" type="email" placeholder="E-mail" oninput="return validateForm2()">
              <div class="error-message" id="semail-error"></div>
            </p>
  
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit"  value="회원가입">
            </p>
          </form>
        </div> <!-- cd-signin-modal__block -->
        <style>
  .error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
  }
</style>
  <script>
  function validateForm2() {
    var sid = document.getElementById("signup-id").value.trim();
    var spassword = document.getElementById("signup-password").value.trim();
    var susername = document.getElementById("signup-username").value.trim();
    var semail = document.getElementById("signup-email").value.trim();

    var sidErrorDiv = document.getElementById("sid-error");
    var spasswordErrorDiv = document.getElementById("spassword-error");
    var susernameErrorDiv = document.getElementById("susername-error");
    var semailErrorDiv = document.getElementById("semail-error");

    sidErrorDiv.innerHTML = ""; // Clear previous error message
    spasswordErrorDiv.innerHTML = ""; // Clear previous error message
    susernameErrorDiv.innerHTML = ""; // Clear previous error message
    semailErrorDiv.innerHTML = ""; // Clear previous error message

    var hasError = false;

    if (sid === "") {
      sidErrorDiv.innerHTML = "아이디를 입력하여 주십시오.";
      hasError = true;
    }

    if (spassword === "") {
      spasswordErrorDiv.innerHTML = "비밀번호를 입력하여 주십시오.";
      hasError = true;
    }

    if (susername === "") {
      susernameErrorDiv.innerHTML = "이름을 입력하여 주십시오.";
      hasError = true;
    }

    if (semail === "") {
      semailErrorDiv.innerHTML = "이메일 주소를 입력하여 주십시오.";
      hasError = true;
    }

    return !hasError; // Allow form submission if there are no errors
  }
</script>
  <!-- 아이디 검색  -->
  
        <div class="cd-signin-modal__block js-signin-modal-block" data-type="search-id"> <!-- reset password form -->
          <p class="cd-signin-modal__message">사용자의 이름과 이메일 주소를 입력하여 주십시오.</p>
  
          <form class="cd-signin-modal__form" action="IdSearchCon" method="post">

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="search-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="search-username" name="search_username" type="text" placeholder="Username">
              <span class="cd-signin-modal__error">Error message here!</span>
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="search-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="search-email" name="search_email" type="email" placeholder="E-mail">
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
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="update-id" name="update_id" type="text" readonly="readonly"
              placeholder="<%
            String id = loginMember.getId();
            out.print(id); %>" >
            
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="update-password" name="update_pw" type="text"  
              placeholder="Password" oninput="return validateForm3()">
              <a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
              <div class="error-message" id="upassword-error"></div>
            </p>

            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="update-username" name="update_username" type="text" 
              placeholder="<%
            String username = loginMember.getUsername();
            out.print(username); %>" oninput="return validateForm3()">
            <div class="error-message" id="uusername-error"></div>
            </p>
            
            <p class="cd-signin-modal__fieldset">
              <label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="update-email" name="update_email" type="email" 
              placeholder="<%
            String email = loginMember.getEmail();
            out.print(email); %>"  oninput="return validateForm3()">
            <div class="error-message" id="uemail-error"></div>
            </p>
  
            <p class="cd-signin-modal__fieldset">
              <input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit"  value="개인정보 수정">
            </p>
          </form>
   <p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="reset">회원탈퇴</a></p>
          
        </div> <!-- cd-signin-modal__block -->
        
        <style>
  .error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
  }
</style>
  <script>
  function validateForm3() {
    var upassword = document.getElementById("update-password").value.trim();
    var uusername = document.getElementById("update-username").value.trim();
    var uemail = document.getElementById("update-email").value.trim();

    var upasswordErrorDiv = document.getElementById("upassword-error");
    var uusernameErrorDiv = document.getElementById("uusername-error");
    var uemailErrorDiv = document.getElementById("uemail-error");

    upasswordErrorDiv.innerHTML = ""; // Clear previous error message
    uusernameErrorDiv.innerHTML = ""; // Clear previous error message
    uemailErrorDiv.innerHTML = ""; // Clear previous error message

    var hasError = false;

	
    if (upassword === "") {
      upasswordErrorDiv.innerHTML = "비밀번호를 입력하여 주십시오.";
      hasError = true;
    }

    if (uusername === "") {
      uusernameErrorDiv.innerHTML = "이름을 입력하여 주십시오.";
      hasError = true;
    }

    if (uemail === "") {
      uemailErrorDiv.innerHTML = "이메일 주소를 입력하여 주십시오.";
      hasError = true;
    }

    return !hasError; // Allow form submission if there are no errors
  }
</script>
  
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


  <!-- service section -->
	
	<iframe src="https://public.tableau.com/views/_16905110701730/sheet2?:language=ko-KR&:display_count=n&:showVizHome=no&:embed=true&:origin=viz_share_link" 
	    style="margin-left:2.5%; margin-top:0.5%; width:95%; min-height:650px;"></iframe>

  <!-- end service section -->


    <!-- info section -->
    <section class="info_section ">
      <div class="container">
        <div class="info_bottom">
          <div class="row">
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
  <script src="./js/main.js"></script>
<<<<<<< HEAD
     <script src="js/placeholders.min.js">
=======
  <script src="js/placeholders.min.js"></script>
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-DCX-BigData-7/URWarDashboard.git
  

</body>
</html>
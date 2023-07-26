<%@page import="com.smhrd.domain.News"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.domain.NewsDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 관리 앱</title>
</head>
<body>

	<div class="container w-75 mt-5 mx-auto">
		<h2>${news.NEWS_TITLE}</h2>
		<hr>
		<div class="card w-75 mx-auto">
			<div class="card-body">
				<h4 class="card-title">SEQ: ${news.NEWS_SEQ}</h4>
				<h4 class="card-title">Date: ${news.NEWS_AT}</h4>
				<h4 class="card-title">PRESS: ${news.NEWS_PRESS}</h4>
				<h4 class="card-title"> ${news.NEWS_REPORTER} 기자</h4>
				<h4 class="card-title">원문보기: ${news.NEWS_LINK}</h4>
				<p class="card-text">Content: ${news.NEWS_CONTENT}</p>
			</div>
		</div>	
		<hr>
		<a href="javascript:history.back()" class="btn btn-primary"> << Back</a>
		
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트신청</title>
<script src="${path }/resources/js/jquery-3.3.1.js"></script>
<script src="${path }/resources/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/css/basic.css" rel="stylesheet">
<link href="${path }/resources/css/header.css" rel="stylesheet">
<link href="${path }/resources/css/projectWrite.css" rel="stylesheet">
<script>
	$(function () {
		
	});
</script>
</head>
<body>
<div class="whole-wrapper">
	<header class="header">
		<div class="header-wrapper">
			<div class="header-group">
				<div class="logo"><a href="#">FUNDY</a></div>
					<div><a href="#">후원</a></div>
				<div>
					<a href="#" class="current-div">펀딩</a>
				</div>
				<div>
					<i class="material-icons category-btn">more_horiz</i>
				</div>
			</div>
			<div class="header-group">
				<div>
					<i class="material-icons search-btn">search</i>
					<input type="text" name="search" class="search-bar" placeholder="프로젝트검색">
				</div>
				<div>로그인</div>
				<div class="header-last">회원가입</div>
				<div class="user-btn">
					<img src="resources/images/user_icon.png">
				</div>
			</div>
		</div>
	</header>
	<section class="projectWrite-section">
		<div class="projectWrite-header">프로젝트신청
		</div>
		<div class="projectWrite-nav">
			<div class="nav-selected">프로젝트 개요</div>
			<div>펀딩/리워드/옵션</div>
			<div>프로젝트 소개</div>
			<div>계좌 및 인증</div>
		</div>
		
		<!-- 신청서영역 -->
		<article class="write-detail">
			<div class="write-section">
				<div class="write-category">
					<span></span>
				</div>
				<div class="write-content-block">
					<div>
						
					</div>
					<div>
						
					</div>
				</div>
			</div>
		</article>
		
		
		<article id="write-btn-container">
			<button class="btn btn-secondary write-btn" style="border: 0px;">이전</button>
			<button class="btn btn-primary write-btn" style="background-color: #FF8C00; border: 0px;">임시저장</button>
			<button class="btn btn-primary write-btn" style="background-color: #126196; border: 0px;">다음</button>
		</article>
		
	</section>
</div>
</body>
</html>
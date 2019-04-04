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
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<script src="${path }/resources/js/jquery-3.3.1.min.js"></script>
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/css/basic.css" rel="stylesheet">
<link href="${path }/resources/css/header.css" rel="stylesheet">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
                <div class="login-btn">로그인</div>
                <div class="header-last">회원가입</div>
                <div class="user-btn" >
						<img src="${path }/resources/images/user_icon.png">
                </div>
            </div>
        </div>
    </header>
    <nav class="nav">
        <div><a href="#"><img class="current-category" src="${path }/resources/images/category-sample.jpg">전체보기</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">테크·가전</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">패션·잡화</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">뷰티</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">푸드</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">홈리빙</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">디자인소품</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">여행·레저</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">스포츠</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">게임·취미</a></div>
        <div><a href="#"><img src="${path }/resources/images/category-sample.jpg">출판</a></div>
    </nav>
    

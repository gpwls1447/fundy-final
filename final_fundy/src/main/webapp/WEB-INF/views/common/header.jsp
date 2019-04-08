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
                <div class="logo"><a href="${path }/main.do">FUNDY</a></div>
                <div>
                	<a href="${path }/main.do?majorCode='A02'" class="<c:if test="${majorCategory eq 'A02' }">current-div</c:if>">후원</a>
                </div>
                <div>
                    <a href="${path }/main.do?majorCode='A01'" class="<c:if test="${majorCategory eq 'A01' }">current-div</c:if>">펀딩</a>
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
                
                <c:if test="${loggedMember==null }">
                <div class="header-last login-btn" >
					<img src="${path }/resources/images/user_icon.png">
                </div>
                </c:if>
                
                <c:if test="${loggedMember!=null }">
                <div>${loggedMember.memberNick }님 환영합니다 </div>
                <div class="header-last user-btn" >
						<img src="${path }/resources/images/user_icon.png">
                </div>
                </c:if>
                
            </div>
        </div>
    </header>
    <nav class="nav">
		<div class="nav-wrapper">
			<div><a href="${path }/projectList/projectList.do?majorCode=${majorCategory}"><img class="current-category" src="${path }/resources/images/category-sample.jpg">전체보기</a></div>
		    <c:forEach items="${midCList}" var="mc">
				<c:if test="${mc.majorCode eq majorCategory }">
					<div><a href="${path }/projectList/projectList.do?midCode=${mc.midCode}"><img src="${path }/resources/images/category-sample.jpg">${mc.midName }</a></div>
		    	</c:if>
		    </c:forEach>
    	</div>
    </nav>
    

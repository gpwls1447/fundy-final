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
<title>관리자 페이지</title>
<link href="${path }/resources/css/basic.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<style>
body {
	height: 100%;
	margin: 0;
	background-color: #20262E;
	font-family: 'Noto Sans KR';
	display: flex;
	color: rgba(255, 255, 255, 0.8);
	font-size: 14px;
	min-width: 1005px;
}

.header-section-wrapper {
	width: 100%;
	margin-left: 240px;
	box-sizing: border-box;
}

.header {
	width: 100%;
	height: 100px;
	box-sizing: border-box;
	display: flex;
	align-items: center;
	padding: 20px 20px 10px 10px;
}

.header-wrapper {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.1);
	display: flex;
}

.title {
	height: 100%;
	width: 150px;
	font-size: 21px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.nav {
	box-sizing: border-box;
	position: fixed;
	display: flex;
	flex-flow: column nowrap;
	align-items: center;
	width: 240px;
	height: 100%;
	padding: 20px 10px 20px 20px;
}

.nav-wrapper {
	width: 100%;
	height: 100%;
	border-radius: 5px;
	overflow: hidden;
}

.nav-header {
	height: 70px;
	padding: 0 10px;
	box-sizing: border-box;
	background-color: rgba(255, 255, 255, 0.1);
}

.logo {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 21px;
	font-weight: bold;
}

.nav-body>div {
	padding: 5px 10px;
	background-color: rgba(255, 255, 255, 0.1);
}

.dummy-menu {
	padding: 20px 10px 20px 0;
	border-radius: 10px;
	text-align: center;
	font-weight: bold;
}

.nav-menu {
	cursor: pointer;
}

.nav-menu>div {
	padding: 10px 10px 10px 30px;
	border-radius: 10px;
}

.nav-menu>div:hover {
	color: papayawhip;
	background-color: #20262E;
}

.current-menu>div {
	color: papayawhip;
	background-color: #20262E;
}

.nav-footer {
	height: 100%;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.1);
}

.divider {
	justify-self: flex-end;
	display: block;
	width: 100%;
	height: 1px;
	background-color: #20262E;
	margin-top: -1px;
}

.horizontal-divider {
	display: block;
	width: 1px;
	height: 100%;
	background-color: #20262E;
}

.section {
	box-sizing: border-box;
	width: 100%;
	height: 100%;
	padding: 10px 20px 20px 10px;
}

.section-wrapper {
	box-sizing: border-box;
	width: 100%;
}

.cb {
	display: none;
}

.cb+label:hover {
	background-color: rgba(255, 255, 255, 0.7);
}

.cb+label {
	display: inline-block;
	position: relative;
	width: 23px;
	height: 23px;
	background-color: rgba(255, 255, 255, 0.6);
	cursor: pointer;
	border-radius: 2px;
}

.cb+label span::after {
	position: absolute;
	content: '';
	display: none;
	width: 5px;
	height: 13px;
	border-right: 3px solid black;
	border-bottom: 3px solid black;
	transform: rotateZ(40deg);
	left: 8px;
	top: 1px;
}

.cb:checked+label span::after {
	display: block;
}

.project-table {
	display: flex;
	flex-flow: column nowrap;
	color: #aaa;
}

.project-table-header {
	display: flex;
	font-size: 18px;
	background-color:rgba(200, 200, 200, 0.1);
}

.project-table-header>div {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 15px 0
}

.project-table-header>div>a {
	text-decoration: none;
	color: #ccc;
}

.project-table-header>div:nth-of-type(1) {
	flex: 2 1 0;
}

.project-table-header>div:nth-of-type(2) {
	flex: 1 1 0;
}

.project-table-header>div:nth-of-type(3) {
	flex: 2 1 0;
}

.project-table-header>div:nth-of-type(4) {
	flex: 2 1 0;
}

.project-table-header>div:nth-of-type(5) {
	flex: 1 1 0;
}

.project-table-row {
	display: flex;
	border-bottom: 1px solid #666;
}

.project-table-row>div {
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 20px 0
}

.project-table-row>div:nth-of-type(1) {
	flex: 2 1 0;
}

.project-table-row>div:nth-of-type(2) {
	flex: 1 1 0;
}

.project-table-row>div:nth-of-type(3) {
	flex: 2 1 0;
}

.project-table-row>div:nth-of-type(4) {
	flex: 2 1 0;
}

.project-table-row>div:nth-of-type(5) {
	flex: 1 1 0;
}

.proj-status {
	border-radius: 30px;
	border: none;
	padding: 10px 20px;
}

.project-btn-container {
	margin: 20px 0;
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.project-btn {
	padding: 10px 20px;
	border-radius: 4px;
	border: none;
	margin-left: 10px;
}

.denial-btn {
	background-color: rgb(192, 65, 97);
}

.approve-btn {
	background-color: rgb(39, 174, 96);
}

.open {
	background-color: rgb(39, 174, 96);
}

.finished {
	background-color: rgb(127, 127, 127);
}

.applied {
	background-color: rgb(220, 177, 7);
}

.denied {
	background-color: rgb(192, 65, 97);
}

.admin{
	height:50px;
}

.poroject-table-top {
	width:100%;
	display: flex;
	justify-content: flex-end;
	padding-bottom:20px;
	
}

.orderby {
	width:150px;
	height:30px;
	background-color:rgba(255, 255, 255, 0.1);
	color:white;
}

.orderby option {
	color:black;
}

.admin{
	height:50px;
	cursor: pointer;
}
</style>
</head>
<body>
	<nav class="nav">
		<div class="nav-wrapper">
			<div class="nav-header">
				<div class="logo" onclick="location.href='${path}/main.do';"><img src="${path }/resources/images/adminsenter.png" class="admin"></div>
				<span class="divider"></span>
			</div>
			<div class="nav-body">
				<div class="">
					<div class="dummy-menu">메뉴</div>
				</div>
				<div class="nav-menu">
					<div>메인</div>
				</div>
				<div class="nav-menu current-menu">
					<div>회원</div>
				</div>
				<div class="nav-menu project">
					<div>프로젝트</div>
				</div>
				
				<div>&nbsp;</div>
			</div>
			<div class="nav-footer"></div>
		</div>
	</nav>
	<div class="header-section-wrapper">
		<header class="header">
			<div class="header-wrapper">
				<div class="title">회원정보</div>
			</div>
		</header>
		<section class="section">
			<div class="section-wrapper">
				<div class="poroject-table-top">
					<select class="orderby" name="orderby">
						<option value="enrollDate" ${map['orderby'] =='enrollDate' ? 'selected':'' }>가입날짜 순</option>
						<option value="memberNick" ${map['orderby'] =='memberNick' ? 'selected':'' }>닉네임 순</option>
					</select>
				</div>
				<div class="project-table">
					<div class="project-table-header">
						<div>
							<a href="#">이메일</a>
						</div>
						<div>
							<a href="#">닉네임</a>
						</div>
						<div>
							<a href="#">가입일시</a>
						</div>
						<div>
							<a href="#">탈퇴일시</a>
						</div>
					</div>
					<!-- for문으로 리스트 출력 -->
					
					<c:forEach items="${list}" var="list">
					<div class="project-table-row">

						<div>${list.memberEmail}</div>
						<div>${list.memberNick }</div>
						<div>${list.enrollDate }</div>
						<div>${list.memberQuit }</div>
					</div>
					</c:forEach>
				</div>
			</div>
			${map['pageBar'] }
		</section>
	</div>
</body>
<script>

	$(() => {
		$(".project").on("click", () => {
			location.href="${path}/admin/adminPage.do";
		})
	})
 
	//동적쿼리
	$('.orderby').on('change', function(){
		console.log($('.orderby option:selected').val());
		location.href="${path}/admin/memberListView.do?orderby="+$('.orderby option:selected').val();
	})
</script>
</html>
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
	border-bottom: 1px solid #666;
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
	flex: 1 1 0;
}

.project-table-header>div:nth-of-type(2) {
	flex: 7 1 0;
}

.project-table-header>div:nth-of-type(3) {
	flex: 1 1 0;
}

.project-table-header>div:nth-of-type(4) {
	flex: 3 1 0;
}

.project-table-header>div:nth-of-type(5) {
	flex: 2 1 0;
}

.project-table-header>div:nth-of-type(6) {
	flex: 2 1 0;
}

.project-table-header>div:nth-of-type(7) {
	flex: 2 1 0;
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
	flex: 1 1 0;
}

.project-table-row>div:nth-of-type(2) {
	flex: 7 1 0;
}

.project-table-row>div:nth-of-type(3) {
	flex: 1 1 0;
}

.project-table-row>div:nth-of-type(4) {
	flex: 3 1 0;
}

.project-table-row>div:nth-of-type(5) {
	flex: 2 1 0;
}

.project-table-row>div:nth-of-type(6) {
	flex: 2 1 0;
}

.project-table-row>div:nth-of-type(7) {
	flex: 2 1 0;
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

.closed {
	background-color: rgb(127, 127, 127);
}

.examining {
	background-color: rgb(220, 177, 7);
}

.denied {
	background-color: rgb(192, 65, 97);
}

.admin{
	height:50px;
}

</style>
</head>
<body>
	<nav class="nav">
		<div class="nav-wrapper">
			<div class="nav-header">
				<div class="logo"><img src="${path }/resources/images/adminsenter.png" class="admin"></div>
				<span class="divider"></span>
			</div>
			<div class="nav-body">
				<div class="">
					<div class="dummy-menu">메뉴</div>
				</div>
				<div class="nav-menu current-menu">
					<div>메인</div>
				</div>
				<div class="nav-menu" id="memberList">
					<div>회원</div>
				</div>
				<div class="nav-menu project">
					<div>프로젝트</div>
				</div>
				<div class="nav-menu">
					<div>게시판</div>
				</div>
				<div class="nav-menu">
					<div>정산</div>
				</div>
				<div>&nbsp;</div>
			</div>
			<div class="nav-footer"></div>
		</div>
	</nav>
	<div class="header-section-wrapper">
		<header class="header">
			<div class="header-wrapper">
				<div class="title">Overview</div>
			</div>
		</header>
		<section class="section">
			<div class="section-wrapper">
				<div class="poroject-table-top"></div>
				<div class="project-table">
					<div class="project-table-header">
						<div>
							<input type="checkbox" name="cb" id="cb" class="cb"> 
							<label for="cb"><span></span></label>
						</div>
						<div>
							<a href="#">제목</a>
						</div>
						<div>
							<a href="#">닉네임</a>
						</div>
						<div>
							<a href="#">연락처</a>
						</div>
						<div>
							<a href="#">신청일</a>
						</div>
						<div>
							<a href="#">마감일</a>
						</div>
						<div>
							<a href="#">상태</a>
						</div>
					</div>
					<!-- for문으로 리스트 출력 -->
					
					<c:forEach items="${map['list'] }" var="list" varStatus="vs">
					<div class="project-table-row">
						<div>
							<input type="checkbox" name="cb" id="cb${vs.index }" class="cb"> 
							<label for="cb${vs.index}" ><span></span></label>
						</div>
						<div>${list.projectTitle}</div>
						<div>${list.memberNick }</div>
						<div>${list.projectPhone }</div>
						<div>${list.beginDate }</div>
						<div>${list.endDate }</div>
							<c:choose>
								<c:when test="${list.projectStatCode eq 'PS02'}">
									<c:set value="examining" var="status" />
								</c:when>
								<c:when test="${list.projectStatCode eq 'PS03'}">
									<c:set value="open" var="status" />
								</c:when>
								<c:when test="${list.projectStatCode eq 'PS04'}">
									<c:set value="closed" var="status" />
								</c:when>
								<c:when test="${list.projectStatCode eq 'PS05'}">
									<c:set value="denied" var="status" />
								</c:when>
							</c:choose>
							<div>
							<button class="proj-status ${status }">${list.projectStatName }</button>
						</div>
					</div>
					</c:forEach>
				</div>
			
				<div class="project-btn-container">
					<button class="project-btn approve-btn">선택승인</button>
					<button class="project-btn denial-btn">선택반려</button>
				</div>


			</div>
			<!-- 페이지바 -->
			${map['pageBar'] }
		</section>
	</div>
</body>
<script>

	//체크박스 선택시 전체 체크 or 해제
	const cb = $('#cb');
	$(() => {
		$("#cb").on("click", (e) => {
			if($('.cb[checked="checked"]').length > 5)
			{
				$('.cb').removeAttr('checked');
			}
			else
			{
				$('.cb').attr('checked', 'checked');			
			}
		});
	});
	

	//paging
	const fn_paging = cPage => {
		location.href='${path}/admin/adminPage.do?cPage='+cPage;
	}; 
 
 	//왼쪽 메뉴에 프로젝트 눌렀을 때 페이지 이동
	$(() => {
		$(".project").on("click", () => {
			location.href="${path}/admin/adminPage.do";
		})
		
		$("#memberList").on("click", () => {
			location.href="${path}/admin/memberListView.do";
		})
	});
 
</script>
</html>
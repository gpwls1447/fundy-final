<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.memberupdate-header
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    font-size: 27px;
	    font-weight: bold;
	    margin: 30px 0;
	}
	
	.memberupdate-nav
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	}
	
	.memberupdate-nav > div
	{
	    margin: 0 20px;
	    font-size: 17px;
	    position: relative;
	}
	
	.memberupdate-nav > div > a
	{
		text-decoration: none;
		color: #444;
	}
	
	#divider
	{
	    position: absolute;
	    display: block;
	    height: 1px;
	    border: none;
	    border-top: 1px solid #ccc;
	    left: 0;
	    width: 100vw;
	    margin-top: 7px;
	}
	
	.indicator
	{
	    display: block;
	    bottom: -8px;
	    position: absolute;
	    width: 100%;
	    height: 5px;
	    background-color: rgb(76, 168, 228);
	}
	
	.memberupdate-body
	{
	    margin-top: 40px;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	}
	
	.memberupdate-wrapper
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	}
	
	.memberupdate-wrapper input
	{
	    height: 35px;
	    width: 220px;
	    box-sizing: border-box;
	    border-radius: 3px;
	    border: 1px solid #ccc;
	    padding:0 7px;
	}
	
	.profile-pic-container
	{
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    position: relative;
	    margin-bottom: 35px !important;
	}
	
	.profile-pic
	{
	    width: 100%;
	    height: 100%;
	    border-radius: 50%;
	}
	
	.profile-upload
	{
	    position: absolute;
	    top: 0;
	    left: 0;
	    opacity: 0;
	    width: 100% !important;
	    height: 100% !important;
	    padding: 0 !important;
	    z-index: 2;
	    cursor: pointer;
	}
	
	.memberupdate-wrapper > div
	{
	 	display: flex;
	    margin: 10px 0;
	}
	
	.memberupdate-wrapper > div > div:first-of-type{width: 110px; font-weight: bold;}
	.memberupdate-wrapper > div > div:last-of-type{width: 220px;}
	
	.email{width: 100%;}
	
	.intro
	{
	    resize: none;
	    min-width: 308px;
	    min-height: 100px;
	    border-radius: 4px;
	    border: 1px solid #ccc;
	}
	
	.btn-set
	{
	    width: 395px;
	    display: flex;
	    justify-content: center;
	}
	
	.btn-mod
	{
	    margin: 0;
	    margin-left: 10px;
	}
	
	.warning
	{
		border: 1px solid gray;
		padding: 15px 50px;
		width: 95%;
		font-size: 14px;
		font-weight: normal !important;
		margin: 10px 0 40px 0 !important;
	}
</style>

<section>
	<div class="memberupdate-header">회원정보 수정</div>
	    <div class="memberupdate-nav">
	        <div><a href="${path}/member/memberUpdateView.do">기본정보수정</a></div>
	        <div><a href="${path}/member/memberPwView.do">비밀번호변경</a></div>
	        <div><a href="${path}/member/memberAddressView.do">배송지관리</a></div>
	        <div><a href="${path}/member/memberDeleteView.do">회원탈퇴</a><span class="indicator"></span></div>
	    </div>
	<hr id="divider"/>
	
	<div class="memberupdate-body">
        <form action="${pageContext.request.contextPath}/member/memberDelete.do" method="post" class="memberupdate-wrapper" name="deleteFrm">
        	<div class="warning">
		       	한번 탈퇴하면 복구가 불가능합니다.<br>만약 진행중인 프로젝트가 있다면 프로젝트가 불가능합니다.
		    </div>        
	        <div class="nick-row">
	        	<div>아이디</div>
		        <div>
		            <input type="text" name="memberEmail" class="nick" value="${loggedMember.memberEmail}" readonly>
		        </div>
		    </div>
	        <div class="email-row" id="updatePw">
	            <div>비밀번호</div>
	            <div><input type="password" name="memberPw" id="memberPw" class="email" placeholder="비밀번호를 입력해주세요."></div>
	        </div>
			<div  id="pwSpan"></div>
			<div class="btn-set" id="updatePw3">
	            <button class="basic-btn btn-mod" onclick="fn_cancel()">취소</button>
	            <button class="basic-btn basic-btn-active btn-mod" onclick="return fn_delete();" id="deleteBtn">탈퇴하기</button>
	        </div>
        </form>
    </div>
</section>
<script>
	var time = new Date().getTime();
	function fn_delete(){
		var check = confirm('탈퇴하시겠습니까?');
		if(confirm==true){
			deleteFrm.submit();
			session.invalidate();
		} else{
			return;
		}
	}
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

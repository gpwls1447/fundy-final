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

        #divider
        {
            position: absolute;
            display: block;
            height: 1px;
            border: none;
            border-top: 1px solid #ccc;
            left: 0;
            width: 100vw;
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
            width: 450px;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
        }

        .memberupdate-wrapper input
        {
            height: 35px;
            box-sizing: border-box;
            border-radius: 4px;
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

        .memberupdate-wrapper > div > div:first-of-type
        {
            width: 110px;
            font-weight: bold;
        }
        .memberupdate-wrapper > div > div:last-of-type{width: 310px;}

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
        
        
</style>

<section class="section">
    <div class="memberupdate-header">회원정보 수정</div>
    <div class="memberupdate-nav">
        <div><a href="${pageContext.request.contextPath}/member/memberUpdateView.do">기본정보수정</a></div>
        <div><a href="${pageContext.request.contextPath}/member/memberPwView.do">비밀번호변경</a><span class="indicator"></span></div>
        <div><a href="${pageContext.request.contextPath}/member/memberAddressView.do">배송지관리</a></div>
        <div><a href="${pageContext.request.contextPath}/member/memberDeleteView.do">회원탈퇴</a></div>
    </div>
	<hr id="divider"/>
        <div class="memberupdate-body">
            <form action="${pageContext.request.contextPath}/member/memberPw.do" method="post" class="memberupdate-wrapper" name="pwFrm"> 
	            <div class="nick-row">
	           		<div>아이디</div>
		                <div>
		                	<input type="text" name="memberEmail" class="nick" value="${loggedMember.memberEmail}" readonly>
		                </div>
		        </div>
                <div class="nick-row">
                    <div>기존 비밀번호</div>
                    <div>
                        <input type="password" name="beforePw" id="beforePw" class="nick" placeholder="기존 비밀번호를 입력해주세요.">
                        <button class="basic-btn basic-btn-active btn-mod" id="pwCheckBtn" onclick="return false;">확인</button>
                    </div>
                </div>
                
	                <div class="email-row" id="updatePw" style="display:none">
	                    <div>비밀번호 수정</div>
	                    <div><input type="password" name="memberPw" id="memberPw" class="email" placeholder="신규 비밀번호를 입력해주세요."></div>
	                </div>
	                
	                <div class="email-row" id="updatePw2" style="display:none">
	                    <div>비밀번호 확인</div>
	                    <div><input type="password" name="newPwCheck" id="newPwCheck" class="email" placeholder="비밀번호를 다시 입력해주세요." ></div>
	                </div>
	                <div  id="pwSpan"></div>
	                
	                <div class="btn-set" id="updatePw3" style="display:none">
	                    <button class="basic-btn btn-mod" onclick="fn_cancel()">취소</button>
	                    <button class="basic-btn basic-btn-active btn-mod" onclick="return fn_update()" id="updateBtn">수정하기</button>
	                </div>
               
            </form>
        </div>
</section>
<script>

	//수정하기 버튼 눌렀을 때
	function fn_update(){
		var check = confirm("수정하시겠습니까?");
		var memberPw = $('#memberPw').val();
		var newPwCheck = $('#newPwCheck').val();
		
		if(memberPw.trim().length == 0 || newPwCheck.trim().length == 0){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		
		if(check==true){
			pwFrm.submit();
		}
	}
	
	function fn_cancel(){
		
	}
	
	//비밀번호 불일치일 경우
	$(function(){
		$('#newPwCheck').on('blur', function(){
			
			var memberPw = $('#memberPw').val();
			var newPwCheck = $('#newPwCheck').val();
			var updateBtn = document.getElementById('updateBtn');
			
			if(memberPw.trim().length == 0 || newPwCheck.trim().length == 0) return;
			if(memberPw!=newPwCheck){
				$('#pwSpan').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
				updateBtn.disabled = true;
				
			} else {
				$('#pwSpan').text('비밀번호가 일치합니다.').css('color', 'green');
				updateBtn.disabled = false;
			}
		});
		
		$('#newPwCheck').on('keydown', function(){
			$('#pwSpan').text('');
		});
	});
	
</script>

<script>
	//기존비밀번호 확인하기 
	$(function(){ 
		$('#pwCheckBtn').click(function(e){
			e.preventDefault();
			var beforePw = $('#beforePw').val();
			var memberEmail = $('#memberEmail').val();
			$.ajax({
				type:"post",
				url:"${path}/member/memberPwCheck.do",
				data:{"memberPw":beforePw, "memberEmail":"${loggedMember.memberEmail}"},
				dataType:"text",
				success:function(data){
					console.log(data);
					if(data=='true'){
						alert('비밀번호가 일치합니다. 변경을 해주세요');
						$('#pwCheckBtn').text('확인완료');
						$('#updatePw').show();
						$('#updatePw2').show();
						$('#updatePw3').show();
						
					} else{
						alert('비밀번호가 불일치합니다. 다시 입력해주세요.');
						
					} 
				}
			});
		});
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.fundy.model.vo.*"%>
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
<<<<<<< HEAD
            padding: 0 7px;
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
            width: 90px;
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
            <div><a href="${pageContext.request.contextPath}/member/memberUpdateView.do">기본정보수정</a><span class="indicator"></span></div>
            <div><a href="${pageContext.request.contextPath}/member/memberPwView.do">비밀번호변경</a></div>
            <div><a href="${pageContext.request.contextPath}/member/memberAddressView.do">배송지관리</a></div>
            <div><a href="${pageContext.request.contextPath}/member/memberDeleteView.do">회원탈퇴</a></div>
        </div>

        <hr id="divider"/>
        
        <div class="memberupdate-body">
            <form action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post" name="updateFrm" class="memberupdate-wrapper">
                <div class="profile-pic-container">
                    <img class="profile-pic" src="${path }/resources/images/default_profile_1.png">
                    <input type="file" name="" class="profile-upload">
                </div>
                <div class="email-row">
                    <div>이메일</div>
                    <div><input type="text" name="memberEmail" class="email" value="${loggedMember.memberEmail}" readonly></div>
                </div>
                
                <div class="nick-row">
                    <div>닉네임</div>
                    <div>
                        <input type="text" name="memberNick" id="memberNick" class="nick" placeholder="닉네임을 입력해주세요." value="${loggedMember.memberNick}">
                        <button class="basic-btn basic-btn-active btn-mod" id="nickCheck" onclick="return false;">중복확인</button>
                    </div>
                </div>
                <div class="intro-row">
                    <div>한줄소개</div>
                    <div>
                        <textarea name="intro" id="intro" class="intro" placeholder="200자 이내로 입력해주세요." >${loggedMember.intro}</textarea>
                        
                    </div>
                </div>
                <div class="btn-set">
                    <button class="basic-btn btn-mod">취소</button>
                    <button class="basic-btn basic-btn-active btn-mod" onclick="update();">수정하기</button>
                </div>
            </form>
        </div>
    </section> 
<script>
    //네비게이션 바 토글
    const nav = $('.nav');
    const categoryBtn = $('.category-btn');
    $(() => {
        nav.hide();
        categoryBtn.on('click', () => {
            nav.slideToggle(300);
        });
    });

    //유저모달창 토글
    const userModal = $('.user-modal');
    const userBtn = $('.user-btn');
    const modalOverlay = $('.modal-overlay');
    const userModalBody = $('.user-modal-body');
    const userModalHeader = $('.user-modal-header');

    $(() => {
        userModalBody.hide();
        userModalHeader.hide();
        userBtn.on('click', e => {
            modalOverlay.toggle();
            userModal.animate({width: 'toggle'}, 300);
            setTimeout(fadeToggleUser(500), 100);
        });
        $('.close-btn').on('click', () => {
            modalOverlay.toggle();
            fadeToggleUser(200);
            userModal.animate({width: 'toggle'}, 300);
        });
    });

    //유저모달창 내부 요소 Fade효과함수
    const fadeToggleUser = () => {
        userModalHeader.fadeToggle(250);
        userModalBody.fadeToggle(250);
    }
</script>

<script>
	function update(){
		var comfirm="수정하시겠습니까?";
		if(comfirm==true){
			updateFrm.submit();
			
		} 
	}
</script>

<script>
	var checkNick=0;
	$(function(){
		$('#nickCheck').click(function(){
			var memberNick = $('#memberNick').val();
			$.ajax({
				url:"${path}/member/memberNickCheck.do",
				type:"post",
				data:{"memberNick":memberNick},
				dataType:"json",
				success:function(data){
					console.log();
					if(data>0){
						alert('사용할수 없는 닉네임입니다. 다시 입력해주세요.');
						$('#memberNick').val('');
					} else {
						alert('사용가능한 닉네임입니다.');
						
					}
				}
				
			});
		});
	});
=======
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
            width: 90px;
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
            <div><a href="${pageContext.request.contextPath}/member/memberUpdateView.do">기본정보수정</a><span class="indicator"></span></div>
            <div><a href="${pageContext.request.contextPath}/member/memberPwView.do">비밀번호변경</a></div>
            <div><a href="${pageContext.request.contextPath}/member/memberAddressView.do">배송지관리</a></div>
            <div><a href="${pageContext.request.contextPath}/member/memberDeieteView.do">회원탈퇴</a></div>
        </div>

        <hr id="divider"/>
        
        <div class="memberupdate-body">
            <form action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post" name="updateFrm" class="memberupdate-wrapper">
                <div class="profile-pic-container">
                    <img class="profile-pic" src="${path }/resources/images/default_profile_1.png">
                    <input type="file" name="" class="profile-upload">
                </div>
                <div class="email-row">
                    <div>이메일</div>
                    <div><input type="text" name="memberEmail" class="email" value="${loggedMember.memberEmail}" readonly></div>
                </div>
                
                <div class="nick-row">
                    <div>닉네임</div>
                    <div>
                        <input type="text" name="memberNick" class="nick" placeholder="닉네임을 입력해주세요." value="${loggedMember.memberNick}">
                        <button class="basic-btn basic-btn-active btn-mod" onclick="checkNick();">중복확인</button>
                    </div>
                </div>
                <div class="intro-row">
                    <div>한줄소개</div>
                    <div>
                        <textarea name="intro" id="intro" class="intro" placeholder="200자 이내로 입력해주세요." >${loggedMember.intro}</textarea>
                        
                    </div>
                </div>
                <div class="btn-set">
                    <button class="basic-btn btn-mod">취소</button>
                    <button class="basic-btn basic-btn-active btn-mod" onclick="update();">수정하기</button>
                </div>
            </form>
        </div>
    </section> 
<script>
    //네비게이션 바 토글
    const nav = $('.nav');
    const categoryBtn = $('.category-btn');
    $(() => {
        nav.hide();
        categoryBtn.on('click', () => {
            nav.slideToggle(300);
        });
    });

    //유저모달창 토글
    const userModal = $('.user-modal');
    const userBtn = $('.user-btn');
    const modalOverlay = $('.modal-overlay');
    const userModalBody = $('.user-modal-body');
    const userModalHeader = $('.user-modal-header');

    $(() => {
        userModalBody.hide();
        userModalHeader.hide();
        userBtn.on('click', e => {
            modalOverlay.toggle();
            userModal.animate({width: 'toggle'}, 300);
            setTimeout(fadeToggleUser(500), 100);
        });
        $('.close-btn').on('click', () => {
            modalOverlay.toggle();
            fadeToggleUser(200);
            userModal.animate({width: 'toggle'}, 300);
        });
    });

    //유저모달창 내부 요소 Fade효과함수
    const fadeToggleUser = () => {
        userModalHeader.fadeToggle(250);
        userModalBody.fadeToggle(250);
    }
</script>

<script>
   function update(){
      var comfirm="수정하시겠습니까?";
      if(comfirm==true){
         updateFrm.submit();
         
      } 
   }
>>>>>>> refs/heads/feature_kyo
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
        /* footer 부분 */

        .footer
        {
            width: 1005px;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
        }

        /* 유저 모달창 부분 */

        .user-modal
        {
            position: fixed;
            top: 0;
            right: 0;
            width: 250px;
            height: 100%;
            background-color: white;
            display: none;
            font-family: 'Noto Sans KR';
        }

        .modal-overlay
        {
            position: fixed;
            top: 0;
            width: 100vw;
            height: 100vh;
            background-color: black;
            opacity: 0.4;
            display: none;
        }

        .close-btn
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 32px;
            height: 32px;
            background-color: white;
            overflow: hidden;
        }

        .close-btn > i
        {
            width: 100%;
            height: 100%;
            font-size: 35px;
            opacity: .5;
            color: black;
            margin-top: 3px;
            margin-left: 3px;
            cursor: pointer;
        }

        .close-btn > i:hover
        {
            opacity: .9;
        }

        .user-modal-header
        {
            height: 250px;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            padding-top: 90px;
            padding-bottom: 10px;
        }

        .user-modal-header > img
        {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            border: 1px solid #eee;
        }

        .user-nick
        {
            font-size: 25px;
            font-weight: bold;
        }

        .user-modal-body
        {
            background-color: rgb(70, 70, 85);
            display: flex;
            flex-wrap: wrap;
        }

        .user-menu-box
        {
            width: 50%;
            padding: 12.5% 0;
            display: flex;
            flex-flow: column;
            align-items: center;
            justify-content: center;
            position: relative;
            cursor: pointer;
        }

        .user-menu-box > i
        {
            font-size: 38px;
            color: white;
            opacity: .7;
        }

        .user-menu-box:hover > i
        {
            opacity: 1;
            transform: scale(1.1);
        }

        .user-menu-box:hover .user-menu-text
        {
            opacity: 1;
            transform: scale(1.1);
        }

        .user-menu-text
        {
            margin-top: 3px;
            color: white;
            opacity: .7;
            font-size: 13px;
        }

        .bar
        {
            position: absolute;
            display: block;
            background-color: rgba(255, 255, 255, .2);
        }

        .vertical-bar
        {
            width: 1px;
            height: 65%;
            right: 0;
        }

        .horizontal-bar
        {
            width: 65%;
            height: 1px;
            bottom: 0;
        }

        .user-modal-footer
        {
            height: 100%;
            background-color: rgb(70, 70, 85);
        }

/* 로그인 회원가입 모달창 */

.login-modal-btn{
	background: #03A9F4;
	padding: 10px 16px;
	width: auto;
	font-weight: 600;
	text-transform: uppercase;
	font-size: 14px;
	color: #fff;
	line-height: 16px;
	letter-spacing: 0.5px;
	border-radius: 2px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
	border: 0;
	outline: 0;
	margin: 15px 15px 15px 0;
	transition: all 0.25s;
}
.login-modal-btn:hover{
	background: #0288D1;
	box-shadow: 0 4px 7px rgba(0, 0, 0, 0.1), 0 3px 6px rgba(0, 0, 0, 0.1);
}

.login-modal{
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 5;
	width: 75%;
	min-width: 700px;
	height: 600px;
}

.backRight {
	position: absolute;
	right: 0;
	width: 50%;
	height: 100%;
	background-image : url(${path}/resources/images/loginPicture1.jpg);
	background-size: cover;
	background-position: 50% 50%;
}

.backLeft {
	position: absolute;
	left: 0;
	width: 50%;
	height: 100%;
	background-image : url(${path}/resources/images/loginPicture4.jpg);
	background-size: cover;
	background-position: 50% 50%;
}

#back {
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: -999;
}

#slideBox {
	width: 50%;
	max-height: 100%;
	height: 100%;
	overflow: hidden;
	margin-left: 50%;
	position: absolute;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
}

.topLayer {
	width: 200%;
	height: 100%;
	position: relative;
	left: 0;
	left: -100%;
}

.left {
	border-bottom: 1px solid #ccc !important;
	width: 50%;
	height: 100%;
	background: #2C3034;
	left: 0;
	position: absolute;
}

.right {
	width: 50%;
	height: 100%;
	background: #f9f9f9;
	right: 0;
	position: absolute;
}

.content {
	width: 250px;
	margin: 0 auto;
	top: 30%;
	position: absolute;
	left: 50%;
	margin-left: -125px;
}

.content h2 {
	color: #03A9F4;
	font-weight: 300;
	font-size: 35px;
}

.off {
	background: none;
	color: #03A9F4;
	box-shadow: none;
}

.right .off:hover {
	background: #eee;
	color: #03A9F4;
	box-shadow: none;
}

.left .off:hover {
	box-shadow: none;
	color: #03A9F4;
	background: #363A3D;
} 

div#slideBox input {
	width : 220px;
	background: transparent;
	border: 0 !important;
	outline: 0 ;
	border-bottom: 1px solid #45494C !important;
	font-size: 14px;
	color: black;
	padding: 8px 0;
	margin-top: 20px;
}

.temp {
	background-color: transparent;
	border: 0;
	outline: 0;
	border-bottom: 1px solid #45494C;
	border-radius:0;
	font-size: 14px;
	color: #eee;
	padding: 4px 0;
	margin-top: 15px;
}

.temp::placeholder{
	font-size: 13px;
	color : #ccc;
	padding: 4px 0;
	margin-top: 10px;
}

.temp:focus{
	background-color : transparent;
	color : #eee;
}

.login-close-btn{
	position: absolute; right: 10px; top: 10px;
	width : 30px;
	height : 30px;
	background-color: rgba(255, 255, 255, 0.3);
	z-index: 5;
}

.login-close-icon{
	font-size : 30px;
	color: #444;
}



</style>


    <footer class="footer">
    <br><br><br><br>
    <button class="datagen-btn">멤버 생성</button>
    </footer>
    </div>

    <!-- 로그인 모달 -->
    <div class="modal-overlay"></div>
    
    <div class="user-modal">
        <div class="user-modal-header">
            <div class="close-btn">
                <i class="material-icons">clear</i>
            </div>
            <img class ="user-profile-pic" src="${path }/resources/images/profile_pic_sample.jpg">
            <div class="user-nick">
                Amber Heard
            </div>
        </div>
        <div class="user-modal-body">
            <div class="user-menu-box">
                <span class="bar vertical-bar"></span>
                <span class="bar horizontal-bar"></span>
                <i class="material-icons">work_outline</i>
                <span class="user-menu-text">내프로젝트</span>
            </div>
            <div class="user-menu-box">
                <span class="bar horizontal-bar"></span>
                <i class="material-icons">card_giftcard</i>
                <span class="user-menu-text">후원내역</span>
            </div>
            <div class="user-menu-box">
                <span class="bar vertical-bar"></span>
                <span class="bar horizontal-bar"></span>
                <i class="material-icons">favorite</i>
                <span class="user-menu-text">찜바구니</span>
            </div>
            <div class="user-menu-box">
                <span class="bar horizontal-bar"></span>
                <i class="material-icons">chat</i>
                <span class="user-menu-text">메시지</span>
            </div>
            <div class="user-menu-box">
                <span class="bar vertical-bar"></span>
                <i class="material-icons">fingerprint</i>
                <span class="user-menu-text">정보수정</span>
            </div>
            <div class="user-menu-box">
                <i class="material-icons">exit_to_app</i>
                <span class="user-menu-text">로그아웃</span>
            </div>
        </div>
        <div class="user-modal-footer"></div>
    </div>
    
    
    <!-- 로그인 / 회원가입 모달 -->
    <div class="login-modal">
	
	<button id="logout-btn" class="login-modal-btn login-close-btn">
		<i  class="material-icons login-close-icon">close</i> 
	</button>
	
	<div id="back">
		<div class="backRight"></div>
		<div class="backLeft"></div>
	</div>

	<div id="slideBox">
		<div class="topLayer">
			<div class="left">
				<div class="content">
					<h2>Sign Up</h2>				<!--  onsubmit="return false;" 정규식할때 활용-->
					<form method="post" action="${path }/member/memberEnrollEnd.do" autocomplete="off">
						<div class="form-group">
							<input type="email" class="form-control temp" placeholder="이메일" id="memberEmail_" name="memberEmail" required /> 
							<input type="password" class="form-control temp" placeholder="비밀번호" id="password_" name="memberPw" required /> 
							<input type="password" class="form-control temp" placeholder="비밀번호 확인" id="password2" required /> 
							<input type="text" class="form-control temp" placeholder="닉네임" name="memberNick" required />
						</div>
					<input type="submit" class="login-modal-btn" value="회원가입">
					<button id="goLeft" class="off login-modal-btn">Login</button>
					</form>
				</div>
			</div>
			<div class="right">
				<div class="content">
					<h2>Login</h2>						<!-- onsubmit="return false;" -->
					<form method="post" action="${path }/member/memberlogin.do"  autocomplete="off">
						<div class="form-group">
							<input type="email" placeholder="email" name="memberEmail" /> 
							<input type="password" placeholder="password" name="memberPw" />
						</div>
						<div class="form-gruop">
							<button id="goRight" type="button" class="off login-modal-btn" onclick="">회원가입</button>
							<button id="login" type="submit" class="off login-modal-btn">Login</button>
								<!-- 카카오로그인 -->
							<a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout">kalogout</a>
   					 	</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<form id="kakaoLoginForm" method="post" action="${path }/member/kakaoLogin.do">
	<input type="hidden" id="kakaoId" name="kakaoId" value="" >
	<input type="hidden" id="kakaoNick" name="kakaoNick" value="" >
</form>
    
	
<script>
	
    //패스워드 일치 확인
    $(function(){
		$("#password2").blur(function(){
			var pw=$("#password_").val();
			var pwck=$("#password2").val();
			if(pw!=pwck){
				alert("password 불일치");
				//패스워드 비워주기
				$("#password2").val("");
				$("#password_").focus();
			}
		});
	});

	

	//로그인 모달
	const loginBtn = $('.login-btn');
	const loginModal = $('.login-modal');
	$(() => {
		loginBtn.on('click', () => {
			loginModal.toggle();
			modalOverlay.toggle();
		});
	});
	
	//x(취소) 버튼  아래 로그인함수 클릭시 생기는 이벤트 똑같이 달아주면됨
	const logoutBtn = $('#logout-btn');
	$(() => {
		logoutBtn.on('click', () => {
			loginModal.toggle();
			modalOverlay.toggle();
		});
	});
	
	
	//로그인 회원가입 전환 기능
	 $(document).ready(function() {
			$('#goRight').on('click', function() {
				$('#slideBox').animate({
					'marginLeft' : '0'
				});
				$('.topLayer').animate({
					'marginLeft' : '100%'
				});
			});
			$('#goLeft').on('click', function() {
				$('#slideBox').animate({
					'marginLeft' : '50%'
				});
				$('.topLayer').animate({
					'marginLeft' : '0'
				});
			});
		});

    //검색창 토글
    const searchBtn = $('.search-btn');
    const searchBar = $('.search-bar');
    $(() => {
        searchBtn.on('click', e => {
            if(searchBar.is(':visible'))
            {
                $('body').off('mouseup');
                searchBar.toggle(200);
                return;
            }
            searchBar.toggle(200);

            $('body').on('mouseup', e => {
                if (searchBar.is(':animated') || e.target == searchBar[0] || $('header')[0].contains(e.target)) return;
                searchBar.toggle(200);
                $('body').off('mouseup');
            });
        });

    });

    //네비게이션 바 토글
    const nav = $('.nav');
    const categoryBtn = $('.category-btn');
    $(() => {
    	nav.hide();
        categoryBtn.on('click', () => {
            nav.slideToggle(300);
        });
    });

    //메인 슬라이드
    const slideLeftBtn = $('.main-slide-btn--left');
    const slideRightBtn = $('.main-slide-btn--right');
    const slideImageTrack = $('.main-image-track');
    const navbar = $('.main-slide-navbar > ul');
    const dots = navbar.children();

    //이동 버튼 함수 바인드
    $(() => {
        slideLeftBtn.on('click', moveSlidePrev);
        slideRightBtn.on('click', moveSlideNext);
    });

    //이전 슬라이드 이동 함수
    const moveSlidePrev = () => {
        const targetSlide = slideImageTrack.children().last(); 
        slideImageTrack.prepend(targetSlide);
        moveDot('prev');
    }

    //다음 슬라이드 이동 함수
    const moveSlideNext = () => {
        const currentSlide = slideImageTrack.children().first();
        slideImageTrack.append(currentSlide);
        moveDot('next');
    }

    //점 이동 함수
    const moveDot = (direction) => {
        const firstDot = navbar.children().first();
        const lastDot = navbar.children().last();

        switch(direction) {
            case 'prev' : firstDot.appendTo(navbar); break;
            case 'next' : lastDot.prependTo(navbar); break;
        }
    };

    //점 클릭 동작 함수
    $(() => {
        dots.on('click', e => {
            const indexGap = dots.index('.main-current-dot') - dots.index(e.currentTarget);
            if(indexGap == 0) return;
            if(indexGap > 0)
            {
                for(let i = 0 ; i < Math.abs(indexGap) ; i++)
                {
                    moveSlidePrev();
                }
            }
            else
            {
                for(let i = 0 ; i < Math.abs(indexGap) ; i++)
                {
                    moveSlideNext();
                }
            }
        });
    });

    //인기 카테고리 클릭 시 클래스 변동
    const popCategBtns = $('.popular-nav').children();
    $(() => {
        popCategBtns.on('click', e => {
            $('.basic-btn-active').removeClass('basic-btn-active');
            $(e.currentTarget).addClass('basic-btn-active');
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
    const fadeToggleUser = (time) => {
        userModalHeader.fadeToggle(time);
        userModalBody.fadeToggle(time);
    }
    
    
    
    const datagenBtn = $('.datagen-btn');
    $(() => {
    	datagenBtn.on('click', () => {
    		$.ajax({
    			url: '${pageContext.request.contextPath}/datagen.do',
    			success: data => {
    				alert('결과: ' + data);
    			}
    		});
    	});
    });
    
  //카카오 로그인 
    Kakao.init('3936fbb46415d0ad3589f5b20380fa77');
       // 카카오 로그인 버튼을 생성합니다.
       Kakao.Auth.createLoginButton({
         container: '#kakao-login-btn',
         success: function(authObj) {
           // 로그인 성공시, API를 호출합니다.
           Kakao.API.request({
             url: '/v1/user/me',
             success: function(res) {
             	console.log("res : "+JSON.stringify(res));
               console.log(JSON.stringify(res.kaccount_email));
               console.log(JSON.stringify(res.id));
               console.log(JSON.stringify(res.properties.profile_image));
               console.log(JSON.stringify(res.properties.nickname));
               
               var id = res.id;
               var email = res.kaccount_email;
               var profile = res.properties.profile_image;
               var nick = res.properties.nickname;
               testajax(id, email, profile);
               
               
             },
             fail: function(error) {
               alert(JSON.stringify(error));
             }
           });
         },
         fail: function(err) {
           alert(JSON.stringify(err));
         }
       });
     
       function testajax(id, email, profile, nick)
       {
           $.ajax({
           	url : "${pageContext.request.contextPath }/member/isKakao.do?kakaoId="+id,
           	dataType:"json",
           	/* data : res, */
           	success : function(data){
           		console.log("돌려받은 값 : "+data.val);
           		if(data.val=="y"){
           			console.log("y로 들어옴");
           			loginModal.toggle();
         			modalOverlay.toggle();
           			
           		}
           		else{
           			var confirm=confirm("가입하시겠습니까?") 
           			//yes 회원가입 / no 그냥 메인페이지
           			if(confirm){
           				alert("회원가입 페이지로 이동합니다.");
           			}
           			else{
           				alert("그럼 그냥 구경");
           			}
           		}
           	},
           	error:function(re,msg)
           	{
           		console.log(re);
           		console.log(msg);
           	}
          })
       }
       
    
    
</script>
</html>
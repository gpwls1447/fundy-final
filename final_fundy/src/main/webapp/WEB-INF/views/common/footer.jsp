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
      margin-top: 100px;
      border-top: 1px solid #eee;
      width: 100%;
      min-width: 1005px;
   }
   
       .footer-top
    {
        width: 100%;
        height: 230px;
        display: flex;
        align-items: center;
        background-color: rgb(19, 79, 105);
        color: rgba(255, 255, 255, 0.4);
        box-sizing: border-box;
        font-size: 13px;
    }

    .footer-top > div 
    {
        flex: 1 1 0;
        display: flex;
        flex-flow: column nowrap;
        align-items: center;
        justify-content: center;
        padding: 20px 50px;
        line-height: 25px;
    }

    .footer-title
    {
        margin-bottom: 20px;
        font-size: 17px;
        color: #eee;
    }

    .footer-sub
    {
        display: flex;
        flex-flow : column nowrap;
    }

    .footer-horiz-line
    {   
        display: block;
        width: 1px;
        height: 70%;
        background-color: rgba(255, 255, 255, 0.2);
    }


    .footer-bottom
    {
        width: 100%;
        background-color: rgb(44, 56, 64);
        color: #666;
        font-size: 12px;
        padding: 15px 50px;
        box-sizing: border-box;
        display: flex;
    }

    .footer-bottom > div {flex: 1 1 0;}

    .site-nav
    {
        display: flex;
    }


    .site-nav > span
    {
        font-weight: bold;
        margin-right: 20px;
        display: flex;
        align-items: center;
    }

    #footer-logo
    {
        font-size: 22px;
        font-weight: 900;
    }

    .copyright{margin: 10px 0;}

    #footer-links
    {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    #footer-links button
    {
        background-color: transparent;
        border: none;
        padding: 0;
        display: flex;
        margin-left: 10px;
        cursor: pointer;
    }

    #footer-links img
    {
        width: 40px;
        opacity: .6;
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
   
   .login-trans-btn
   {
      
   }
   
   .login-modal{
      display: none;
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      z-index: 1;
      width: 75%;
      width: 700px;
      height: 600px;
   }
   
   .backRight {
      position: absolute;
      right: 0;
      width: 50%;
      height: 100%;
      background-image : url(${path}/resources/images/loginPicture_love.jpg);
      background-size: cover;
      background-position: 50% 50%;
   }
   
   .backLeft {
      position: absolute;
      left: 0;
      width: 50%;
      height: 100%;
      background-image : url(${path}/resources/images/loginPicture_dog.jpg);
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
      top: 10%;
      position: absolute;
      left: 50%;
      margin-left: -125px;
   }
   
   .off {
      background: none;
      color: #999;
      box-shadow: none;
      border: 1px solid #999 !important;
      
   }
   
   .right .off:hover {
      background: #eee;
      color: #444;
      box-shadow: none;
   }
   
   .left .off:hover {
      box-shadow: none;
      color: #03A9F4;
      background: #363A3D;
   } 
      
   .login-close-btn{
      border: none;
      outline: none;
      position: absolute;
      right: -40px;
      top: 0;
      width : 40px;
      height : 40px;
      background-color: rgba(255, 255, 255, 0.4);
      z-index: 1;
      display: flex;
      align-items: center;
      justify-content: center;
   }
   
   .login-close-icon{
      font-size : 30px;
      color: #444;
   }
   
   .signup-modal-input
   {
      width: 100%;
      background-color: transparent;
      border: 0;
      outline: 0;
      border-bottom: 1px solid #45494C;
      font-size: 14px;
      padding: 4px 0;
      margin-top: 20px;
      border-radius:0;
      color: #eee;
      transition: 0.3s linear;
   }
   
   .login-modal-input
   {
      color: #444;
   }
   
   .form-title
   {
      width: 100%;
      font-weight: 300;
/*       color: #03A9F4; */
      color: #888;
      font-size: 20px;
      margin-bottom: 50px;
   }
   
   .signup-modal-input::placeholder
   {
      font-size: 13px;
      color : #777;
      padding: 4px 0;
      margin-top: 10px;
   }
   
   .signup-modal-input:focus
   {
      background-color : transparent;
      color: #ccc;
      border-color: #ccc;
   }
   
   
   .login-modal-input
   {
      color: #999;
      border-bottom: 1px solid #999;
   }
   
   .login-modal-input::placeholder{
      color : #999;
   }
   
   .login-modal-input:focus
   {
      border-bottom: 1px solid #444;
      color: #444;
   }
   
   .brand-title
   {
      font-weight: 600;
      font-size: 40px;
   }
   .modal-btn-container
   {
      display: flex;
      margin: 15px 0;
   }
   
   .modal-btn-container > input:last-of-type{margin-right: 0;}
   {
   }
   
   .login-modal-btn
   {
      margin-right: 5px;
      flex: 1 1 0;
      border: none;
      outline: none;
      padding: 10px 0;
      font-size: 13px;
      cursor: pointer;
   }
   
   #kakao-login-btn
   {
      margin-top: 15px;
      width: 100%;
   }
   
   .email-group
   {
        display : flex;
   }
   
   .email-group >input
   {
         
   }
   span{
   		font-size:11px;
   		color:lavender;
   }
   
</style>
</div>
    <footer class="footer">
        <div class="footer-top">
            <div class="foundation">
                <span class="footer-title">Come Visit Us</span>
                <span>
                    서울시 강남구<br>테헤란로 14길 6<br>남원빌딩 4층<br>R 클래스
                </span>
            </div>
            <span class="footer-horiz-line"></span>
            <div>
                <span class="footer-title">Blah Blah Blah</span>
                <div class="footer-sub">
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                </div>
            </div>
            <span class="footer-horiz-line"></span>
            <div>
                <span class="footer-title">Blah Blah Blah</span>
                <div class="footer-sub">
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                </div>
            </div>
            <span class="footer-horiz-line"></span>
            <div>
                <span class="footer-title">Blah Blah Blah</span>
                <div class="footer-sub">
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                    <span>Blah Blah</span>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div>
                <div class="site-nav">
                    <span id="footer-logo">FUNDY</span>
                    <span>ABOUT</span>
                    <span>BLOG</span>
                    <span>NEWS</span>
                    <span>CONTACT</span>
                    <span>SITEMAP</span>
                </div>
                <div class="copyright">
                    (C) 2019-2019 FUNDY. Inc. All rights reserved.
                </div>
            </div>
            <div id="footer-links">
                <button>
                    <img src="${path }/resources/images/instagram.png">
                </button>
                <button>
                    <img src="${path }/resources/images/twitter.png">
                </button>
                <button>
                    <img class="datagen-btn" src="${path }/resources/images/youtube.png">
                </button>
                <button>
                    <img src="${path }/resources/images/facebook.png">
                </button>
            </div>
        </div>
    </footer>
    
    <div class="modal-overlay"></div>
    
    <!-- 유저 모달 -->
    
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
            <div class="user-menu-box memberUpdate-btn">
                <span class="bar vertical-bar"></span>
                <i class="material-icons">fingerprint</i>
                <span class="user-menu-text">정보수정</span>
            </div>
            <div class="user-menu-box logout-btn">
                <i class="material-icons">exit_to_app</i>
                <span class="user-menu-text">로그아웃</span>
            </div>
        </div>
        <div class="user-modal-footer"></div>
    </div>
    
    
    <!-- 로그인 모달 -->
    
    <div class="login-modal">
   
   <button class="login-close-btn">
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
               
               <div class="signup-title form-title"><span class="brand-title">FUNDY</span>회원가입</div>
               <form method="post" action="${path }/member/memberEnrollEnd.do" autocomplete="off">
                  <div class="form-group">
                  <div class="email-group">
                     <input type="email" class="signup-modal-input" placeholder="이메일" id="memberEmail" name="memberEmail" required />
                     <input type="button" class="off login-modal-btn" id="emailAuth" value="메일인증" 
                     		style="margin-top: 10px; padding-top: 0px; padding-bottom: 0px; width: 65px; height: 35px;"/>
                  </div>
                  <div class="email-group">  
                    <input type="text" class="signup-modal-input" id="authKey" name="authKey" placeholder="인증번호" />
                    <input type="button" class="off login-modal-btn " id="authCheck" value="인증확인" 
                   			style="margin-top: 10px; padding-top: 0px; padding-bottom: 0px; width: 65px; height: 35px;"/>
                  </div>   
                    <span class="auth ok">인증키가 일치합니다.</span>
              		<span class="auth error">인증키가 일치하지 않습니다.</span>
             		<input type="hidden" name="chekcAuth" id="checkAuth"/>
                    <input type="password" class="signup-modal-input" placeholder="비밀번호" id="password" name="memberPw" required /> 
                    <input type="password" class="signup-modal-input" placeholder="비밀번호 확인" id="password-ck" required /> 
                    <input type="text" class="signup-modal-input" placeholder="닉네임" id="memberNick" name="memberNick" required />
                    <span class="guide ok">사용 가능</span>
              		<span class="guide error">사용 불가</span>
             		<input type="hidden" name="checkId" id="checkId"/>
                  </div>
                  <div class="modal-btn-container">
                  <input type="submit" class="login-modal-btn" value="회원가입">
                  <input type="button" id="goLeft" class="off login-modal-btn" onclick="return false;" value="로그인">
               </div>
               </form>
            </div>
         </div>
         <div class="right">
            <div class="content">
               <div class="login-title form-title"><span class="brand-title">FUNDY</span>로그인</div>
               <form method="post" action="${path }/member/memberlogin.do" autocomplete="off">
                  <div class="form-group">
                     <input type="email" placeholder="email" name="memberEmail" class="signup-modal-input login-modal-input"/> 
                     <input type="password" placeholder="password" name="memberPw" class="signup-modal-input login-modal-input"/>
                  </div>
                  <!-- 카카오로그인 -->
                  <a id="kakao-login-btn"></a>
                  <div class="modal-btn-container">
                     <input type="button" id="goRight" class="off login-modal-btn" onclick="return false;" value="회원가입">
                     <input type="submit" class="off login-modal-btn" value="로그인">
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</div>
<input type="hidden" id="nickCheck" value="0">
<input type="hidden" id="authCheck" value="0">
<script>

   //닉네임 중복 체크
   $(".guide").hide();
   $(() => {
      $("#memberNick").on("keyup", () => {
         var memberNick = $('#memberNick').val();
         $.ajax({
            url:"${path}/member/chekcMemberNick.do",
            type:"post",
            data:{"memberNick":memberNick},
            dataType:"json",
            success:function(data){
               if(data==true){
                  console.log("사용 가능");
                  $(".guide.ok").show()
                  $(".guide.error").hide();
                  $("#nickCheck").val("1");
               }
               else{
                  $(".guide.ok").hide()
                  $(".guide.error").show();
                  $("#nickCheck").val("0");
               }
            }
         });
      })
   })
   
   //이메일 인증키 보내기
   $(() => {
      $('#emailAuth').on("click", () => {
         var email=$("#memberEmail").val().trim();
         $.ajax({
            url:"${path}/member/emailAuth.do",
            dataType:"json",
            data:{"memberEmail":email},
            success:function(data){
               console.log(data);
                  alert("이메일이 발송되었습니다. 인증번호를 적어주세요");
            }
         });
      });
   });
   
   //이메일 인증키 확인
   $(".auth").hide();
   $(() => {
      $('#authCheck').on("click", ()=> {
         var authKey=$("#authKey").val().trim();
         $.ajax({
            url:"${pageContext.request.contextPath}/member/authKey.do",
            dataType:"json",
            data:{"authKey":authKey},
            success:function(data){
               console.log("인증키확인");
               console.log(data);
               if(data==true){
                   console.log("사용 가능");
                   $(".auth.ok").show()
                   $(".auth.error").hide();
                }
                else{
                   $(".auth.ok").hide()
                   $(".auth.error").show();
                }
            },
            error:function(e){
               console.log(e);
            }
            
         });
      });
   });

   
   //로그아웃 기능
   $(() => {
      $('.logout-btn').on("click", () => {
         location.href="${path}/member/LogOut.do";   
      });
   });
   
   //정보수정 기능
   $(() => {
      $('.memberUpdate-btn').on("click", ()=> {
         location.href="${path}/member/memberUpdateView.do";
      })
   })
   

    //패스워드 일치 확인
     $(function(){
        $("#password-ck").blur(function(){
         var pw=$("#password").val();
         var pwck=$("#password-ck").val();
         if(pw!=pwck){
            alert("password 불일치");
            //패스워드 비워주기
            $("#password-ck").val("");
            $("#password").focus();
         }
      });
        //정규화적용
      
      
      
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
   
   //로그인창 닫기 버튼 이벤트 바인드
   const loginCloseBtn = $('.login-close-btn');
   $(() => {
      loginCloseBtn.on('click', () => {
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
        
        //검색창 Enter 이벤트
        searchBar.on('keyup', e => {
           if(e.keyCode == 13)
           {
              location.href='${path}/projectList/projectList.do?keyword='+searchBar.val()+'&majorCode=${majorCode}';
           }
        });

    });

    //네비게이션 바 토글
    const nav = $('.nav');
    const categoryBtn = $('.category-btn');
    $(() => {
        categoryBtn.on('click', () => {
            nav.slideToggle(300);
            nav.css('display', 'flex');
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
    
    
    
   //데이터생성 버튼
    const datagenBtn = $('.datagen-btn');
    $(() => {
       datagenBtn.on('click', () => {
          $.ajax({
             url: '${pageContext.request.contextPath}/datagen.do',
             success: data => {
                alert('멤버: ' + data.mResult + '\n' + '프로젝트: ' + data.pResult + '\n' + '후원: ' + data.flResult + '\n' + '코멘트: ' + data.cResult);
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
                console.log("object : "+JSON.stringify(res));
                console.log(JSON.stringify(res.id));
                testajax(res);
                loginModal.toggle();
                modalOverlay.toggle();
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
       
       function testajax(res)
       {
          console.log(res);
           $.ajax({
              url : "${pageContext.request.contextPath }/member/isKakao.do",
              dataType:"json",
              type:"post",
            data : {id:res.id,"email":res.kaccount_email,profile:res.properties['profile_image'], nick:res.properties['nickname']}, 
              success : function(data){
                 console.log("돌려받은 값 : "+data.val);
                 if(data.val=="y"){
                    location.href="${path}/";
                 }
                 else{
                    console.log("로그인실패");
                 }
              },
              error:function(re,msg)
              {
                 console.log(re);
                 console.log(msg);
              }
          })
       };
    
</script>
</html>
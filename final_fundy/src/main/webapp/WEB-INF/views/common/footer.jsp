<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
        /* footer 부분 */

        .footer
        {
            width: 1024px;
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
</style>
    <footer class="footer">
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
<script>

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
</script>
</html>
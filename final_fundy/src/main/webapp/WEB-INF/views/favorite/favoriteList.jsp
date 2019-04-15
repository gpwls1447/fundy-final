<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
        body
        {
            font-family: 'Noto Sans KR';
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
        }

        body button
        {
            font-family: 'Noto Sans KR';
        }

        .proj-list-wrapper
        {
            width: 1024px;

            display: flex;
            flex-flow: column nowrap;
            align-items: center;
        }

        .proj-search-result
        {
            font-size: 30px;
            margin: 20px;
        }

        .proj-category
        {
            width: 100%;
            display: flex;
            justify-content: space-between;
            margin: 20px 0 40px 0;
        }

        .proj-list-order
        {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }
        
        .proj-list-order > select
        {
            padding: 5px 10px;
            margin-right: 10px;
        }

        .proj-list-box
        {
            width: 1004px;
            display: flex;
            padding: 23px;
            box-sizing: border-box;
            margin: 20px;
            border: 1px solid #ccc;
        }

        .proj-list-thumnail
        {
            display: flex;
            align-items: center;
            justify-content: center;
            flex: 4 1 0;
        }

        .proj-list-thumnail > img
        {
            width: 97%;
            height: 97%;
        }

        .proj-list-title
        {
            font-size: 30px;
            font-weight: bold;
            line-height: 29px;
        }

        .proj-list-body
        {
            padding-left: 20px; flex: 7 1 0;
            display: flex;
            flex-flow: column;
            justify-content: space-between;
        }

        .proj-list-body > hr
        {
            margin: 5px 0 ;
            width: 25px;
        }

        .proj-creator{font-weight: bold;}

        .proj-brief{color: #666;}

        .proj-progbar-container
        {
            position: relative;
            width: 100%;
        }

        .proj-progbar-emtpy
        {
            background-color: #eee;
            height: 5px;
            width: 100%;
            margin-bottom: 10px;
        }
        .proj-progbar-filled
        {
            position: absolute;
            top: 0;
            height: 5px;
            width: 60%;
            background-color: var(--basic-color);
            margin-bottom: 10px;
        }

        .proj-progbar-info
        {
            display: flex;
            justify-content: space-between;
            line-height: 19px;
        }

</style>
<body>
    <div class="proj-list-wrapper">
        <div class="proj-search-result">찜바구니</div>


		<!-- 찜바구니 리스트 -->
        <div class="proj-list-box">
            <div class="proj-list-thumnail">
                <img src="images/thumnail_sample.jpg">
            </div>
            <div class="proj-list-body">
                <div class="proj-list-title">{project.projectTitle}</div>
                <div class="proj-creator">LAC</div>
                <hr>
                <div class="proj-brief">{project.projectSumary}</div>
                <div class="proj-progbar-container">
                    <div class="proj-progbar-emtpy"></div>
                    <div class="proj-progbar-filled"></div>
                    <div class="proj-progbar-info">
                        <span>60%</span>
                        <span>{project.goalPrice}</span>
                        <span>6일남음</span>
                    </div>
                </div>
            </div>
        </div>
        

        <div class="pagebar">
            <div class="pagebar-unit">
                <img class="pagebar-nav" src="images/sharp_navigate_prev_black.png">
            </div>
            <div class="pagebar-unit pagebar-unit-active">1</div>
            <div class="pagebar-unit">2</div>
            <div class="pagebar-unit">3</div>
            <div class="pagebar-unit">4</div>
            <div class="pagebar-unit">5</div>
            <div class="pagebar-unit">
                <img class="pagebar-nav" src="images/sharp_navigate_next_black.png">
            </div>
        </div>
    </div>
</body>
<script>
    
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
            setTimeout(fadeToggleUser, 100);
        });
        $('.close-btn').on('click', () => {
            modalOverlay.toggle();
            fadeToggleUser();
            userModal.animate({width: 'toggle'}, 300);
        });
    });

    //유저모달창 내부 요소 Fade효과함수
    const fadeToggleUser = () => {
        userModalHeader.fadeToggle(250);
        userModalBody.fadeToggle(250);
    }

    $(() => {
        $('.proj-category').children().on('click', e => {
            console.log($(e.currentTarget).data('category'));
        });
    });
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
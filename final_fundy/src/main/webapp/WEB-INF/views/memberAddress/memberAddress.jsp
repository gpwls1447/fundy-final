<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	
%>
<jsp:include page="/WEB-INF/views/common/header.jsp">

<section class="section">
        <div class="memberupdate-header">회원정보 수정</div>
        <div class="memberupdate-nav">
            <div>기본정보수정</div>
            <div>비밀번호변경</div>
            <div>배송지관리<span class="indicator"></span></div>
            <div>회원탈퇴</div>
        </div>
        <hr id="divider" />
        <div class="memberupdate-body">
            <form action="${pageContext.request.contextPath}/member/memberAddress.do" method="post" class="shipping-addr" name="addrFrm">
                <div class="addr-list-container">
                    <div class="addr-unit addr-unit-selected">이일교<i class="material-icons delete-btn">close</i></div>
                    <div class="addr-unit">정우진<i class="material-icons delete-btn">close</i></div>
                    <div class="addr-unit">이일교<i class="material-icons delete-btn">close</i></div>
                    <div class="addr-unit">정우진<i class="material-icons delete-btn">close</i></div>
                    <div class="addr-unit">정우진<i class="material-icons delete-btn">close</i></div>
                    <div class="add-addr tooltip"><i class="material-icons">add</i>
                        <span class="tooltiptext">새 배송지</span>
                    </div>
                </div>
                <div class="addr-inputs">
                    <div class="addr-tag-row">
                        <div>배송지명</div>
                        <div>
                            <input type="text" name="" id="addr-tag" value=shipAddrReceiver>
                        </div>
                    </div>
                    <div class="receiver-row">
                        <div>수취인</div>
                        <div>
                            <input type="text" name="" id="receiver">
                        </div>
                    </div>
                    <div class="addr-row">
                        <div>주소</div>
                        <div>
                            <div>
                                <button class="basic-btn basic-btn-active ripple">주소찾기</button>
                                <input type="text" name="" id="zip-code">
                            </div>
                            <input type="text" name="" id="addr-1">
                            <input type="text" name="" id="addr-2" placeholder="상세주소를 입력해주세요.">
                        </div>
                    </div>
                    <div class="phone-row">
                        <div>연락처</div>
                        <div>
                            <input type="tel" name="" id="phone-1"><span>─</span>
                            <input type="tel" name="" id="phone-2"><span>─</span>
                            <input type="tel" name="" id="phone-3">
                        </div>
                    </div>
                </div>
                <span class="message">배송지는 5개까지 등록됩니다.</span>
                <div class="btn-sets">
                    <div class="save-btn-set btn-set">
                        <button class="basic-btn btn-mod save-cancel-btn ripple">취소</button>
                        <button class="basic-btn basic-btn-active btn-mod modify-btn ripple" onclick="fn_updateAddr();">수정</button>
                    </div>
                    <div class="add-btn-set btn-set">
                        <button class="basic-btn btn-mod add-cancel-btn ripple">취소</button>
                        <button class="basic-btn basic-btn-active btn-mod add-btn ripple">추가</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <div class="modal-overlay"></div>
    <div class="user-modal">
        <div class="user-modal-header">
            <div class="close-btn">
                <i class="material-icons">clear</i>
            </div>
            <img class ="user-profile-pic" src="images/profile_pic_sample.jpg">
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
</body>
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

    //주소 선택 이벤트
    const deleteBtn = $('.delete-btn');
    const addrUnits = $('.addr-unit');
    $(() => {
        addrUnits.on('click', e => {
            if(deleteBtn.index(e.target) != -1) return;
            addrUnits.removeClass('addr-unit-selected');
            $(e.currentTarget).toggleClass('addr-unit-selected');
        });
    });


    //주소 삭제 이벤트
    $(() => {
        deleteBtn.on('click', e => {
            const flag = confirm('정말로 삭제하시겠습니까?');
            if(flag)
            {
                $(e.currentTarget).parent().remove();
            }
        });
    });

    $(() => {
        $('.save-cancel-btn').on('click', e =>{
            e.preventDefault();
        });

        $('.modify-btn').on('click', e => {
            e.preventDefault();
        });

        $('.add-btn').on('click', e => {
            e.preventDefault();
        });

        $('.add-cancel-btn').on('click', e =>{
            e.preventDefault();
        });

        $('.add-addr').on('click', () => {
            $('input').val("");
            $('.btn-set').toggle();
        });
    });

</script>

<script>
	function fn_updateAddr(){
		$("[name=addrFrm]").attr("action","${path}/member/memberAddress.do");
		addrFrm.submit();
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp">
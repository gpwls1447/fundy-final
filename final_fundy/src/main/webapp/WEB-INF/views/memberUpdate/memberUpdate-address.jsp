<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.fundy.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	ShippingAddr s=(ShippingAddr)request.getAttribute("s");
%>
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
            display: flex;
            margin-top: 40px;
        }

        .shipping-addr 
        {
            display: flex;
            width: 100%;
            flex-flow: column nowrap;
            align-items: center;
        }
        .shipping-addr > div{width: 570px; display: flex;}
        .shipping-addr > div:first-of-type{flex: 1 1 0;}
        .shipping-addr > div:last-of-type{flex: 5 1 0;}
        
        .addr-list-container
        {
            display: flex;
            margin: 15px 0 40px 0;
        }

        .addr-unit
        {
            border-radius: 20px;
            background-color: #aaa;
            padding: 7px 27px;
            margin-right: 10px;
            color: rgb(243, 243, 243);
            font-size: 15px;
            cursor: pointer;
            position: relative;
        }

        .delete-btn
        {
            position: absolute;
            right: -3px;
            top: -3px;
            background-color: rgb(124, 21, 52);
            border-radius: 50%;
            font-size: 15px;
            padding: 2px;
        }

        .add-addr
        {
            background-color: rgba(44, 141, 145, 0.87);
            display: flex;
            align-items: center;
            justify-content: center;
            width: 37px;
            height: 37px;
            color: rgb(235, 235, 235);
            border-radius: 50%;
            cursor: pointer;
        }

        .addr-inputs
        {
            display: flex;
            flex-flow: column nowrap;
        }

        .addr-inputs > div {display: flex; margin: 10px 0;}
        .addr-inputs > div > div:first-of-type{flex: 1 1 0; font-weight: bold;}
        .addr-inputs > div > div:last-of-type{flex: 5 1 0;}
        .addr-inputs input {width: 190px; height: 31px; padding: 0 6px;}
        
        .addr-row input {margin: 5px 0;}

        .addr-row > div:last-of-type
        {
            display: flex;
            flex-flow: column nowrap;
        }
        .addr-row button
        {
            margin: 5px 10px 5px 0;
            padding: 6px 15px 6px 15px;
            transform: translateY(-1px);
        }

        #zip-code {width: 97px;}
        .addr-row input {width: 422px;}
        .phone-row input {width: 124px;}
        .phone-row span {margin: 0 5px;}

        .addr-unit-selected
        {
            background-color: var(--basic-color);
        }

        .message
        {
            font-size: 14px;
            margin: 30px;
        }

        .btn-sets
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
        }

        .add-btn-set
        {
            display: none;
        }

        .btn-mod
        {
            margin: none;
            padding: 10px 35px;
        }


</style>

<section class="section">
        <div class="memberupdate-header">회원정보 수정</div>
        <div class="memberupdate-nav">
            <div><a href="${pageContext.request.contextPath}/member/memberUpdateView.do">기본정보수정</a></div>
            <div><a href="${pageContext.request.contextPath}/member/memberPwView.do">비밀번호변경</a></div>
            <div><a href="${pageContext.request.contextPath}/member/memberAddressView.do">배송지관리</a><span class="indicator"></span></div>
            <div><a href="${pageContext.request.contextPath}/member/memberDeieteView.do">회원탈퇴</a></div>
        </div>
        <hr id="divider" />
        <div class="memberupdate-body">
            <form action="${pageContext.request.contextPath}/member/memberAddress.do" method="post" class="shipping-addr" name="addrFrm">
                <div class="addr-list-container">
                	<c:forEach items="${list }" var="list" varStatus="addr">
	                    <div data-index="${addr }" class="addr-unit ${addr.index == 0 ? 'addr-unit-selected' : ''}">${list.shippAddrTag }<i class="material-icons delete-btn">close</i></div>                   
                    </c:forEach>
                    
                    <div class="add-addr tooltip"><i class="material-icons">add</i>
                        <span class="tooltiptext">새 배송지</span>
                    </div>
                </div>
                
                
                <div class="addr-inputs">
                    <div class="addr-tag-row">
                        <div>배송지명</div>
                        <div>
                            <input type="text" name="shipAddrTag" id="addr-tag" value="${s.shipAddTag }">
                        </div>
                    </div>
                    <div class="receiver-row">
                        <div>수취인</div>
                        <div>
                            <input type="text" name="shipAddrReceiver" id="receiver" value="">
                        </div>
                    </div>
                    <div class="addr-row">
                        <div>주소</div>
                        <div>
                            <div>
                                <button class="basic-btn basic-btn-active ripple">주소찾기</button>
                                <input type="text" name="zipCode" id="zip-code" >
                            </div>
                            <input type="text" name="shipAddr" id="addr-1" value="">
                            <input type="text" name="shipAddrDetail" id="addr-2" placeholder="상세주소를 입력해주세요." value="">
                        </div>
                    </div>
                    <div class="phone-row">
                        <div>연락처</div>
                        <div>
                            <input type="tel" name="phone1" id="phone-1" value=""><span>─</span>
                            <input type="tel" name="phone2" id="phone-2" value=""><span>─</span>
                            <input type="tel" name="phone3" id="phone-3" value="">
                        </div>
                    </div>
                    <%-- <c:set var="loggedMember" value="${sessionScope.loggedMember }"/> --%>
                    <div id="email" style="display:none;">${loggedMember.memberEmail}</div>
                    <input type="hidden" id="memberEmail" name="memberEmail">
                </div>
                

                <span class="message">배송지는 5개까지 등록됩니다.</span>
                <div class="btn-sets">
                    <div class="save-btn-set btn-set">
                        <button class="basic-btn btn-mod save-cancel-btn ripple">취소</button>
                        <button class="basic-btn basic-btn-active btn-mod modify-btn ripple" onclick="update();">수정</button>
                    </div>
                    <div class="add-btn-set btn-set">
                        <button class="basic-btn btn-mod add-cancel-btn ripple">취소</button>
                        <button class="basic-btn basic-btn-active btn-mod add-btn ripple" onclick="send();">추가</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
                <script>
                	function send(){
                		$("#memberEmail").val($("#email").html());
                	}
                </script>
                
                <script>
                	function update(){
                		
                	}
                </script>
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
        	$(".shipping-addr").attr("action","${pageContext.request.contextPath}/member/memberAddressInsert.do");
        	$(".shipping-addr").submit();
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
		addrFrm.submit();
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
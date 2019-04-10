<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
    .option-header
    {
        width: 100%;
        height: auto;
        display: flex;
        justify-content: center;
        position: relative;
        margin: 50px 0;
    }

    .project-title
    {
        font-size: 30px;
        font-weight: bold;
    }

    .go-back
    {
        position: absolute;
        left: -9px;
        font-size: 15px;
        cursor: pointer;
    }

    .go-back > i
    {
        transform: translateY(8px);
        font-size: 28px;
    }

    .option-container
    {
        border: 1px solid #ccc;
        margin-top: 30px;
        padding: 20px;
        display: flex;
        flex-flow: column nowrap;
        align-items: center;
        cursor: pointer;
        transition: 150ms linear;
    }

    .option-container > div{width: 40%;}

    .option-price
    {
        font-size: 23px;
        font-weight: bold;
        color: var(--basic-color);
    }

    .option-detail{margin: 10px 0;}

    .ship-date
    {
        font-size: 14px;
        display: flex;
    }

    .divider
    {
        display: block;
        margin: 0 15px 5px 15px;
        font-size: 12px;
    }

    .date{font-weight: bold;}

    .amount{display: flex;}

    .amount-control
    {
        display: flex;
        margin-left: 15px;
    }

    .amount-control div
    {
        width: 33px;
        height: 33px;
        border: 1px solid #ccc;
        background-color: rgb(245, 245, 245);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 25px;
        border-radius: 3px;
        transition: .2s linear;
    }

    .amount-control div:hover{background-color: rgb(219, 219, 219);}

    .amount-control div > i
    {
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .amount-input
    {
        box-sizing: border-box;
        border: 1px solid #ccc;
        width: 60px;
        height: 35px;
        margin: 0 13px;
        border-radius: 3px;
        text-align: center;
    }

    hr
    {
        margin: 20px 0;
        display: block;
        height: 1px;
        border: 0;
        border-top: 1px solid #ccc;
        padding: 0; 
    }

    .option-container:hover{box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.2);}

    .selected
    {
        border: 2px solid var(--basic-color);

    }

    .sub-title
    {
        font-size: 25px;
        font-weight: bold;
    }

    .donate-more
    {
        width: 100%;
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        padding: 50px 0;
        display: flex;
        align-items: center;
        margin-top: 50px;
    }

    .donate-more > div:nth-of-type(2){flex: 1 1 0;}
    .donate-more > div:nth-of-type(3){flex: 3 1 0;}
    
    .donate-more span
    {
        font-size: 21px;
        color: var(--basic-color);
        margin-left: 10px;
        font-weight: bold;
    }

    .extra-container
    {
        display: flex;
        align-items: center;
        margin-top: 20px;
    }

    #extra-input
    {
        width: 150px;
        height: 25px;
    }
    
    .publicity > div:nth-of-type(2){flex: 1 1 0;}
    .publicity > div:nth-of-type(3){flex: 3 1 0;}

    .publicity
    {
        width: 100%;
        border-bottom: 1px solid #ccc;
        padding: 50px 0;
        display: flex;
        align-items: center;
    }

    .check-private
    {
        display: flex;
        align-items: center;
        color: var(--basic-color);
        font-weight: bold;
        font-size: 18px;
        margin: 20px 0;
    }

    .check-private > label {margin-right: 15px;}

    .select-icon
    {
        padding: 6px 30px;
        background-color: rgb(240, 240, 240);
        border-radius: 25px;
        color: gray;
        margin-right: 15px;
    }

    .total-price-declare
    {
        display: flex;
        justify-content: center;
        font-size: 35px;
        font-weight: bold;
        margin: 50px 0;
    }

    .total-price{color: var(--basic-color); margin: 0 15px;}

    .btn-container
    {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-bottom: 100px;
    }

    .btn-container > button{font-size: 16px; padding: 8px 30px}

</style>
<section class="section">
    <div class="option-header">
        <div class="go-back" onclick="location.href='${path}/projectListDetail.do?projectNo=${project.projectNo}'"><i class="material-icons">chevron_left</i>프로젝트로 돌아가기</div>
        <div class="project-title">${project.projectTitle }</div>
    </div>
    <c:forEach items="${project.foList }" var="foList" varStatus="vs">
    <div data-package-no="${vs.index}" class="option-container">
        <div>
            <div class="option-price">${foList.fundPrice }</div>
            <div class="option-detail">
            <c:forEach items="${foList.odList }" var="odList" varStatus="ivs">
            	${odList.packageName } X ${odList.packageAmount }ea
            	${!ivs.last ? "<br>" : ""}
            </c:forEach>
            </div>
            <fmt:formatDate value="${foList.deliveryDate }" var="dDate" pattern="yyyy년 MM월 dd일"/>
            <div class="ship-date">예상 발송일<span class="divider">|</span><span class="date">${dDate }</span></div>
            <hr>
            <div class="amount">
                <div>수량</div>
                <div class="amount-control">
                    <div class="minus"><i class="material-icons">remove</i></div>
                    <input type="text" name="" class="amount-input" value="1" readonly>
                    <div class="plus"><i class="material-icons">add</i></div>
                </div>
            </div>
        </div>        
    </div>
    </c:forEach>

    <div class="donate-more">
        <div class="select-icon">선택</div>
        <div class="sub-title">후원금 더하기</div>
        <div>
            <div>후원금을 더하여 펀딩할 수 있습니다. 추가후원금을 입력하시겠습니까?</div>
            <div class="extra-container"><input type="text" name="" id="extra-input"><span>원을 추가로 후원합니다.</span></div>
        </div>
    </div>
    <div class="publicity">
        <div class="select-icon">선택</div>
        <div class="sub-title">공개 여부</div>
        <div>
            <div>후원자 목록에 참여자 이름과 후원금액이 공개됩니다.<br>혹시 익명으로 후원하고 싶으시다면, 비공개로 선택해주세요.</div>
            <div class="check-private">
                <input type="checkbox" name="" id="cb" class="cb">
                <label for="cb"><span></span></label>비공개
            </div>
        </div>
    </div>
    <div class="total-price-declare">총금액 <span class="total-price">19,800</span> 원을 결제합니다.</div>
    <div class="btn-container">
        <button class="basic-btn">이전</button>
        <button class="basic-btn basic-btn-active">다음단계로</button>    
    </div>
</section>
<script>
    const plusBtn = $('.plus')
    const minusBtn = $('.minus')
	
    //옵션 선택 이벤트 함수
    const options = $('.option-container');
    $(() => {
        options.on('click', e => {
            if(plusBtn.children().index(e.target) > -1
                || minusBtn.children().index(e.target) > -1 
                || $('.amount-input').index(e.target) > -1) return;
            if(options.is('.selected')) options.removeClass('selected');
            $(e.currentTarget).toggleClass('selected');
        });
    });
	
   	//수량 이벤트 함수
    $(() => {
        plusBtn.on('click', e => {
            const targetInput = $(e.currentTarget).siblings('.amount-input');
            if(targetInput.val() == '10') return;
            targetInput.val(parseInt(targetInput.val())+1);
        });

        minusBtn.on('click', e => {
            const targetInput = $(e.currentTarget).siblings('.amount-input');
            if(targetInput.val() == '1') return;
            targetInput.val(parseInt(targetInput.val())-1);
        });
    });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
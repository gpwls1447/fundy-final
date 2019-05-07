<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
	.mypage-header
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	    font-size: 30px;
	    font-weight: bold;
	    margin: 40px 0;
	}
	
	.mypage-nav
	{
	    width: 100%;
	    display: flex;
	    justify-content: center;
	}
	
	.mypage-nav > div
	{
	    margin: 0 20px;
	    font-size: 17px;
	    position: relative;
	    cursor: pointer;
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
	    margin: 7px 0 0 0;
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
	
	.mypage-body
	{
	    display: flex;
	    margin-top: 40px;
	    
	}
	
	
	/* 페이지 토글 부분 */
	
	.major-category-toggle
	{
	    display: flex;
	    flex-flow: column nowrap;
	    position: relative;
	    width: 50px;
	}
	
	.major-category-toggle > div {margin-bottom: 25px; line-height: 18px; cursor: pointer;}
	
	.divider-2
	{
	    display: block;
	    position: absolute;
	    width: 1px;
	    height: 65px;
	    top: 0;
	    right: 0;
	    background-color: #ccc;
	}
	
	.indicator-2
	{
	    display: block;
	    position: absolute;
	    width: 5px;
	    height: 22px;
	    top: 0;
	    right: 0;
	    background-color: rgb(76, 168, 228);
	    transition: .3s ease;
	}
	
	/* 프로젝트 리스트 부분 */
	
	.proj-list-wrapper
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	    margin-left: 30px;
	}
	
	.project-count
	{
		font-size: 21px;
		font-weight: bold;
		margin: 20px 0 50px 0;
	}
	.proj-list-header
	{
	    width: 100%;
	    display: flex;
	    justify-content: flex-end;
	    align-items: center;
	}
	
	.proj-list-header > span
	{
	    font-size: 15px;
	    font-weight: bold;
	}
	
	.proj-search-container
	{
	    display: flex;
	    align-items: center;
	    margin: 0 15px;
	}
	
	.proj-search-container i
	{  
	    font-size: 32px;
	    line-height: 33px;
	    margin-bottom: -4px;
	    color: gray;
	}
	
	.proj-search
	{
	    border: none;
	    border-bottom: 1px solid #ccc;
	    padding: 3px 0;
	    width: 150px;
	}
	
	.proj-list-order
	{
	    display: flex;
	    justify-content: flex-end;
	}
	
	.proj-list-order > select
	{
	    padding: 3px 8px;
	    margin-right: 10px;
	}
	
	.proj-list-box
	{
	    width: 100%;
	    display: flex;
	    padding: 23px;
	    box-sizing: border-box;
	    margin: 20px 0;
	    border: 1px solid #ccc;
	    position: relative;
	    cursor: pointer;
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
	
	.status-tag
	{
	    position: absolute;
	    left: 0;
	    top: 0;
	    padding: 10px 20px;
	    font-weight: bold;
	    font-size: 19px;
	    line-height: 19px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	}
	
	.examining{background-color: rgb(220, 177, 7); color: white;}
	.open{background-color: var(--basic-color); color: white;}
	.closed{background-color: #666; color: white;}
	.denied{background-color: rgb(211, 84, 0); color: white;}
	
	.info-empty
	{
		padding: 30px 100px;
		border: 1px solid #444;
		display: flex;
		flex-flow: column nowrap;
		align-items: center;
		margin: 60px 0 45px 0;
	}
	
	.info-empty > i
	{
		font-size: 45px;
	}
	
	.donation-list
	{
		width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	    margin-bottom: 20px;
	}
	
	.donation-list-header
	{
	    width: 100%;
	    display:flex;
	    border-top: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	    color: rgb(26, 87, 128);
	    padding: 20px 0;
	    box-sizing: border-box;
	}
	
	.donation-list-header > div
	{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.donation-list-header > div:nth-of-type(1){flex: 2 1 0;}
	.donation-list-header > div:nth-of-type(2){flex: 3 1 0;}
	.donation-list-header > div:nth-of-type(3){flex: 1 1 0;}
	.donation-list-header > div:nth-of-type(4){flex: 1 1 0;}
	.donation-list-header > div:nth-of-type(5){flex: 2 1 0;}
	.donation-list-header > div:nth-of-type(6){flex: 1 1 0;}
	
	.donation-list-row
	{
	    width: 100%;
	    display: flex;
	    border-bottom: 1px solid #ccc;
	    box-sizing: border-box;
	}
	
	.donation-list-row > div
	{
	    display: flex;
	    justify-content: center;
	    align-items: center;
	}
	
	.donation-list-row img
	{
	    object-fit: fill;
	    width: 70%;
	    height: 70%;
	}
	
	.donation-list-row > div:nth-of-type(1){flex: 2 1 0;}
	.donation-list-row > div:nth-of-type(2){flex: 3 1 0;}
	.donation-list-row > div:nth-of-type(3){flex: 1 1 0;}
	.donation-list-row > div:nth-of-type(4){flex: 1 1 0;}
	.donation-list-row > div:nth-of-type(5){flex: 2 1 0;}
	.donation-list-row > div:nth-of-type(6){flex: 1 1 0;}

</style>    
    <section class="section">
        <div class="mypage-header">마이페이지</div>
        <div class="mypage-nav">
            <div onclick="location.href='${path}/myPage/myProjectList.do?memberEmail=${loggedMember.memberEmail }'">
            	내 프로젝트
            </div>
            <div onclick="location.href='${path}/myPage/myDonationList.do?memberEmail=${loggedMember.memberEmail }'">
            	내 후원내역<span class="indicator"></span>
            </div>
        </div>
        <hr id="divider" />
        <div class="mypage-body">
            <div class="major-category-toggle">
                <div>후원</div>
                <div>펀딩</div>
                <span class="divider-2"></span>
                <span class="indicator-2"></span>
            </div>
            <div class="proj-list-wrapper">
				<span class="project-count">총 ${totalCount }건 후원하셨습니다.</span>
				<div class="donation-list">
			        <div class="donation-list-header">
			            <div>프로젝트 사진</div>
			            <div>프로젝트 이름</div>
			            <div>상태</div>
			            <div>마감일</div>
			            <div>기부일</div>
			            <div>기부금액</div>
			        </div>
			       	<c:forEach items="${list }" var="list">
			        <div class="donation-list-row">
			            <div>
			                <img src="${path}/resources/projectRepresent/${list.projectThumnail }">
			            </div>
			            <div>${list.projectTitle }</div>
			            <div>${list.projectStatName }</div>
			            <fmt:formatDate value="${list.endDate }" var="endDate" pattern="yyyy/MM/dd"/>
			            <div>${endDate }</div>
			            <fmt:formatDate value="${list.funderDate}" var="funderDate" pattern="yyyy/MM/dd hh:mm"/>			            
			            <div>${funderDate }</div>
			            <div>${list.fundPrice * list.packageAmount + list.extraMoney}￦</div>
			        </div>
			       	</c:forEach>
			    </div>
        		<c:if test="${fn:length(list) != 0}">
				${pageBar }
				</c:if>
            </div>
        </div>
    </section>
<script>
	/* 페이지 바 함수 */
	const fn_paging = cPage => {
		location.href='${path}//myPage/myDonationList.do?cPage='+cPage+'&memberEmail=${loggedMember.memberEmail}';
	};
	
	//후원/펀딩 옵션 토글
	const majorCategoryBtn = $('.major-category-toggle > div');
    $(() => {
        majorCategoryBtn.on('click', e => {
            $('.indicator-2').css('top', e.currentTarget.offsetTop);
        });
    });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
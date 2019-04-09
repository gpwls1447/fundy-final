<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="now" value="<%=new java.util.Date()%>"/>
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="parsedNow"/>

 <style>       
	.proj-list-wrapper
	{
	    width: 1005px;
	
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
		margin-top: 100px;
	    width: 100%;
	    display: flex;
	    justify-content: flex-end;
	    box-sizing: border-box;
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
	    transition: .2s linear;
	}
	
	.proj-list-box:hover
	{
		box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.2);
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
<section class="section">
	<div class="proj-list-wrapper">
		<c:if test="${keyword != null && keyword eq ''}">
        	<div class="proj-search-result">[${keyword }] 에 대한 검색 결과</div>
		</c:if>
        <div class="proj-list-order">
            <select name="projectStatCode" id="projectStatCode">
                <option value="PS03" ${projectStatCode eq "PS03" ? "selected" : "" }>진행중</option>
                <option value="PS04" ${projectStatCode eq "PS03" ? "" : "selected" }>종료</option>
            </select>
            <select name="orderby" id="orderby">
                <option value="null" disabled>정렬</option>
                <option value="funderNo" ${orderby eq "funderNo" ? "selected" : "" }>후원자순</option>
                <option value="reachRate" ${orderby eq "reachRate" ? "selected" : "" }>달성율순</option>
                <option value="endDate" ${orderby eq "endDate" ? "selected" : "" }>마감임박순</option>
                <option value="reach" ${orderby eq "reach" ? "selected" : "" }>달성액순</option>
            </select>
        </div>
	      
        <c:forEach items="${list }" var="list">
        <div data-project-no="${list.projectNo }" class="proj-list-box">
            <div class="proj-list-thumnail">
                <img src="${path }/resources/projectIntroImages/${list.projectThumnail}">
            </div>
            <div class="proj-list-body">
                <div class="proj-list-title">${list.projectTitle }</div>
                <div class="proj-creator">${list.memberNick }</div>
                <hr>
                <div class="proj-brief">${list.projectSumary }</div>
                <div class="proj-progbar-container">
                    <div class="proj-progbar-emtpy"></div>
                    <div class="proj-progbar-filled" style="width:${list.reachRate > 100 ? 100 : list.reachRate}%"></div>
                    <div class="proj-progbar-info">
                        <span>${list.reachRate }%</span>
                        <span>${list.reach }￦</span>
						<c:set var="endDate" value="${list.endDate }"/>
						<fmt:formatDate var="endTime" value="${endDate }" pattern="yyyyMMdd"/>
						<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="parsedEnd"/>
                        <span>${parsedNow - parsedEnd + -2*(parsedNow - parsedEnd) > -1 ? parsedNow - parsedEnd + -2*(parsedNow - parsedEnd) : "0"}일 </span>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
		${pageBar }
    </div>
</section>
<script>
	
	/* 페이지 바 함수 */
	const fn_paging = cPage => {
		location.href='${path}/projectList/projectList.do?cPage='+cPage+'&majorCode=${majorCode}&midCode=${midCode}&projectStatCode='+$('#projectStatCode option:selected').val()+'&orderby=${orderby}';
	};
	
	/* 프로젝트 카테고리/정렬 이벤트 */
	
	$(() => {
		$('#projectStatCode').on('change', () => {
			location.href='${path}/projectList/projectList.do?majorCode=${majorCode}&midCode=${midCode}&projectStatCode='+$('#projectStatCode option:selected').val()+'&orderby=${orderby}';
		});
	});
	
	$(() => {
		$('#orderby').on('change', () => {
			location.href='${path}/projectList/projectList.do?majorCode=${majorCode}&midCode=${midCode}&projectStatCode='+$('#projectStatCode option:selected').val()+'&orderby='+$('#orderby option:selected').val();
		});
	});
	
	const projBox = $('.proj-list-box');
	$(() => {
		projBox.on('click', e => {
			location.href='${path}/projectList/projectListDetail.do?projectNo='+$(e.currentTarget).data('projectNo');
		});
	});
	
	$(() => {
		$('.nav').css('display', 'flex');
	});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
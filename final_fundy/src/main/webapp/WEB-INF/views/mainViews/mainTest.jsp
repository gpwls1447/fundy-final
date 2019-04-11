<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>   
        /* 메인 섹션 */
        
        .main-slide-header
        {
            position: absolute;
            width: auto;
            height: auto;
            padding: 10px 15px;
            margin-top: 20px;
            margin-left: 10px;
            background-color: rgba(255, 255, 255, 0.6);
            z-index: 0;
            font-size: 13px;
            border-radius: 2px;
        }

        .main-slide
        {
            position: absolute;
            left: 0;
            width: 100%;
            min-width: 1005px;
            height: 300px;
        }

        .main-slide-container
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
            position: relative;
        }

        .main-image-track
        {
            width: 100%;
            height: 100%;
            white-space: nowrap;
            position: absolute;
            left: -100%;
            z-index: -1;
        }

        .main-image-track img
        {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .main-slide-container:hover .main-slide-btn
        {
            opacity: .7;
        }

        .main-slide-btn
        {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 100px;
            height: 100px;
            opacity: 0;
            transition: 200ms linear;
            cursor: pointer;
        }

        .main-slide-btn--left
        {
            left: 0;
        }

        .main-slide-btn--right
        {
            right: 0;
        }

        .main-slide-navbar > ul
        {
            margin-top: -40px;
            list-style: none;
            display: flex;
            justify-content: center;
        }

        .main-slide-navbar > ul > li
        {
            margin: 0 3px;
            width: 11px;
            height: 11px;
            background-color: white;
            opacity: .6;
            border-radius: 50%;
            cursor: pointer;
            transition: 100ms ease;
        }

        .main-slide-navbar > ul > li:hover
        {
            opacity: .8;
            transform: scale(1.3);
        }

        .main-current-dot
        {
            opacity: 1 !important;
            z-index: 1;
        }

        .popular-proj
        {
            margin-top: 330px;
        }
        
        .popular-nav
        {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
        }

        .proj-section-header
        {
            padding: 30px 10px 20px 10px;
            font-size: 21px;
            color: var(--basic-color);
            margin-top: 30px;
            font-weight: bold;
        }

        .proj-container
        {
            width: calc(100% - 20px);
            height: auto;
            margin-left: 10px;
            display: flex;           
        }

        .proj-box
        {
            margin: 0 10px;
            border-bottom: 1px solid rgb(224, 224, 224); 
            padding-bottom: 30px;
        }

        .proj-box:first-of-type{margin-left: 0;}
        .proj-box:last-of-type{margin-right: 0;}

        .proj-thumnail
        {
            width:231px;
            height:145px;
        }

        .proj-title
        {
            font-weight: bold;
            margin-top: 5px;
            margin-bottom: 10px;
            font-size: 19px;
        }

        .proj-title > a
        {
            text-decoration: none;
            color: #444;
        }

        .proj-creator
        {
            font-size: 15px;
            color: gray;
            display: flex;
        }

        .proj-progbar-container
        {
            display: flex; flex-flow: column;
            position: relative;
        }

        .progbar-empty
        {
            width: 100%;
            height: 3px;
            background-color: #bbb;
            margin: 10px 0;
        }

        .progbar-filled
        {
            position: absolute;
            top: 0;
            width: 87%;
            height: 3px;
            background-color: var(--basic-color);
            margin: 10px 0;
        }

        .progbar-info
        {
            display: flex;
            justify-content: space-between;
        }

        .progbar-info > span
        {
            display: block;
            font-size: 13px;
        }
</style>
<script>
$(function () {
	$("#viewLoading").hide();
});

function fn_loadedList(midCode) {
	$("#viewLoading").fadeIn(500);
	$.ajax({
		url: "${path }/main/changePopCtg.do?midCode=" + midCode,
		dataType: "html",
		success: function(data) {
			$(".ctg-populerList").html(data);
			$("#viewLoading").fadeOut(500);
		}
	});
}

function fn_seeProjectView(projectNo) {
	location.href="${path}/projectList/projectListDetail.do?projectNo=" + projectNo;
}
</script>
<section class="section">
	<div class="main-slide-header">
            에디터 프로모션
    </div>
        <div class="main-slide">
            <div class="main-slide-container">
                <img src="${path }/resources/images/slide_nav_left_white.png" class="main-slide-btn main-slide-btn--left">
                <div class="main-image-track">
	                <img src="${path }/resources/images/main_slide_01.jpg" alt="" class="main-current-slide">
	                <img src="${path }/resources/images/main_slide_02.jpg" alt="">
	                <img src="${path }/resources/images/main_slide_03.jpg" alt="">
	                <img src="${path }/resources/images/main_slide_04.jpg" alt="">
                </div>
                <img src="${path }/resources/images/slide_nav_right_white.png" class="main-slide-btn main-slide-btn--right">
            </div>
            <div class="main-slide-navbar">
                <ul>
                    <li class="main-current-dot"></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </div>
        <div class="proj-section-wrapper popular-proj">
            <div class="proj-section-header">카테고리별 인기 프로젝트</div>
            <div class="popular-nav">
            	<c:forEach items="${midCList}" var="mc" varStatus="vs">
                	<c:if test="${mc.majorCode eq majorCategory }">
	                	<button class="basic-btn <c:if test="${vs.count eq 1 }">basic-btn-active</c:if>" onclick="fn_loadedList('${mc.midCode }')">${mc.midName }</button>                		
					</c:if>
				</c:forEach>
            </div>
			<div class="proj-container ctg-populerList">
			<c:import url="projMainFrame.jsp">
				<c:param name="cho" value="pop"></c:param>
			</c:import>
			</div>
        </div>
        <div class="proj-section-wrapper">
            <div class="proj-section-header">새 프로젝트</div>
            <div class="proj-container">
	            <c:import url="projMainFrame.jsp">
					<c:param name="cho" value="new"></c:param>
				</c:import>
            </div>
        </div>
        <div class="proj-section-wrapper">
            <div class="proj-section-header">임박 프로젝트</div>
            <div class="proj-container">
                <c:import url="projMainFrame.jsp">
					<c:param name="cho" value="soon"></c:param>
				</c:import>
            </div>
        </div>
</section>
<div id='viewLoading' class="spinner-border" style="width:150px; height:150px; position: fixed; top: 250px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
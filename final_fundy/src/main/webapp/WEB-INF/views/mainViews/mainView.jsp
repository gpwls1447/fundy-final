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
        	display:flex;
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
            border: 1px solid rgb(224, 224, 224); 
            cursor: pointer;
            transition: 0.2s linear;
        }
        
        .proj-box:hover
        {
         	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.1);
        }

        .proj-box:first-of-type{margin-left: 0;}
        .proj-box:last-of-type{margin-right: 0;}

        .proj-thumnail
        {
            width: 100%;
            height:145px;
        }
        
        .proj-body
        {
        	padding: 15px;
        	display: flex;
        	flex-flow: column nowrap;
        	justify-content: flex-end;
        }
        

        .proj-title
        {
        	width: 199.250px;
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 16px;
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .proj-title > a
        {
            text-decoration: none;
            color: #444;
        }

        .proj-creator
        {
            font-size: 14px;
            color: #999;
            display: flex;
            margin-bottom: 25px;
        }

        .proj-progbar-container
        {
            display: flex; flex-flow: column;
            position: relative;
        }
        
        .progress
        {
        	margin: 10px 0;
        }

        .progbar-empty
        {
            width: 100%;
            height: 3px;
            background-color: #bbb;
        }

        .progbar-filled
        {
            position: absolute;
            top: 0;
            width: 87%;
            height: 3px;
            background-color: var(--basic-color);
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
        
        .proj-section-header-text-area {
        	width:25%;
        }
        .proj-section-header-pagination-area {
        	width:75%;
        }
        div.proj-section-header-pagination-area a.paging {
        	padding-left: 12px;
        	padding-right: 12px;
        	color:black;
        }
        div.proj-section-header-pagination-area span.paging {
        	padding-left: 12px;
        	padding-right: 12px;
        	color:black;
        }
</style>
<script>
$(function () {
	$("#viewLoading").hide();
	$(".basic-btn").eq(0).addClass("basic-btn-active");
	$(".basic-btn").eq(0).click();
});

function fn_loadedList(midCode, majorCode) {
	$("#viewLoading").fadeIn(125);
	$.ajax({
		url: "${path }/main/changePopCtg.do?midCode=" + midCode + "&majorCategory=" + majorCode,
		dataType: "html",
		success: function(data) {
			$(".ctg-populerList").html(data);
			$("#viewLoading").fadeOut(125);
		}
	});
}

function fn_seeProjectView(projectNo) {
	location.href="${path}/projectList/projectListDetail.do?projectNo=" + projectNo;
}

function fn_paging(condition) {
	$("#viewLoading").fadeIn(125);
	var cPage = Number($(event.target).parents().children(".cPage").val());
	var choice = $(event.target).parents().children(".choice").val();
	var index;
	if(choice=='new') {
		index = 1;
	}
	else if(choice=='soon'){
		index = 2;
	}
	$.ajax({
		url: "${path }/main/changePaging.do?choice=" + choice + "&cPage=" + cPage + "&condition=" + condition + "&majorCode=${majorCode }",
		dataType: "html",
		success: function(data) {
			$(".proj-section-wrapper").eq(index).html(data);
		}
	});
	$("#viewLoading").fadeOut(125);
};
</script>
<section class="section">
	<div class="main-slide-header">
            에디터 프로모션
    </div>
        <div class="main-slide">
            <div class="main-slide-container">
                <img src="${path }/resources/images/slide_nav_left_white.png" class="main-slide-btn main-slide-btn--left">
                <div class="main-image-track"
                	><img src="${path }/resources/images/main_slide_01.jpg" alt="" class="main-current-slide"
	                ><img src="${path }/resources/images/main_slide_02.jpg" alt=""
	                ><img src="${path }/resources/images/main_slide_03.jpg" alt=""
	                ><img src="${path }/resources/images/main_slide_04.jpg" alt=""
	                ></div>
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
            <div class="proj-section-header">
            	<div>카테고리별 인기 프로젝트</div>
            </div>
            <div class="popular-nav">
            	<c:forEach items="${midCList}" var="mc" varStatus="vs">
                	<c:if test="${mc.majorCode eq majorCode }">
	                	<button class="basic-btn" onclick="fn_loadedList('${mc.midCode }', '${mc.majorCode }')">${mc.midName }</button>                		
					</c:if>
				</c:forEach>
            </div>
			<div class="proj-container ctg-populerList">
			<c:import url="popFrame.jsp">
				<c:param name="cho" value="pop"></c:param>
			</c:import>
			</div>
        </div>
        <div class="proj-section-wrapper">
			<c:import url="frame.jsp">
				<c:param name="cho" value="new"></c:param>
			</c:import>
        </div>
        <div class="proj-section-wrapper">
			<c:import url="frame.jsp">
				<c:param name="cho" value="soon"></c:param>
			</c:import>
        </div>
</section>
<div id='viewLoading' class="spinner-border" style="width:150px; height:150px; position: fixed; top: 250px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
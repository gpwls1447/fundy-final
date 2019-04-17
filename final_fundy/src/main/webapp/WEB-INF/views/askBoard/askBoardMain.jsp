<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
       .support-board-title
        {
            display: flex;
        }

        .support-board-title p:first-of-type
        {
            margin: 25px 0;
            font-size: 25px;
        }
        .support-board-title p:last-of-type
        {
            margin: 34px 20px;
            font-size: 15px;
        }

        .support-board-rows
        {
            border-top: 2px solid rgb(38, 85, 139);
            font-size: 12px;
        }

        .support-board-header
        {
            display: flex;
        }

        .support-board-header > div
        {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 17px 0;
        }

        .support-board-header > div:nth-of-type(1){flex: 1 1 0;}
        .support-board-header > div:nth-of-type(2){flex: 4 1 0;}
        .support-board-header > div:nth-of-type(3){flex: 10 1 0;}
        .support-board-header > div:nth-of-type(4){flex: 3 1 0;}
        .support-board-header > div:nth-of-type(5){flex: 1 1 0;}


        .support-board-cols
        {
            display: flex;

        }

        .support-board-cols > div
        {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 15px 0;
            border-top: 1px solid rgb(230, 230, 230);
        }

        .support-board-cols:last-of-type
        {
            border-bottom: 1px solid rgb(38, 85, 139);
        }

        .support-board-cols > div:nth-of-type(1){flex: 1 1 0;}
        .support-board-cols > div:nth-of-type(2){flex: 4 1 0;}
        .support-board-cols > div:nth-of-type(3){flex: 10 1 0;}
        .support-board-cols > div:nth-of-type(4){flex: 3 1 0;}
        .support-board-cols > div:nth-of-type(5){flex: 1 1 0;color: #aaa;}
        
        .memberupdate-header
        {
            width: 100%;
            display: flex;
            justify-content: center;
            font-size: 27px;
            font-weight: bold;
            margin: 30px 0;
        }
        
        .memberupdated-nav
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
        
        a:link { color: black; text-decoration: none;}
	 	a:visited { color: black; text-decoration: none;}
	 	a:hover { color: black; text-decoration: none;}

		.support-notice-view-btns
        {
            display: flex;
            justify-content: flex-end;
            padding: 10px 0;
        }
		
		#addBtn{
		 color: white;
            background-color: rgb(18, 97, 149);
            width: 150px;
            height: 45px;
            align-self: flex-end;
            margin: 20px 0;
            border: none;

            border-radius: 2px;
            cursor: pointer;
		}
		#askCom
		{
			color: rgb(18, 97, 149);
		}
		#askRd
		{
			color: #ccc;
		}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section class="section">
       <div class="board-header">게시판</div>
        <div class="board-nav">
            <div><a href="${pageContext.request.contextPath}/askBoardMain.do">1대1게시판</a><span class="indicator"></span></div>
            <div><a href="${pageContext.request.contextPath}/noticeMain.do">공지사항</a></div>
        </div>

        <hr id="divider"/>
      <div class="support-board-title">
         <p></p>
        </div>
        <div class="support-board-rows">
            <div class="support-board-header">
                <div>번호</div>
                <div>작성자</div>
                <div>제목</div>
                <div>작성일</div>
                <div>상태</div>
            </div>
             <c:forEach items="${list }" var="askB">
            <div class="support-board-cols">
                <div>${askB.ASKNO}</div>
                <div>${askB.ASKWRITER }</div>
                <div><a href="${path}/askBoardView.do?askNo=${askB.ASKNO}">${askB.ASKTITLE }</a></div>
                <div>
                	${askB.ASKDATE }<!-- 형변환이 안됨 질문해야됨 -->
                </div>
                <!-- 리턴값을 모두 맵으로 바꾸고 맵퍼의 리절드 타입을 맵으로 바꾸고 나머지 .뒤에 대문자로 바꾸기 -->
                <c:if test="${askB.REPLY >=1}">
                	<div id="askCom">답변완료</div>
                </c:if>
                <c:if test="${askB.REPLY ==0}">
                	<div id="askRd">대기중</div>
                </c:if>
            </div>
       		</c:forEach>
        </div>
        
        <div class="support-notice-view-btns">
        <c:if test='${loggedMember!=null }'>
			<input type="button" value="게시물 작성" id="addBtn" onclick="fn_askBoardForm();"/>
		</c:if>
		</div>
        <div class="pagebar">
            ${pageBar }
        </div>


<script>
   function fn_askBoardForm(){
      location.href="${path}/askBoardForm.do";
   }
</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
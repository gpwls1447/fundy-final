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
        .support-board-header > div:nth-of-type(2){flex: 14 1 0;}
        .support-board-header > div:nth-of-type(3){flex: 4 1 0;}
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
        .support-board-cols > div:nth-of-type(2){flex: 14 1 0;}
        .support-board-cols > div:nth-of-type(3){flex: 4 1 0;}
        .support-board-cols > div:nth-of-type(4){flex: 3 1 0;color: #aaa;}
        .support-board-cols > div:nth-of-type(5){flex: 1 1 0;color: #aaa;}

</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section class="section">
      <div class="support-board-title">
            <p>공지사항</p>
            <p>더 푸드 포럼의 새로운 소식들을 확인하세요.</p>
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
                <div>${askB.askNo}</div>
                <div>${askB.askWriter }</div>
                <div><a href="${path}//askBoardView.do?askNo=${askB.askNo}">${askB.askTitle }</a></div>
                <div><fmt:formatDate value="${askB.askDate }" pattern="yyyy/MM/dd"/></div>
                <div>대기중</div><!-- 댓글 구현한 후 댓글 달릴시 대기중->완료로 전환되게 하려해요 -->
            </div>
       		</c:forEach>
        </div>
        
        <%-- <div>${pageBar }</div> --%>
<input type="button" value="게시물 작성" id="addBtn" onclick="fn_askBoardForm();"/>
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


<script>
   function fn_askBoardForm(){
      location.href="${path}/askBoardForm.do";
   }
</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
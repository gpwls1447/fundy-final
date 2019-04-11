<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
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
        .support-board-cols > div:nth-of-type(4){flex: 3 1 0;color: #aaa;}
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
        
           a:link { color: black; text-decoration: none;}
	 	a:visited { color: black; text-decoration: none;}
	 	a:hover { color: black; text-decoration: underline;}
	 	
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
		
		.support-notice-update-btns
        {
            display: flex;
            justify-content: flex-end;
            padding: 10px 0;
        }
        
    </style>
<section class="section">
 <div class="memberupdate-header">공지사항</div>
           <div class="memberupdate-nav">
            <div><a href="${pageContext.request.contextPath}/askBoardMain.do">1대1게시판</a></div>
            <div><a href="${pageContext.request.contextPath}/noticeMain.do">공지사항</a><span class="indicator"></span></div>
          
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
                
            </div>
        	<c:forEach items="${list }" var="nt">
            <div class="support-board-cols">
                <div>${nt.noticeNo }</div>
                <div>펀디메니저</div>
                <div><a href="${path}/noticeView.do?noticeNo=${nt.noticeNo}">${nt.noticeTitle }</a></div>
                <div><fmt:formatDate value="${nt.noticeDate }" pattern="yyyy/MM/dd"/></div>
            </div>
            </c:forEach>
        </div>
        <div class="support-notice-update-btns">
		<input type="button" value="게시물 작성" id="addBtn" onclick="fn_noticeForm();"/>
		</div>
        <div class="pagebar">
             ${pageBar }
        </div>
<script>
   function fn_noticeForm(){
      location.href="${path}/noticeForm.do";
   }
</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
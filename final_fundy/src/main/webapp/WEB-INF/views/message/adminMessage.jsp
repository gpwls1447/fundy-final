<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <style>
        /* 메시지 페이지 시작 */

        .message-header
        {
            width: 100%;
            display: flex;
            justify-content: center;
            font-size: 27px;
            font-weight: bold;
            margin: 30px 0;
            color: #444;
        }

        .message-nav
        {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .message-nav > div
        {
            margin: 0 20px;
            color: #444;
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

        .message-body
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
            align-items: center;
            margin-top: 40px;
        }

        .msg-category
        {
            width: 100%;
            display: flex;
            justify-content: flex-end;
        }

        .msg-unit
        {
            width: 100%;
            display: flex;
            padding: 25px 0;
            border-bottom: 1px solid #ccc;
        }

        .msg-unit > div:nth-of-type(2){flex: 6 1 0;}
        .msg-unit > div:last-of-type{flex: 2 1 0;}

        .thumnail-container
        {
            position: relative; padding-right: 20px;
        }

        .msg-thumnail
        {
            width: 60px;
            height: 60px;
            border-radius: 50%;
        }

        .unread-mark
        {
            position: absolute;
            top: -5px;
            right: 15px;
            background-color: rgba(216, 45, 45, 0.8);
            color: white;
            font-weight: bold;
            width: 24px;
            height: 22px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-bottom: 2px;
            border-radius: 50%;
            font-size: 14px;
        }

        .msg-nick
        {
            font-size: 19px;
            font-weight: bold;

        }
        .proj-title
        {
            color: #666;
            font-size: 15px;
        }

        .msg-content
        {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            font-size: 15px;
            margin-top: 10px;
        }

        .msg-date
        {
            color: #666;
            font-size: 15px;
        }

  		a:link { color: black; text-decoration: none;}
	 	a:visited { color: black; text-decoration: none;}
	 	a:hover { color: black; text-decoration: none;}
        
    </style>
<section class="section">
    <div class="message-header">메시지</div>
        <div class="message-nav">
           <div><a href="${pageContext.request.contextPath}/messageMain.do?receiverEmail=${loggedMember.memberEmail}">일반 메시지</a></div>
            <div><a href="${pageContext.request.contextPath}/myProjectMessage.do">내 프로젝트 메시지</a></div>
            <div><a href="${pageContext.request.contextPath}/adminMessage.do">운영자 메시지</a><span class="indicator"></span></div>
        </div>
        <hr id="divider"/>
        <div class="message-body">
            <div class="msg-category">
                <select name="" class="msg-categ">
                    <option value="">전체</option>
                    <option value="">읽은 메시지</option>
                </select>
            </div>
            <div class="msg-unit">
                <div class="thumnail-container">
                    <img class="msg-thumnail" src="images/default_profile_1.png">
                    <span class="unread-mark">N</span>
                </div>
                <div class="msg-body">
                    <div class="msg-nick">21kyo</div>
                     <a href="${pageContext.request.contextPath}/adminMessageView.do">
                    <div class="proj-title">'꼬마백조' 날개찾기</div>
                    </a>
                    <div class="msg-content">감사합니다ㅎㅎㅎ</div>
                </div>
                <div class="msg-date">19/03/24     19:20:54</div>
            </div>
            <div class="msg-unit">
                <div class="thumnail-container">
                    <img class="msg-thumnail" src="images/default_profile_1.png">
                    <span class="unread-mark">N</span>
                </div>
                <div class="msg-body">
                    <div class="msg-nick">mjy9610</div>
                    <div class="proj-title">오지는 제품을 만나보시겠습니까?</div>
                    <div class="msg-content">알겠어요!!</div>
                </div>
                <div class="msg-date">19/03/24     19:20:54</div>
            </div>
            <div class="msg-unit">
                <div class="thumnail-container">
                    <img class="msg-thumnail" src="images/default_profile_1.png">
                    <span class="unread-mark">N</span>
                </div>
                <div class="msg-body">
                    <div class="msg-nick">cjh2018</div>
                    <div class="proj-title">'꼬마백조' 날개찾기</div>
                    <div class="msg-content">네네!!</div>
                </div>
                <div class="msg-date">19/03/24     19:20:54</div>
            </div>
        </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
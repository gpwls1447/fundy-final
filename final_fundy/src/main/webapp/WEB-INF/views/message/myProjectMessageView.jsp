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
            position: relative;
        }

        .message-view-header
        {
            width: 100%;
            display: flex;
            justify-content: center;
            position: relative;
            align-items: center;
            margin-bottom: 20px;
        }

        .go-back
        {
            position: absolute;
            font-size: 15px;
            left: 0;
            display: flex;
            align-items: center;
        }

        .go-back > i
        {
            font-size: 29px;
        }

        .message-title
        {
            font-size: 31px;
            font-weight: bold;
        }

        .option-info-toggle
        {
            font-size: 15px;
            position: absolute;
            right: 0;
            display: flex;
            align-items: center;
        }

        .option-info-toggle > i
        {
            font-size: 29px;
        }

        .option-container
        {
            width: 100%;
            display: flex;
            flex-flow: column nowrap;
            border-top: 1px solid #ccc;
            align-items: center;
        }

        .option-unit
        {
            width: 100%;
            display: flex;
            justify-content: space-between;
            padding: 20px 0;
            border-bottom: 1px solid #ccc;
        }

        .option-unit > div
        {
            display: flex;
        }

        .option-sub
        {
            font-weight: bold;
            margin-right: 20px;
        }

        .divider
        {
            display: block;
            height: 1px;
            width: 90%;
            background-color: #ccc;
        }

        .contact-container
        {
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 30px 0;
            border-bottom: 1px solid #ccc;
        }

        .contact-thumnail
        {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            overflow: hidden;
            margin-right: 20px;
        }

        .contact-thumnail > img
        {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .contact-nick
        {
            font-weight: bold;
            font-size: 19px;
        }

        .contact-email
        {
            font-size: 16px;
            color: #aaa;
        }

        .msg-container
        {
            width: 85%;
            display: flex;
            flex-flow: column nowrap;   
            padding: 30px 0 60px 0;
        }

        .msg-unit
        {
            width: 100%;
            margin-top: 25px;
            align-self: flex-start;
            display: flex;
        }

        .sent-msg
        {
            align-self: flex-end;
            flex-flow: row-reverse;
        }

        .msg-date
        {
            display: flex;
            align-items: center;
            font-size: 13px;
            margin: 0 15px;
            color: rgb(119, 189, 235);
        }

        .msg-date-sent
        {
            color: #aaa;
        }

        .msg-content
        {
            max-width: 65%;
            background-color: rgb(119, 189, 235);
            color: white;
            padding: 15px 20px;
            
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
            box-sizing: border-box;
            border-radius: 0 20px 20px 20px;
            position: relative;
            font-size: 14px;
        }

        .sent-content
        {
            background-color: #eee;
            color: #444;
            border-radius: 20px 20px 0 20px;
        }


        .write-container
        {
            width: 50%;
            position: relative;
            margin: 30px 0 100px 0;
        }

        .msg-textarea
        {
            border-bottom: 1px solid #ccc;
            height: auto;
            font-size: 14px;
            padding: 0 30px 7px 7px;
        }


        .msg-textarea:focus{outline: none;}

        .send-btn
        {
            width: 22px;
            height: 22px;
            position: absolute;
            right: 10px;
            bottom: 10px;
            color: gray;
            font-size: 30px;
            fill:#666;
        }

        .send-btn:active
        {
            animation: animate;
            animation-duration: 1s;
            animation-fill-mode: forwards;
            animation-timing-function: linear;
        }

        @keyframes animate{
            8.3%
            {
                transform: translate(20px, -20px) rotateZ(20deg) scale(0.9);
            }
            16.6%
            {
                transform: translate(50px, -40px) rotateZ(40deg) scale(0.8);
            }
            
            24.9%
            {
                transform: translate(80px, -50px) rotateZ(70deg) scale(0.7);
            }

            33.2%
            {
                transform: translate(110px, -40px) rotateZ(100deg) scale(0.6);
            }
            41.5%
            {
                transform: translate(120px, -20px) rotateZ(140deg) scale(0.7);
            }
            49.8%
            {
                transform: translate(110px, 0px) rotateZ(180deg) scale(0.8);
            }
            
            58.1%
            {
                transform: translate(80px, 20px) rotateZ(200deg) scale(0.9);
            }

            66.4%
            {
                transform: translate(50px, 40px) rotateZ(220deg) scale(1);
            }
            74.7%
            {
                transform: translate(20px, 45px) rotateZ(240deg) scale(1.1);
            }
            83%
            {
                transform: translate(0px, 40px) rotateZ(270deg) scale(1.2);
            }
            91.3%
            {
                transform: translate(-10px, 20px) rotateZ(310deg) scale(1.1);
            }
            
            100%
            {
                transform: translate(0, 0) rotateZ(360deg) scale(1); 
            }

        }
        
        a:link { color: black; text-decoration: none;}
	 	a:visited { color: black; text-decoration: none;}
	 	a:hover { color: black; text-decoration: none;}
</style>
<section class="section">
   <div class="message-header">메시지</div>
        <div class="message-nav">
           <div><a href="${pageContext.request.contextPath}/messageMain.do">일반 메시지</a></div>
            <div><a href="${pageContext.request.contextPath}/myProjectMessage.do">내 프로젝트 메시지</a><span class="indicator"></span></div>
            <div><a href="${pageContext.request.contextPath}/adminMessage.do">운영자 메시지</a></div>
        </div>
        <hr id="divider"/>
        <div class="message-body">
            <div class="message-view-header">
                <div class="go-back"><i class="material-icons">chevron_left</i>메세지함으로 돌아가기</div>
                <div class="message-title">'꼬마백조' 날개찾기</div>
                <div class="option-info-toggle">후원정보 보기 <i class="material-icons">arrow_drop_up</i></div>
            </div>
            <div class="option-container">
                <div class="option-unit">
                    <div>
                        <div class="option-sub">옵션 정보 N</div>
                        <div>
                            · 실버 목걸이 1개<br>
                            · 엽서 1개
                        </div>
                    </div>
                    <div>
                        <div class="option-sub">
                            수량
                        </div>
                        <div>
                            2개
                        </div>
                    </div>
                    <div>
                        <div class="option-sub">예상 발송일</div>
                        <div>2019년 4월 26일</div>
                    </div>
                </div>
            </div>
            <div class="contact-container">
                <div class="contact-thumnail"><img src="images/default_profile_1.png"></div>
                <div class="contact-body">
                    <div class="contact-nick">21Kyo</div>
                    <div class="contact-email">21kyo@kh.or.kr</div>
                </div>
            </div>
            <div class="msg-container">
                <div class="msg-unit">
                    <div class="msg-content incoming-content">
                        이거는 어떻게 사는건가요? 제가 이거 어버이날에 사야하는데
                        언제쯤 배송이 올까요?
                    </div>
                    <div class="msg-date">
                        19/03/24 19:20:54
                    </div>
                </div>
                <div class="msg-unit">
                    <div class="msg-content incoming-content">
                        이거는 어떻게 사는건가요? 제가 이거 어버이날에 사야하는데
                        언제쯤 배송이 올까요?
                    </div>
                    <div class="msg-date">
                        19/03/24 19:20:54
                    </div>
                </div>
                <div class="msg-unit sent-msg">
                    <div class="msg-content sent-content">
                        이거는 어떻게 사는건가요? 제가 이거 어버이날에 사야하는데
                        언제쯤 배송이 올까요?
                    </div>
                    <div class="msg-date msg-date-sent">
                        19/03/24 19:20:54
                    </div>
                </div>
                <div class="msg-unit sent-msg">
                    <div class="msg-content sent-content">
                        이거는 어떻게 사는건가요? 제가 이거 어버이날에 사야하는데
                        언제쯤 배송이 올까요?
                    </div>
                    <div class="msg-date msg-date-sent">
                        19/03/24 19:20:54
                    </div>
                </div>
            </div>
            <div class="write-container">
                <div class="msg-textarea" contenteditable="true">메시지를 입력하세요</div>
                <svg class="send-btn" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve">
                <g><path d="M745,990L500,806.3L316.2,990V683.8l490-490L157,549L10,438.8L990,10L745,990z"/></g>
                </svg>
            </div>
        </div>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
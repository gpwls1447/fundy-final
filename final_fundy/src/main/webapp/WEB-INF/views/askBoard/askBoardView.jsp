<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.support-notice-view-wrapper
{
    width: 1024px;
    font-family: 'Noto Sans KR';
    font-size: 14px;
}

.support-notice-view-wrapper input[type="button"]
{
    font-family: 'Noto Sans KR';
    font-size: 12px;
    width: 120px;
    height: 40px;
    margin: 0;
    border: none;
    background-color: rgb(18, 97, 149);
    color: white;
    margin: 0 10px;
    border-radius: 2px;
    cursor: pointer;
}

 .support-notice-view-wrapper input[type="submit"]
{
    font-family: 'Noto Sans KR';
    font-size: 12px;
    width: 120px;
    height: 40px;
    margin: 0;
    border: none;
    background-color: rgb(18, 97, 149);
    color: white;
    margin: 0 10px;
    border-radius: 2px;
    cursor: pointer;
}

#reDelBtn
{
 	font-family: 'Noto Sans KR';
    font-size: 12px;
    width: 120px;
    height: 40px;
    margin: 0;
    border: none;
    background-color:rgb(230, 126, 34);
    color: white;
    margin: 0 10px;
    border-radius: 2px;
    cursor: pointer;
}

#boardDeleteBtn
{
	font-family: 'Noto Sans KR';
    font-size: 12px;
    width: 120px;
    height: 40px;
    margin: 0;
    border: none;
    background-color:rgb(230, 126, 34);
    color: white;
    margin: 0 10px;
    border-radius: 2px;
    cursor: pointer;
}

.support-notice-view-wrapper input:focus
{
    outline: none;
}

.support-notice-view-title p
{
    font-size: 21px;
    display: inline-block;
}

.support-notice-view-title span
{
    margin-left: 10px;
}

.support-notice-view
{
    display: flex;
    flex-flow: column nowrap;
   border-top: 2px solid rgb(42, 71, 114);
    border-bottom: 1px solid rgb(42, 71, 114);
}

.support-notice-view > div
{
    display: flex;  
    border-bottom: 1px solid #eee;
}

.support-notice-view > div > div
{
    display: flex;
    justify-items: flex-start;
    padding: 15px;
}

.support-notice-view > div > div:nth-of-type(1){flex: 1 1 0;  background-color: rgb(245, 245, 245);}
.support-notice-view > div > div:nth-of-type(2){flex: 9 1 0;}

.support-notice-view-date-hit > div:nth-of-type(1){flex: 1 1 0 !important;padding-right: 21px !important;}
.support-notice-view-date-hit > div:nth-of-type(2){flex: 4 1 0 !important;}
.support-notice-view-date-hit > div:nth-of-type(3){flex: 1 1 0; background-color: rgb(245, 245, 245) !important;}
.support-notice-view-date-hit > div:nth-of-type(4){flex: 4 1 0;}


.support-notice-view-content > div
{
    background-color: white !important;
    
}

.support-notice-view-btns
{
    display: flex;
    justify-content: flex-end;
    padding: 10px 0;
}

.support-notice-prev > div, .support-notice-next > div
{
    background-color: white !important;
    padding: 5px 5px !important;
}

.support-notice-prev > div > img, .support-notice-next > div > img
{
    width: 13px;
    height: 13px;
    margin-right: 5px;
    margin-top: 4px;
}

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
a:hover { color: black; text-decoration: none;}
		
#replyTable{border-spacing:10px;
		border-collapse:separate;
}

#reply-container{display: inline-block; margin: 1em; width: 100%;}        

</style>
<section class="section">
 <div class="notice-form-wrapper">
 <div class="memberupdate-header">게시판</div>
        <div class="memberupdate-nav">
            <div><a href="${pageContext.request.contextPath}/askBoardMain.do">1대1게시판</a><span class="indicator"></span></div>
            <div><a href="${pageContext.request.contextPiceMain.do">공지사항</a></div>
          
        </div>

        <hr id="divider"/>
 
 <div class="support-notice-view-wrapper">
        <div class="support-notice-view-title">
            <p></p>
        </div>
        <br/>
        <div class="support-notice-view">
            <div class="support-notice-view-title">
                <div>제목</div>
                <div>${ab.askTitle}</div>
            </div>
            <div class="support-notice-view-wrtier">
                <div>작성자</div>
                <div>${ab.askWriter}</div>
            </div>
            <div class="support-notice-view-date-hit">
                <div>작성일</div>
                <div><fmt:formatDate value="${ab.askDate}" pattern="yyyy/MM/dd hh:mm:ss"/></div>
                <!-- <div>조회수</div>
                <div>338</div> -->
            </div>
            <hr/>
            <div class="support-notice-view-content">
                <div>
                   ${ab.askContent}
                </div>
            </div>
            <hr/>
           <div>
          <form id="replyDelForm" action="${path}/askReplyDelete.do?askNo=${ab.askNo}" method="post">
            <table id="replyTable">
            	<c:forEach items="${list }" var="are">
            		<tr>
            			<td>
            				<input type="hidden" name="askReplyNo" id="askReplyNo" value="${are.askReplyNo }"/>
            				<input type="hidden" name="askNo" id="askReNo" value="${are.askNo }"/>
            			</td>
            			<td>
		            		펀디메니저
		            	</td>
		            	<td>
		            		${are.askReplyContent }
		            	</td>
		            	<td>
		            		<fmt:formatDate value="${are.askReplyDate }" pattern="yyyy/MM/dd hh:mm"/>
		            	</td>
		            	<c:if test='${loggedMember.memberEmail.equals("admin@naver.com") }'>
		            	<td>
		            		<input type="submit" value="삭제" id="reDelBtn"onclick="fn_replyDelete();"/>
		            	</td>
		            	</c:if>
		           </tr>
           		</c:forEach>
		     </table>
		     </form>
            </div>
            <form id="replyForm" action="${path}/insertRe.do?askNo=${ab.askNo}" method="post">
           		  <div class="reply-container">
           		   <c:if test='${loggedMember.memberEmail.equals("admin@naver.com") }'>
                	<div>댓글입력</div>
                	<div>
                	<input type="text" name="askReplyContent" id="askReplyContent" style="width:600px;height:40px;border:0; border-bottom:1px solid black;"  autocomplete="off"/>
                	<input type="submit" value="등록" onclick="reSaveBtn" id="reSaveBtn"/>
                	</div>
                	</c:if>
            	</div>
            </form>
         <br/>
        </div>
            <div class="support-notice-view-btns">
            	<c:if test="${loggedMember.memberNick==ab.askWriter }">
                <input type="button" value="수정" onclick="fn_askBoardUpdate();">
                </c:if>
                <c:if test='${loggedMember.memberEmail.equals("admin@naver.com") }'>
                <input type="button" value="삭제" onclick="fn_askBoardDelete();" id="boardDeleteBtn">
                </c:if>
                <input type="button" value="목록" onclick="fn_returnMain();">
            </div>
    </div>
<script>
function fn_returnMain()
{
	location.href="${path}/askBoardMain.do";
}

$(document).ready(function(){
	$("#reDelBtn").click(function(){
	
		document.replyDelForm.submit();
	});
});

   function fn_askBoardDelete(){
	  if(confirm("삭제 하시겠습니까??")){
      	location.href="${path}/askBoardDelete.do?askNo=${ab.askNo}";
	  }
	  else
		  {
		  	return;
		  }
	  }
   
   
   function fn_askBoardUpdate()
   {
	   location.href="${path}/askBoardUpdate.do?askNo=${ab.askNo}";
   }
   
   $(document).ready(function(){
		$("#reSaveBtn").click(function(){
			var content = $("#askReplyContent").val();
			if(content=="")
				{
					alert("댓글을 입력하세요");
					document.replyForm.askReplyContent.focus();
					return;
				}
			document.replyForm.submit();
		});
	});
</script>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
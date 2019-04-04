<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
#bTitleForm{text-align:center;
			width: 100%;
            height: 70px;
            display: flex;
            justify-content: center;
            border-bottom: 1px solid #ccc;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section class="section">
<div id="askBoard-container">
<div id="bTitleForm"><h1>1대1 게시판</h1></div>
	<form name="askBoardFrm" action="${path }/askBoard/askBoardFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data"></form>
	<input type="text" id="askBoardTitle" name="askBoardTitle" placeholder="제목" required>
	<textarea rows="30" cols="10" name="askBoardContent" placeholder="내용" required></textarea>
	<input type="file" name="upfile" id="upfile">
	<br/>
	<input type="submit" id="saveBtn" value="등록">


</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
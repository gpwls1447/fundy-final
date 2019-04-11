<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<div data-comment-reply-no="${commentReply.commentReplyNo }" class="comment-unit reply-unit">
	<div class="comment-header">
		<img class="comment-profile" src="${path }/resources/memberProfile/${loggedMember.memberProfile}">
		<div class="comment-nick-date">
		    <div class="comment-nick">${commentReply.memberNick }<i class="material-icons comment-menu-btn">more_vert</i></div>
		    <fmt:formatDate value="${commentReply.commentReplyDate }" var="replyDate" pattern="yyyy.MM.dd hh:mm:ss"/>
		    <div class="comment-date">${replyDate }</div>
		    <div class="comment-menu">
		        <div class="edit-btn"><i class="material-icons">edit</i>수정</div>
		        <div class="delete-reply-btn"><i class="material-icons">delete</i>삭제</div>
		    </div>
		</div>
	</div>
	<div class="comment-text">${commentReply.commentReplyContent }</div>
	<span class="edit-bar"></span>
	<div class="write-btn-set">
		<button class="cancel-btn cancel-edit nude-btn ripple">취소</button>
		<button class="write-btn save-reply-edit nude-btn ripple">저장</button>
	</div>
	<div class="comment-footer">
		<div class="comment-btn-container">
		    <i class="material-icons nude-btn like-btn ripple">thumb_up</i>
		</div>
	</div>
</div>
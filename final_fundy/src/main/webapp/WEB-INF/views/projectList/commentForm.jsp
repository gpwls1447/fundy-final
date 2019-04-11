<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<div data-comment-no="${comment.commentNo }" class="comment-unit">
    <div class="comment-header">
        <img class="comment-profile" src="${path }/resources/memberProfile/${loggedMember.memberProfile}">
        <div class="comment-nick-date">
            <div class="comment-nick">${comment.memberNick }<i class="material-icons comment-menu-btn">more_vert</i></div>
            <div class="comment-date">${comment.commentDate }</div>
            <div class="comment-menu">
				<div class="edit-btn"><i class="material-icons">edit</i>수정</div>
				<div class="delete-comment-btn"><i class="material-icons">delete</i>삭제</div>
            </div>
        </div>
    </div>
    <div class="comment-text">${comment.commentContent }</div>
    <span class="edit-bar"></span>
    <div class="write-btn-set">
        <button class="cancel-btn cancel-edit nude-btn ripple">취소</button>
        <button class="write-btn save-comment-edit nude-btn ripple">저장</button>
    </div>
    <div class="comment-footer">
        <div class="comment-btn-container">
            <i class="material-icons nude-btn like-btn ripple">thumb_up</i>
            <button class="ripple nude-btn reply-btn">REPLY</button>
        </div>
        <div class="textarea reply-textarea" contenteditable="true"></div>
        <span class="textarea-bar"></span>
        <div class="write-btn-set">
            <button class="cancel-btn nude-btn cancel-reply ripple">취소</button>
            <button class="write-reply write-btn basic-btn basic-btn-active ripple">등록</button>
        </div>
    </div>
    <div class="reply-container">
    </div>
</div>
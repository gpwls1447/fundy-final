<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
		<!-- 신청서영역 -->
			
			<div class="write-section write-section-noborder">
				<div class="write-category">
					<span>프로젝트 소개</span>
				</div>
				<div class="write-content-block">
					<div>
						<span>프로젝트 스토리텔링에 필요한 요소들을 확인하여 작성해주세요.</span>
					</div>
				</div>
			</div>
			<div id="smart-editor-area" style="margin:auto; width: 90%; padding-bottom: 50px;">
				<form action="./insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
					<textarea name="editor" id="editor" style="width: 100%; min-height: 400px;">${project.PROJECTCONTENT }</textarea>
				</form>
			</div>
		
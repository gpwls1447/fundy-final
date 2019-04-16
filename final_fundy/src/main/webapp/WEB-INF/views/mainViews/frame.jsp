<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
 <c:choose>
	<c:when test="${param.cho == 'new' }">
		<c:set var="list" value="${newProjectList}"></c:set>
	</c:when>
	<c:when test="${param.cho == 'soon' }">
		<c:set var="list" value="${soonProjectList}"></c:set>
	</c:when>
	<c:otherwise>
		<c:set var="list" value="${projectList}"></c:set>
	</c:otherwise>
</c:choose>
<div class="proj-section-header">
    <div class="proj-section-header-text-area">
		<c:choose>
			<c:when test="${param.cho == 'new' }">
				새 프로젝트
			</c:when>
			<c:when test="${param.cho == 'soon' }">
				임박 프로젝트
			</c:when>
		</c:choose>
    </div>
    <div class="proj-section-header-pagination-area">
		<ul class="pagination pagination-sm justify-content-end">
		<li class="page-item"><a class="page-link paging" onclick="fn_paging('previous')">&laquo;</a></li>
		<li class="page-item"><a class="page-link paging" onclick="fn_paging('next')">&raquo;</a></li>
		</ul>
		<input type="hidden" class="cPage" value="1" />
	</div>
</div>
<div class="proj-container">
	<c:forEach items="${list }" var="proj">
		<div class="proj-box" onclick="fn_seeProjectView('${proj.PROJECTNO}')">
			<img class="proj-thumnail" src="${path }/resources/projectRepresent/${proj.PROJECTTHUMNAIL}" alt="">
			<div class="proj-body">
				<div class="proj-title">${proj.PROJECTTITLE }</div>
				<div class="proj-creator">${proj.MEMBERNICK }</div>
				<div class="proj-progbar-container">
					<div class="progress" style="height:3px">
						<div class="progress-bar" style="width:${proj.REACHRATE}%;height:3px; background-color: var(--basic-color);"></div>
					</div>
					<div class="progbar-info">
						<span>${proj.REACHRATE }%</span>
						<span class="goalPrice-span">${proj.REACH } 원</span>
						<span>${proj.REMAINDATE }일 남음</span>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
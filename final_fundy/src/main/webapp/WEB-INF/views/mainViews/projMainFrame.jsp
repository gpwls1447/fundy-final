<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%-- <c:choose>
	<c:when test="${cho == 'pop' }">
		<c:set var="list" value="${projectListCtg}"></c:set>
	</c:when>
	<c:when test="${cho == 'new' }">
		<c:set var="list" value="${newProjectList}"></c:set>
	</c:when>
	<c:when test="${cho == 'soon' }">
		<c:set var="list" value="${soonProjectList}"></c:set>
	</c:when>
</c:choose> --%>
<c:forEach items="list" var="proj">
<div class="proj-box">
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
				<%-- <span class="goalPrice-span">${proj.GOALPRICE } 원</span> --%>
				<span>${proj.REMAINDATE }일 남음</span>
			</div>
		</div>
	</div>
</div>
</c:forEach>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="now" value="<%=new java.util.Date()%>"/>
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowDate"/>  
<fmt:parseNumber value="${now.time / (1000*60*60)}" integerOnly="true" var="nowHour"/>  
<fmt:parseNumber value="${now.time / (1000*60)}" integerOnly="true" var="nowMinute"/>  

<style>
	.donor-count
	{
	    font-size: 30px;
	    color: var(--basic-color);
	    margin: 20px 0;
	}
	
	.donor-box
	{
	    display: flex;
	    padding: 20px 0;
	    border-bottom: 1px solid #ccc;
	}
	
	.donor-box:last-of-type{border: none !important;}
	
	.donor-thumnail
	{
	    width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    border:1px solid #eee;
	}
	
	.donor-info
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    font-size: 19px;
	    justify-content: center;
	    margin: 0 20px;
	}
	
	.donor-nick
	{
	    color: var(--basic-color);
	}
	
	.donor-date{color: gray; font-size: 15px;}
	
	.fund-price
	{
		font-weight: bold;
	}
</style>

<div class="donor-count">현재 이 프로젝트에<br>${fn:length(flList)}명의 참여가 이루어졌습니다.</div>
<c:forEach items="${flList }" var="fl">
	<div class="donor-box">
	    <img class="donor-thumnail" src="images/pepe.png">
	    <div class="donor-info">
	        <div class="donor-nick-price"><span class="donor-nick">${fl.memberNick }</span> 님이 <span class="fund-price">${fl.fundPrice * fl.packageAmount + extraMoney }</span> 원을 후원하였습니다.</div>
            <fmt:parseNumber value="${fl.funderDate.time / (1000*60*60*24)}" integerOnly="true" var="fdDate"/>
            <fmt:parseNumber value="${fl.funderDate.time / (1000*60*60)}" integerOnly="true" var="fdHour"/>
            <fmt:parseNumber value="${fl.funderDate.time / (1000*60)}" integerOnly="true" var="fdMinute"/>            
            <div class="donor-date">
            	<c:choose>
					<c:when test="${nowDate - fdDate != 0}">
	            		${nowDate - fdDate}일 전
	            	</c:when>
	            	<c:when test="${nowHour - fdHour != 0}">
	            		${nowHour - fdHour}시간 전
	            	</c:when>
	            	<c:otherwise>
	            		${nowMinute - fdMinute}분 전
	            	</c:otherwise>
            	</c:choose>
      		</div>
        </div>
	</div>
</c:forEach>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
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
</style>

<div class="donor-count">현재 이 프로젝트에<br>${project.funderNo }</div>
<c:forEach items="${flList }" var="fl">
	<div class="donor-box">
	    <img class="donor-thumnail" src="images/pepe.png">
	    <div class="donor-info">
	        <div class="donor-nick-price"><span class="donor-nick">${fl.memberNick }</span>${(fl.fundPrice*fl.packageAmount)+fl.extraMoney }</div>
	        <div class="donor-date">${f1.funderDate } </div>
	    </div>
	</div>
</c:forEach>

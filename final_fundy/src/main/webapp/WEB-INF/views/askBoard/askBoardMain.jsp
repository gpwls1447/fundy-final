<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
#bTitle{ text-align:center;  border-bottom: 1px solid #ccc; }
#addBtn{float:right; margin:0 0 15px}
#boardList{border-bottom: 1px solid #ccc;}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section class="section">
<div id="bTitle"><h1>1대1 게시판</h1></div>
<div>
   <i class="material-icons search-btn">search</i>
   <input type="text" name="search" class="search-bar" placeholder="검색">
</div>
<div>
<table>
   <tr>
      <th>번호</th>
      <th>작성자</th>
      <th>제목</th>
      <th>작성일</th>
   </tr>
   <%-- <c:forEach items="${list }" var="b"> --%>
   <tr id="boardList">
      <td>번호나오기</td>
      <td>작성자 나오기</td>
      <td>제목 나오기</td>
      <td>작성일 나오기</td>
      <td>상태 나오기</td>
   </tr>
  <%--  </c:forEach> --%>
</table>
</div>
<div class="pagecontainer">
   <%-- ${pageBar } --%>
</div>
<input type="button" value="게시물 작성" id="addBtn" onclick="fn_askBoardForm();"/>

<script>
   function fn_askBoardForm(){
      location.href="${path}/askBoardForm.do";
   }
</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
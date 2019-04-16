<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<style>
select#_subCode option.subCtgs {
	display: none;
}
</style>	
<script>
$(function() {
	var mainCtg = $("#_mainCtg").val();	//중분류 카테고리 코드값 가져오기
	mainCtg = "." + mainCtg;	//중분류 카테고리 선택자로 초기화
	$(".subCtgs").css("display", "none");	//소분류 카테고리 display 설정 none
	$(mainCtg).css("display", "block");	//(중분류 카테고리 코드값을 클래스로가지는 소분류카테고리) display 설정
})
</script>
			<div class="write-section">
				<div class="write-category">
					<span>카테고리 설정</span>
				</div>
				<div class="write-content-block">
					<div>카테고리를 설정해주세요.</div>
					<div>
						<select class="form-control inputShort" id="_mainCtg">
							<option disabled="disabled" <c:if test="${project.MIDCODE == null }">selected="selected"</c:if> >중분류 카테고리</option>
							<c:forEach var="midCtg" items="${midList }" varStatus="status">
								<option class="midCtgs" id="${midCtg.getMidCode() }" value="${midCtg.getMidCode() }" <c:if test="${project.MIDCODE == midCtg.getMidCode() }">selected="selected"</c:if> >${midCtg.getMidName() }</option>
							</c:forEach>
						</select>
						&nbsp;&nbsp;&nbsp;
						<select class="form-control inputShort" id="_subCode">
							<option id="subCtgs" disabled="disabled" <c:if test="${project.MINORCODE == null }">selected="selected"</c:if> value="">소분류 카테고리</option>
							<c:forEach var="minorCtg" items="${minorList }" varStatus="status">
								<option class="subCtgs ${minorCtg.getMidCode() }" value="${minorCtg.getMinorCode() }" <c:if test="${project.MINORCODE == minorCtg.getMinorCode() }">selected="selected"</c:if> >${minorCtg.getMinorName() }</option>
							</c:forEach>
						</select>
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>프로젝트 이름</span>
				</div>
				<div class="write-content-block">
					<div>
						프로젝트의 타이틀을 정해주세요. 띄어쓰기 포함 최대 20글자 내로 작성해주세요.
					</div>
					<div>
						<input type="text" value="${project.PROJECTTITLE }" class="form-control inputLong" id="_projectTitle" maxlength="20" placeholder="내용을 입력해주세요." />
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>프로젝트<br>대표 이미지</span>
				</div>
				<div class="write-content-block">
					<div>
						프로젝트 대표 이미지를 첨부해주세요.
					</div>
					<div id="thumnail-drag" style="display:flex; justify-content:center; align-items:center; width:500px; height:281.25px; border: 1px solid #ccc;">
					<c:choose>
						<c:when test="${project.PROJECTTHUMNAIL!=null }">
							<img id="thumnail-img" onclick="fn_uploadThumnail()" src="${path }/resources/projectRepresent/${project.PROJECTTHUMNAIL }" width="100%" height="100%" style="display:flex;" />
						</c:when>
						<c:otherwise>
							<img id="thumnail-img" onclick="fn_uploadThumnail()" src="${path }/resources/images/upload-project-icon.png" width="20%" height="30%" style="display:flex;" />
						</c:otherwise>
					</c:choose>
						<div style="display:none">
							<form id="thumnailForm" method="post" action="${path }/upload/projectThumnail.do" enctype="multipart/form-data">
								<input type="file" class="projectThumnail" id="_projectThumnail" name="projectThumnail" />
							</form>
							<input type="hidden" id="projectThumnailCk" value="${project.PROJECTTHUMNAIL }" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>프로젝트 요약</span>
				</div>
				<div class="write-content-block">
					<div>
						진행할 프로젝트에 대해 간략하게 소개해주세요. 차후에 수정 할 수 있습니다.
					</div>
					<div>
						<textarea class="form-control inputLong" id="_projectSummary" rows="6" placeholder="내용을 입력해주세요.">${project.PROJECTSUMARY }</textarea>
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>창작자 이름</span>
				</div>
				<div class="write-content-block">
					<div>
						프로젝트를 진행하는 창작자 이름을 적어주세요. 팀이 있으시다면 팀명으로 적어주셔도 됩니다.
					</div>
					<div>
						<input type="text" value="${project.MEMBERNICK }"
						 class="form-control" id="_memberNick" maxlength="20" placeholder="내용을 입력해주세요." style="display: inline-block; width: 97.5%;" />
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>프로필 이미지</span>
				</div>
				<div class="write-content-block">
					<div>
						창작자 프로필 사진을 변경 할 수 있습니다. 차후에 변경 할 수 있습니다.
					</div>
					<div class="creator-profile-img">
						<c:choose>
							<c:when test="${project.MEMBERPROFILE != null }">
								<img id="profile-image" alt="" onclick="fn_uploadProfile()" src="${path }/resources/memberProfile/${project.MEMBERPROFILE }" width="100%" height="100%">
							</c:when>
							<c:otherwise>
								<img id="profile-image" alt="" onclick="fn_uploadProfile()" src="${path }/resources/images/user_icon.png" width="100%" height="100%">
							</c:otherwise>
						</c:choose>
						<div style="display:none">
							<form id="FILE_FORM-PROFILE" method="post" enctype="multipart/form-data">
								<input type="file" name="memberProfile" id="_memberProfile" />
							</form>
							<input type="hidden" id="memberProfileCk" value="${project.MEMBERPROFILE }" />
						</div>
					</div>
				</div>
			</div>
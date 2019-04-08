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
			<div class="write-section">
				<div class="write-category">
					<span>카테고리 설정</span>
				</div>
				<div class="write-content-block">
					<div>카테고리를 설정해주세요.</div>
					<div>
						<select class="form-control inputShort" id="_mainCtg">
							<option disabled="disabled" selected="selected">중분류 카테고리</option>
							<option id="mainCtg00" value="mainCtg00">중분류00</option>
							<option id="mainCtg01" value="mainCtg01">중분류01</option>
							<option id="mainCtg02" value="mainCtg02">중분류02</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<select class="form-control inputShort" id="_subCode">
							<option id="subCtgs" disabled="disabled" selected="selected" value="">소분류 카테고리</option>
							<%for(int i=0; i<3; i++) {%>
								<%for(int j=0; j<3; j++) {%>
								<option class="subCtgs mainCtg0<%=i %>" value="m0<%=i %>, s0<%=j %>">중분류0<%=i %>, 소분류0<%=j %></option>
								<%} %>
							<%} %>
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
						<input type="text" value="" class="form-control inputLong" id="_projectTitle" maxlength="20" placeholder="내용을 입력해주세요." />
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
					<div id="thumnail-drag" style="width:500px; height:281.25px;">
						<img id="thumnail-img" src="${path }/resources/images/upload-project-icon.png" onclick="fn_uploadThumnail()" width="100%" height="100%" />
						<div style="display:none">
							<form id="thumnailForm" method="post" action="${path }/upload/projectThumnail.do" enctype="multipart/form-data">
								<input type="file" class="projectThumnail" id="_projectThumnail" name="projectThumnail" />
							</form>
							<input type="hidden" id="projectThumnailCk" value="" />
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
						<textarea class="form-control inputLong" id="_projectSummary" rows="6" placeholder="내용을 입력해주세요."></textarea>
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
						<input type="text" class="form-control" id="_memberNick" maxlength="20" placeholder="내용을 입력해주세요." style="display: inline-block; width: 97.5%;" />
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
						<img id="profile-image" alt="" onclick="fn_uploadProfile()" src="resources/images/user_icon.png" width="100%" height="100%">
						<div style="display:none">
							<form id="FILE_FORM-PROFILE" method="post" enctype="multipart/form-data">
								<input type="file" name="memberProfile" id="_memberProfile" />
							</form>
							<input type="hidden" id="memberProfileCk" value="" />
						</div>
					</div>
				</div>
			</div>
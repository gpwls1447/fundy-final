<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<script>
function sendAuthEmail() {
	$("#emailAuth-area").fadeIn(100);
	var email=$("#projectEmailAuth").val().trim();
	$("#_projectEmail").val("");
    $.ajax({
       url:"${path}/project/emailAuth.do?projectNo=${projectNo}",
       dataType:"json",
       data:{"projectEmail":email},
       success:function(data){
    	   $("#auth-btn-text").text("메일 발송 완료!");
    	   $(".auth-btn").addClass("disabled");
       }
    });
}
</script>
		<!-- 신청서영역 -->
		
			<div class="write-section">
				<div class="write-category">
					<span>휴대폰 번호</span>
				</div>
				<div class="write-content-block">
					<div>
						<span>창작자님이 연락 받으실 수 있는 핸드폰 연락처를 입력해주세요. 프로젝트 진행과 관련된 긴급한 사항 전달에만 사용됩니다.</span>
					</div>
					<div style="display: flex">
						<div style="width:35%; padding-right:10px;">
							<input type="tel" class="form-control input25Per" id="_projectTelF" min="000" max="111" maxlength="3" oninput="maxLengthCheck(this)" value="${project.TELF }" />
							<span style="color: #ccc">─</span>
							<input type="tel" class="form-control input25Per" id="_projectTelM" min="0000" max="9999" maxlength="4" oninput="maxLengthCheck(this)" value="${project.TELM }" />
							<span style="color: #ccc">─</span>
							<input type="tel" class="form-control input25Per" id="_projectTelE" min="0000" max="9999" maxlength="4" oninput="maxLengthCheck(this)" value="${project.TELE }" />
						</div>
						<div>
							<!-- <button class="btn btn-primary" style="background-color: #126196; border: 0px;">인증 문자 받기</button> -->
						</div>
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>이메일 주소</span>
				</div>
				<div class="write-content-block">
					<div>
						<span>이메일 주소를 입력해주세요.</span>
					</div>
					<div style="display: flex">
						<div style="width: 50%; padding-right: 15px;">
							<input type="email" class="form-control inputLong" id="projectEmailAuth" maxlength="40" placeholder="내용을 입력해주세요." value="${project.PROJECTEMAIL }" />
						</div>
						<div>
							<button class="btn btn-primary auth-btn disabled" onclick="sendAuthEmail()" style="background-color: #126196; border: 0px;"><span id="auth-btn-text">인증 메일 받기</span></button>
						</div>
					</div>
					<div id="emailAuth-area" style="display:block;">
						<input type="text" id="email-auth-input" class="form-control input25Per" /><span class="authMessage" style="margin-left:15px; color: orange;">인증번호를 입력해주세요.</span>
						<input type="hidden" id="_projectEmail" value="${project.PROJECTEMAIL }" />
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>입금 계좌</span>
				</div>
				<div class="write-content-block">
					<div>
						<span>입금 계좌를 입력해주세요.</span>
					</div>
					<div>
						<div id="write-account-container">
							<div class="acc-col">
								<div class="cate-row">
									<span>거래은행</span>
								</div>
								<div class="content-row">
									<select class="form-control" id="_bank" style="display:inline-block; width:156px;">
										<option disabled="disabled" <c:if test="${project.BANK==null }">selected="selected"</c:if> value="">은행</option>
										<c:forEach items="${bankList }" var="bank">
											<option value="${bank }" <c:if test="${project.BANK==bank }">selected="selected"</c:if> >${bank }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="acc-col">
								<div class="cate-row">
									<span>계좌번호</span>
								</div>
								<div class="content-row">
									<input type="number" class="form-control inputLong" id="_accNum" maxlength="25" oninput="maxLengthCheck(this)" placeholder="내용을 입력해주세요.(-제외)" value="${project.ACCOUNTNO }" />
								</div>
							</div>
							<div class="acc-col">
								<div class="cate-row">
									<span>예금주명</span>
								</div>
								<div class="content-row">
									<input type="text" class="form-control inputShort" id="_accName" maxlength="8" placeholder="ex)홍길동" value="${project.ACCOUNTOWNER }" />
								</div>
							</div><!-- 
							<div class="acc-col">
								<div class="cate-row">
									<span>계좌 종류</span>
								</div>
								<div class="content-row">
									<form>
										<input type="radio" name="accountType" class="accType" value="개인" />
										<span>개인</span>&nbsp;&nbsp;&nbsp;
										<input type="radio" name="accountType" class="accType" value="사업자" />
										<span>사업자(개인사업자 포함)</span>
									</form>
								</div>
							</div>
							<div class="acc-col">
								<div class="cate-row">
									<span>생년월일</span>
								</div>
								<div class="content-row">
									<input type="number" class="form-control inputLong" id="_birthday" min="0" maxlength="6" oninput="maxLengthCheck(this)" placeholder="숫자로만 입력해주세요 예) 820125" />
								</div>
							</div> -->
						</div>
					</div>
				</div>
			</div>
		
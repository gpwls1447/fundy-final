<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
							<input type="tel" class="form-control input25Per" id="_projectTelF" min="000" max="111" maxlength="3" />
							<span style="color: #ccc">─</span>
							<input type="tel" class="form-control input25Per" id="_projectTelM" min="0000" max="9999" maxlength="4" />
							<span style="color: #ccc">─</span>
							<input type="tel" class="form-control input25Per" id="_projectTelE" min="0000" max="9999" maxlength="4" />
						</div>
						<div>
							<button class="btn btn-primary" style="background-color: #126196; border: 0px;">인증 문자 받기</button>
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
							<input type="email" class="form-control inputLong" id="_projectEmail" placeholder="내용을 입력해주세요." />
						</div>
						<div>
							<button class="btn btn-primary" style="background-color: #126196; border: 0px;">인증 메일 받기</button>
						</div>
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
									<select class="form-control inputShort" id="_bank">
										<option disabled="disabled" selected="selected" value="">은행</option>
										<option class="" value="bankA">은행A</option>
										<option class="" value="bankB">은행B</option>
										<option class="" value="bankC">은행C</option>
									</select>
								</div>
							</div>
							<div class="acc-col">
								<div class="cate-row">
									<span>계좌번호</span>
								</div>
								<div class="content-row">
									<input type="number" class="form-control inputLong" id="_accNum" placeholder="내용을 입력해주세요." />
								</div>
							</div>
							<div class="acc-col">
								<div class="cate-row">
									<span>예금주명</span>
								</div>
								<div class="content-row">
									<input type="text" class="form-control inputShort" id="_accName" placeholder="ex)홍길동" />
								</div>
							</div>
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
									<input type="number" class="form-control inputLong" id="_birthday" min="000000" max="999999" maxlength="6"  placeholder="숫자로만 입력해주세요 예) 820125" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		
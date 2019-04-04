<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(function () {
		$("#reward-container").sortable({ containment : 'parent' });
		$( "#reward-container" ).disableSelection(); 
	});
</script>

		
		<!-- 신청서영역 -->
			<div class="write-section">
				<div class="write-category">
					<span>목표 금액</span>
				</div>
				<div class="write-content-block">
					<div>
						펀딩 목표금액을 정해주세요. <br>
						마감일 자정까지 목표금액을 100% 달성하셔야만 모인 후원금이 결제됩니다.<br>
						막판에 후원을 취소하는 후원자들도 있는 점을 감안하여 10% 이상 초과달성을 목표로 하는게 안전합니다. <br>
					</div>
					<div>
						<input type="number" step="10000" min="0" class="form-control inputMoney" id="_goalPrice" name="" placeholder="내용을 입력해주세요." /> 원
						<span style="margin-left: 20px; color: orange; font-size:14px;">만원 이상인 금액을 입력해주세요.</span>
					</div>
					<div style="display: inline-block; padding: 20px; height: 300px; background-color: lightgray;">
						<div style="display: flex;"><div><i class="material-icons" style="color: #126196">help</i></div>&nbsp;<div>수수료를 제외하면 얼마나 받을 수 있나요?</div></div>
						<p>위 금액을 모으는데 성공하실 경우 대략 <span>0000000</span> 원 정도를 받게 됩니다. <br>
						총 모금액에서 대략적으로 아래와 같은 금액이 공제됩니다.
						</p>
						<div class="feeInfo">
							<div><b>항목</b></div>
							<div><b>금액</b></div>
						</div>
						<div class="feeInfo">
							<div>결제대행 수수료(3%+VAT)</div>
							<div><span id="pay-fee">0000</span>원</div>
						</div>
						<div class="feeInfo">
							<div>플랫폼 수수료(5%+VAT)</div>
							<div><span id="plat-fee">0000</span>원</div>
						</div>
						<div class="feeInfo">
							<div>공제의 합계</div>
							<div><span id="fee-sum">0000</span>원</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>프로젝트<br>마감일 설정</span>
				</div>
				<div class="write-content-block">
					<div>
						<span>펀딩이 끝나는 마감일을 정해주세요.<br>펀딩 마감일은 오늘로부터 60일 이내의 날짜중에 고를 수 있습니다.</span>
					</div>
					<div style="padding-top: 10px; padding-bottom: 10px;">
						<span>오늘로부터 </span>
						<input type="text" class="form-control inputSu" id="seeEndDays" />
						<span> 일 뒤인 </span>
						<input type="date" class="form-control inputDay" id="_endDate" min="" max="" />
						<span> 에 펀딩을 마감합니다.</span>
					</div>
					<div>
						<span>펀딩에 성공할 경우, 마감일 다음날부터 7일간 결제가 진행되어 </span><span id="calEndDate">20xx년 x월 xx일</span><span>에 모든 후원자의 결제가 종료됩니다.</span>
					</div>
				</div>
			</div>
			
			<div class="write-section">
				<div class="write-category">
					<span>리워드 설정</span>
				</div>
				<div class="write-content-block">
					<div style="display: flex;">
						<div style="width: 80%;">
							<span>후원자들에게 드릴 리워드 내용을 입력하세요.</span>
						</div>
						<!-- <div class="add-btn-area">
							<div class="material-icons">add_circle
							</div>
							<div>
								리워드 추가
							</div>
						</div> -->
						<button style="background-color: white; border: 0;">
							<div class="add-btn-area">
								<div class="material-icons">add_circle
								</div>
								<div>
									리워드 추가
								</div>
							</div>
						</button>
					</div>
					<div id="reward-container">
					<%for(int i=0; i<3; i++) {%>
						<div class="reward">
							<div class="reward-header">
								<div>
									<div>
										<span>후원금액</span>
									</div>
									<div>
										<input type="number" class="form-control inputShort" placeholder="내용을 입력해주세요." />
										<span>원 후원자들에게 드리는 선물</span>
									</div>
								</div>
								<div>
									<div class="change-remove-seq-area">
										<div class="material-icons">import_export</div>
										<div>
											순서 변경
										</div>
									</div>
								</div>
							</div>
							<div class="rewardProduct-container">
								<div class="reward-col">
									<div class="first-row">
										<span>구성품 이름</span>
									</div>
									<div class="second-row">
										<span>수량</span>
									</div>
								</div>
								<div class="reward-col">
									<div class="first-row">
										<input type="text" class="form-control inputLong" placeholder="내용을 입력해주세요." />
									</div>
									<div class="second-row">
										<input type="number" class="form-control inputLong" placeholder="수량" />
									</div>
									<div class="third-row">
										<div class="add-btn-area">
											<div class="material-icons">add_circle
											</div>
											<div>
												구성품 추가
											</div>
										</div>
									</div>
								</div>
								<div class="reward-col">
									<div class="first-row">
										<input type="text" class="form-control inputLong" placeholder="내용을 입력해주세요." />
									</div>
									<div class="second-row">
										<input type="number" class="form-control inputLong" placeholder="수량" />
									</div>
									<div class="third-row">
										<div class="add-btn-area">
											<div class="material-icons">remove_circle
											</div>
											<div>
												삭제
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="reward-detail-container">
								<div>
									<span>선물 설명</span>
								</div>
								<div>
									<input type="text" class="form-control inputLong" id="" placeholder="예) 배송비 포함, 얼리버드, (선물세트 A) 등" />
								</div>
							</div>
							<div class="reward-deli-container">
								<div>
									<span>예상 발송일</span>
								</div>
								<div>
									마감일로부터 <input type="number" class="form-control inputSu" id=""  /> 일 뒤인
									<input type="date" class="form-control inputDay" id=""  /> 에 리워드를 전달하겠습니다.
								</div>
							</div>
							<div class="reward-isdeli-container">
								<span>배송 여부</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="radio" class="" id="isDeli_"  />
								<label for="isDeli_">배송하는 상품입니다.</label>
								<input type="radio" class="" id="isNotDeli_" />
								<label for="isNotDeli_">배송하는 상품입니다.</label>
							</div>
						</div>
						<%} %>
						
					</div>
				</div>
			</div>

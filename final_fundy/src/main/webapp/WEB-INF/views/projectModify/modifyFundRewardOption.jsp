<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%
	double payfee = 0.03;
	double platfee = 0.05;
	double vat = 0.1;
%>
<script>
	$(function () {
		$("#reward-container").sortable({ 
			item : '>.reward',
			stop : function(event, ui) {
				for(var i=0; i<$(".reward_priority").length; i++) {
					$(".reward_priority").eq(i).val(i);
					$(".reward-delete-button").eq(i).attr("onclick", "fn_removeReward(" + i + ")");
					$(".deliveryPicker").eq(i).attr("onchange", "calDeliDays(" + i + ")");
				}
				$(".reward-delete-button").css("display", "inline-block");
				$(".reward-delete-button").eq(0).css("display", "none");
			}
		});
		
		for(var i=0; i<$(".rewardDeli").length; i++) {
			var temp = $(".rewardDeli").eq(i).val().substr(0,10);
			$(".rewardDeli").eq(i).val(temp);
			$(".rewardDeli").eq(i).change();
		}
		var temp = $("#_endDate").val().substr(0,10);
		$("#_endDate").val(temp);
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
						<input type="text" class="form-control input38Per inputMoney" maxlength="12" id="_goalPrice" placeholder="내용을 입력해주세요." value="${project.GOALPRICE }" /> 원
						<span style="margin-left: 20px; color: orange; font-size:14px;">만원 이상인 금액을 입력해주세요.</span>
					</div>
					<div style="display: inline-block; padding: 20px; height: 300px; background-color: lightgray;">
						<div style="display: flex;"><div><i class="material-icons" style="color: #126196">help</i></div>&nbsp;<div>수수료를 제외하면 얼마나 받을 수 있나요?</div></div>
						<p>위 금액을 모으는데 성공하실 경우 대략 <span id="actually-goal-price">0</span> 원 정도를 받게 됩니다. <br>
						총 모금액에서 대략적으로 아래와 같은 금액이 공제됩니다.
						</p>
						<div class="feeInfo">
							<div><b>항목</b></div>
							<div><b>금액</b></div>
						</div>
						<div class="feeInfo">
							<div>결제대행 수수료(<%=Math.round(payfee*100) %>%+VAT)</div>
							<div><span id="pay-fee-cal">0</span>원<input id="payfee" type="hidden" value="<%=payfee + (payfee*vat) %>" /></div>
						</div>
						<div class="feeInfo">
							<div>플랫폼 수수료(<%=Math.round(platfee*100) %>%+VAT)</div>
							<div><span id="plat-fee-cal">0</span>원<input id="platfee" type="hidden" value="<%=platfee + (platfee*vat) %>" /></div>
						</div>
						<div class="feeInfo">
							<div>공제의 합계</div>
							<div><span id="total-fee">0</span>원</div>
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
						<input type="text" maxlength="2" class="form-control inputSu" onchange="changePayEndCalDeliDate()" id="seeEndDays" />
						<span> 일 뒤인 </span>
						<input type="text" class="form-control inputDay datePicker" id="_endDate" onchange="changePayEndCalDeliDate()" value="${project.ENDDATE }" />
						<span> 에 펀딩을 마감합니다.</span>
					</div>
					<div>
						<span>펀딩에 성공할 경우, 마감일 다음날부터 7일간 결제가 진행되어 </span><span id="calEndDate">0000년 00월 00일</span><span>에 모든 후원자의 결제가 종료됩니다.</span>
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
						<button id="add-reward-btn" onclick="fn_addReward()" style="background-color: white; border: 0;">
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
						<script>
							$(function() {
								$(".deliveryPicker").datepicker({
						            dateFormat: 'yy-mm-dd' //Input Display Format 변경
						            ,showOtherMonths: false //빈 공간에 현재월의 앞뒤월의 날짜를 표시
						            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
						            ,changeYear: false //콤보박스에서 년 선택 가능
						            ,changeMonth: false //콤보박스에서 월 선택 가능              
						            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
						            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
						            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
						            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
						            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
						            ,minDate: 0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
						            ,maxDate: "+365D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
								});
							});
						</script>
						
						<c:forEach var="reward" items="${project.rewards }" varStatus="vs">
							<div class="reward">
								<div class="reward-header">
									<div>
										<div>
											<span>후원금액</span>
										</div>
										<div>
											<input type="text" class="form-control inputShort inputMoney rewardMoney" oninput="addCommas()" placeholder="내용을 입력해주세요." value="${reward.FUNDPRICE }" />
											<span>원 후원자들에게 드리는 선물</span>
										</div>
									</div>
									<div>
										<div class="change-remove-seq-area" style="cursor: pointer;">
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
									<c:forEach items="${reward.OPTIONDETAILLIST }" var="option" varStatus="detailVs">
										<div class="reward-col product-col">
											<div class="first-row">
												<input type="text" class="form-control inputLong rewardName" placeholder="내용을 입력해주세요." value="${option.PACKAGENAME }" />
											</div>
											<div class="second-row">
												<input type="number" class="form-control inputLong rewardCnt" placeholder="수량" value="${option.PACKAGEAMOUNT }" />
											</div>
											<c:choose>
												<c:when test="${detailVs.index == 0 }">
													<div class="third-row">
														<button class='add-product' onclick="fn_addProduct()" style="background-color: white; border: 0;">
															<div class="add-btn-area">
																<div class="material-icons">add_circle
																</div>
																<div>
																	구성품 추가
																</div>
															</div>
														</button>
													</div>
												</c:when>
												<c:otherwise>
													<div class='third-row'>
														<button class='remove-btn' onclick='fn_removeProduct()'>
															<div class='remove-btn-area'>
																<div class='material-icons'>remove_circle
																</div>
																<div>
																	삭제
																</div>
															</div>
														</button>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</c:forEach>
								</div>
								<div class="reward-deli-container">
									<div>
										<span>예상 발송일</span>
									</div>
									<div>
										마감일로부터 <input type="text" maxlength="3" oninput="caldeliDate()" class="form-control inputSu deli-day" /> 일 뒤인
										<input type="text" class="form-control inputDay deliveryPicker rewardDeli" onchange="calDeliDays(${vs.index})" value="${reward.DELIVERYDATE }" /> 에 리워드를 전달하겠습니다.
									</div>
								</div>
								<div class="reward-delete-container">
									<button onclick="fn_removeReward(${vs.index})" class="reward-delete-button remove-btn">
										<div class="remove-btn-area">
											<div class="material-icons">remove_circle
											</div>
											<div>
												리워드 삭제
											</div>
										</div>
									</button>
								</div>
								<input type="hidden" class="reward_priority" value="" />
							</div>
						</c:forEach>
						
					</div>
				</div>
			</div>

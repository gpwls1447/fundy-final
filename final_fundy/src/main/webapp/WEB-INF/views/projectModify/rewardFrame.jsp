<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="reward">
	<div class="reward-header">
		<div>
			<div>
				<span>후원금액</span>
			</div>
			<div>
				<input type="text" class="form-control inputShort inputMoney rewardMoney" oninput="addCommas()" placeholder="내용을 입력해주세요." />
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
		<div class="reward-col product-col">
			<div class="first-row">
				<input type="text" class="form-control inputLong rewardName" placeholder="내용을 입력해주세요." />
			</div>
			<div class="second-row">
				<input type="number" class="form-control inputLong rewardCnt" placeholder="수량" />
			</div>
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
		</div>
	</div><!-- 
	<div class="reward-detail-container">
		<div>
			<span>선물 설명</span>
		</div>
		<div>
			<input type="text" class="form-control inputLong rewardContent" id="" placeholder="예) 배송비 포함, 얼리버드, (선물세트 A) 등" />
		</div>
	</div> -->
	<div class="reward-deli-container">
		<div>
			<span>예상 발송일</span>
		</div>
		<div>
			마감일로부터 <input type="text" maxlength="3" oninput="caldeliDate()" class="form-control inputSu deli-day" /> 일 뒤인
			<input type="text" class="form-control inputDay deliveryPicker rewardDeli" onchange="calDeliDays(0)" /> 에 리워드를 전달하겠습니다.
		</div>
	</div>
	<!-- <div class="reward-isdeli-container">
		<span>배송 여부</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<form name='selDeliFrm' class="selDeliFrmC">
			<input id="isDeli" type="radio" class="isDeli selDeli" name="selDeli" value="" />
			<label for="isDeli" class="isDeliLa">배송하는 상품입니다.</label>
			<input id="isNotDeli" type="radio" class="isNotDeli selDeli" name="selDeli" value="" />
			<label for="isNotDeli" class="isDeliNotLa">배송하지않는 상품입니다.</label>
		</form>
	</div> -->
	<div class="reward-delete-container">
		<button onclick="fn_removeReward(0)" class="reward-delete-button remove-btn">
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
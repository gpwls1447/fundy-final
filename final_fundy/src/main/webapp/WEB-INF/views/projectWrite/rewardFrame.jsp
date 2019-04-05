<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="reward">
	<div class="reward-header">
		<div>
			<div>
				<span>후원금액</span>
			</div>
			<div>
				<input type="text" class="form-control inputShort inputMoney" placeholder="내용을 입력해주세요." />
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
		<div class="reward-col">
			<div class="first-row">
				<input type="text" class="form-control inputLong" placeholder="내용을 입력해주세요." />
			</div>
			<div class="second-row">
				<input type="number" class="form-control inputLong" placeholder="수량" />
			</div>
			<div class="third-row">
				<button class='add-product' onclick="fn_addProduct(0)" style="background-color: white; border: 0;">
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
		<div class='reward-col'>
			<div class='first-row'>
				<input type='text' class='form-control inputLong' placeholder='내용을 입력해주세요.' />
			</div>
			<div class='second-row'>
				<input type='number' class='form-control inputLong' placeholder='수량' />
			</div>
			<div class='third-row'>
				<button class='remove-btn' onclick='fn_removeProduct(0, 0)'>
					<div class='remove-btn-area'>
						<div class='material-icons'>remove_circle
						</div>
						<div>
							삭제
						</div>
					</div>
				</button>
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
		<input type="number" value="0" class="reward_priority" />
	</div>
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
</div>
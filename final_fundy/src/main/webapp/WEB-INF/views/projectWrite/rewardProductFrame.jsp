<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class='reward-col product-col'>
	<div class='first-row'>
		<input type='text' class='form-control inputLong' placeholder='내용을 입력해주세요.' />
	</div>
	<div class='second-row'>
		<input type='number' class='form-control inputLong' placeholder='수량' />
	</div>
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
</div>
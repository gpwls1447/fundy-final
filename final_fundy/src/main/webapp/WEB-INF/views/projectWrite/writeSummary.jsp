<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			
			<div class="write-section">
				<div class="write-category">
					<span>카테고리 설정</span>
				</div>
				<div class="write-content-block">
					<div>카테고리를 설정해주세요.</div>
					<div>
						<select class="form-control inputShort">
							<option disabled="disabled" selected="selected">중분류 카테고리</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
						&nbsp;&nbsp;&nbsp;
						<select class="form-control inputShort subCode">
							<option disabled="disabled" selected="selected" value="">소분류 카테고리</option>
							<option class="" value="s01">가</option>
							<option class="" value="s02">나</option>
							<option class="" value="s03">다</option>
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
						<input type="text" value="${write.title }" class="form-control inputLong projectTitle" maxlength="20" placeholder="내용을 입력해주세요." />
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
					<div id="thumnail-drag" style="width:500px; height:281.25px; background-color: black;">
						<button onclick="fn_uploadThumnail()" style="width: 100%; height: 100%;">이미지</button>
						<div style="display:none">
							<input type="file" name="projectThumnail" value="" />
							<input type="hidden" class="projectThumnail" value="default" />
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
						<textarea name="" class="form-control inputLong projectSummary" rows="6" placeholder="내용을 입력해주세요."></textarea>
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
						<input type="text" name="" class="form-control memberNick" maxlength="20" placeholder="내용을 입력해주세요." style="display: inline-block; width: 97.5%;" />
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
						<img alt="" src="resources/images/user_icon.png">
						<div style="display:none">
							<input type="file" name="memberProfile" />
							<input type="hidden" class="memberProfile" value="" />
						</div>
					</div>
				</div>
			</div>
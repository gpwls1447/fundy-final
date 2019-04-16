<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
.proj-list-wrapper {
	width: 1024px;
	display: flex;
	flex-flow: column nowrap;
	align-items: center;
}

.proj-search-result {
	font-size: 30px;
	margin: 20px;
}

.proj-category {
	width: 100%;
	display: flex;
	justify-content: space-between;
	margin: 20px 0 40px 0;
}

.proj-list-order {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.proj-list-order>select {
	padding: 5px 10px;
	margin-right: 10px;
}

.proj-list-box {
	width: 900px;
	display: flex;
	padding: 23px;
	box-sizing: border-box;
	margin: 20px;
	border: 1px solid #ccc;
	transition: .2s linear;
	position: relative;
}

.proj-list-box:hover {
	box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.2);
	cursor: pointer;
}

.proj-list-thumnail {
	display: flex;
	align-items: center;
	justify-content: center;
	flex: 4 1 0;
}

.proj-list-thumnail>img {
	width: 97%;
	height: 97%;
}

.proj-list-title {
	font-size: 30px;
	font-weight: bold;
	line-height: 50px;
}

.proj-list-body {
	padding-left: 20px;
	flex: 7 1 0;
	display: flex;
	flex-flow: column;
	justify-content: space-between;
}

.proj-list-body>hr {
	margin: 5px 0;
	width: 25px;
}

.proj-creator {
	font-weight: bold;
}

.proj-brief {
	color: #666;
}

.proj-progbar-container {
	position: relative;
	width: 100%;
}

.proj-progbar-emtpy {
	background-color: #eee;
	height: 5px;
	width: 100%;
	margin-bottom: 10px;
}

.proj-progbar-filled {
	position: absolute;
	top: 0;
	height: 5px;
	width: 60%;
	background-color: var(- -basic-color);
	margin-bottom: 10px;
}

.proj-progbar-info {
	display: flex;
	justify-content: space-between;
	line-height: 35px;
}

.favorite-header {
	width: 100%;
	display: flex;
	justify-content: center;
	font-size: 35px;
	font-weight: bold;
	margin: 30px 0px 0px 0px;
	padding-top: 18px;
	color: var(- -basic-color);
}

.favorite-icon {
	font-size: 50px;
	padding-right: 20px;
	color: var(- -basic-color);
}

.favorite-header2 {
	width: 100%;
	display: flex;
	justify-content: center;
	font-size: 15px;
	font-weight: light;
	padding-top: 10px;
	padding-bottom: 20px;
}

.delete-btn {
	outline: 1px solid darkgray !important;
	border: none;
	background-color: white;
	display: flex;
	position: absolute;
	height: 40px;
	display: flex;
	margin-top: 21px;
	right: 20px;
	top: 0;
	
	
}

.favoriteList {
	display: flex;
}

.favoriteNull {
	border: 1px solid darkgray;
	margin-top: 60px;
	margin-bottom: 45px;
	padding: 30px 100px;
	font-size: 15px;
	font-weight: light;
	text-align: center;
}

.favoriteNull span {
	font-weight: bold;
	font-size: 20px;
}

.favoriteNull-icon {
	font-size: 40px;
	color: var(- -basic-color);
}
</style>
<body>
	<div class="proj-list-wrapper">
		<div class="favorite-header">
			<i class="material-icons favorite-icon">favorite</i>찜바구니
		</div>
		<div class="favorite-header2">[ 찜한 상품들을 한 눈에 볼 수 있고, 찜을 취소할 수
			있습니다. ]</div>
		<c:choose>
			<c:when test="${fn:length(map['list'])==0}">
				<div class="favoriteNull">
					<i class="material-icons favoriteNull-icon">info_outline</i><br>
					<span>찜한 리워드가 없습니다.</span> <br>프로젝트에서 찜하기를 눌러주세요.
				</div>

			</c:when>
			<c:otherwise>
				<c:forEach items="${map['list']}" var="list">
					<div class="favoriteList">
						<!-- 찜바구니 리스트 -->
						<div class="proj-list-box" data-project-no="${list.projectNo}">
							<div class="proj-list-thumnail">
								<img
									src="${path }/resources/projectRepresent/${list.projectThumnail}">
							</div>
							<div class="proj-list-body">
								<div class="proj-list-title">${list.projectTitle}</div>
								<div class="proj-creator">${list.projectEmail}</div>
								<input type="hidden" name="${list.projectNo }"
									value="${list.projectNo }" />
								<hr>
								<div class="proj-brief">${list.projectSumary }</div>
								<div class="proj-progbar-container">
									<div class="proj-progbar-emtpy"></div>
									<div class="proj-progbar-filled"></div>
									<div class="proj-progbar-info">
										<span>60%</span> <span>${list.goalPrice}</span> <span>6일남음</span>
									</div>
								</div>
							</div>
							<button class="delete-btn" id="deleteBtn" name="deleteBtn">
								<i class="material-icons login-close-icon">close</i>
							</button>
						</div>

					</div>
					<!-- </form>  -->

				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${fn:length(map['list'])!=0}">
       ${map['pageBar']}
       </c:if>
	</div>
</body>
<script>
	const projBox = $('.proj-list-box');
	$(() => {
		projBox.on('click', e => {
			location.href='${path}/projectList/projectListDetail.do?projectNo='+$(e.currentTarget).data('projectNo');
		});
	});
	
	$(function(){
		$('#deleteBtn').click(function(e){
		var check = confirm('찜바구니에서 삭제하시겠습니까?');
			if(check==true){
				$.ajax({
					url:"${path}/favorite/deleteFavoriteList.do",
					type:"post",
					data:{"memberEmail":'${loggedMember.memberEmail}', 'projectNo':$(e.currentTarget).parent().data('projectNo')},
					dataType:"json",
					success:function(data){
						alert('삭제되었습니다.');
						location.reload();
					}
				});
			} else {
				return false;
			}
		});
	});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
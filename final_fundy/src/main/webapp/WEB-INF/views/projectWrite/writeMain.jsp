<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	session.setAttribute("projectNo", request.getAttribute("projectNo"));
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${path }/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="${path }/resources/css/projectWrite.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function() {
		$('#viewLoading').hide();
		///////////////////////////////
		/* 스마트에디터 로드*/
		var loadFlag = false;	//스마트에디터 로드가 됐는지 판별하는 플래그변수
		//전역변수
	    var obj = [];
		
		$(".smartEditorLoad").click(function () {
			var currentTab = Number($("#tabCnt").val());
			if(currentTab == 2 && loadFlag == false) {
			    //스마트에디터 프레임생성
			    nhn.husky.EZCreator.createInIFrame({
			        oAppRef: obj,
			        elPlaceHolder: "editor",
			        sSkinURI: "${path }/resources/editor/SmartEditor2Skin.html",
			        htParams : {
			            // 툴바 사용 여부
			            bUseToolbar : true,            
			            // 입력창 크기 조절바 사용 여부
			            bUseVerticalResizer : true,    
			            // 모드 탭(Editor | HTML | TEXT) 사용 여부
			            bUseModeChanger : true,
			        }
			    });
			    loadFlag = true;
			}
			
		})
		
		///////////////////////////////
		/* datePicker로드 */
		$(".datePicker").datepicker({
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
                ,maxDate: "+60D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
		});
		
		/* 리워드 삭제버튼 감추기 */
		$(".reward-delete-button").eq(0).css("display", "none");
		
		///////////////////////////////
		/* 작성 완성률 */
		//퍼센테이지를 계산하기위해 각 제이슨 멤버변수를 공백으로 초기화했음.
		var percentage = 0;
		var rewards;
		var writeData = new Object();
		var contentCnt = 0;
		fn_loadedWriteData();	//임시저장된 프로젝트신청서시 퍼센테이지 계산후 로드
		
		/* 작성완성률 퍼센테이지 갱신이벤트 연결 */
		$("input").keyup(function () {
			fn_loadedWriteData();
		});
		$("article:not(iframe)").click(function() {
			fn_loadedWriteData();
		});
		$("#reward-container").click(function() {
			fn_loadedWriteData();
		});
		
		
		///////////////////////////////////////////////////////
		/* 카테고리 중분류 선택시 그거에맞는 카테고리 출력 */
		$("#_mainCtg").change(function() {
			var mainCtg = $("#_mainCtg").val();	//중분류 카테고리 코드값 가져오기
			mainCtg = "." + mainCtg;	//중분류 카테고리 선택자로 초기화
			$(".subCtgs").css("display", "none");	//소분류 카테고리 display 설정 none
			$(mainCtg).css("display", "block");	//(중분류 카테고리 코드값을 클래스로가지는 소분류카테고리) display 설정
			$("#subCtgs").prop("selected", true);
		});
		
		///////////////////////////////////////////////////////
		/* 목표금액 입력시 수수료 계산및 공제금액과 실제 프로젝트창작자에게 들어가는 금액 계산 */
		$("#_goalPrice").keyup(function () {
			var goalPrice = Number(removeCommas($("#_goalPrice").val().replace(/[^0-9]/g,"")));
			var payfee = Number($("#payfee").val());
			var platfee = Number($("#platfee").val());
			realGoal = goalPrice - (goalPrice*payfee) - (goalPrice*platfee);
			$("#pay-fee-cal").text((Math.round(goalPrice*payfee)).toLocaleString());
			$("#plat-fee-cal").text((Math.round(goalPrice*platfee)).toLocaleString());
			$("#total-fee").text((Math.round(goalPrice*payfee + goalPrice*platfee)).toLocaleString());
			$("#actually-goal-price").text((goalPrice - Math.round(goalPrice*payfee + goalPrice*platfee)).toLocaleString());
		});
		/* 목표금액 입력시 콤마추가 */
		$(".inputMoney").on("keyup", function() {
			$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
		});
		
		///////////////////////////////////////////////////////
		/* 마감일키입력 숫자만 입력받게변경및 마감일 계산 */
		$("#seeEndDays").on("keyup", function () {
			$(this).val($(this).val().replace(/[^0-9]/g,""));
			var inVal = Number($(this).val());
			if(inVal > 60) {
				$(this).val($(this).val().substring(0,1));
			}
			inVal = Number($(this).val());
			//마감일계산
			var today = new Date();
			today.setDate(today.getDate() + inVal);
			$("#_endDate").datepicker('setDate', today);
			
			//자동결제 종료일 출력
			payEndDate($("#_endDate").val());
		});
		$("#_endDate").change(function() {
			var today = formatDate(new Date());
			$("#seeEndDays").val(dateDiff($("#_endDate").val(), today));
			$(".deliveryPicker").datepicker( "option", "minDate", payEndDate($("#_endDate").val()) );
			//자동결제 종료일 출력
			payEndDate($("#_endDate").val());
		});
		
		
		
		///////////////////////////////////////////////////////
		//3자리 단위마다 콤마 생성 하고 삭제하는 함수
		function addCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function removeCommas(x) {
		    if(!x || x.length == 0) return "";
		    else return x.split(",").join("");
		}
		
		
		///////////////////////////////////////////////////////
		/* 날짜 차이계산 함수 */
		function dateDiff(date1, date2) { 
			var arrDate1 = date1.split("-");
			var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
			var arrDate2 = date2.split("-");
			var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
			var getDiffTime = getDate1.getTime() - getDate2.getTime();

			return Math.floor(getDiffTime / (1000 * 60 * 60 * 24)); 
		}
		/* 날짜포맷 변경 함수 '-' */
		function formatDate(date) { 
			var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
			
			if (month.length < 2) 
				month = '0' + month;
			if (day.length < 2) 
				day = '0' + day;
			
			return [year, month, day].join('-'); 
		}
		/* 날짜포맷 변경함수 '년월일' */
		function formatDateKor(date) { 
			var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear(); 
			
			if (month.length < 2) 
				month = '0' + month;
			if (day.length < 2) 
				day = '0' + day;
			
			return year + "년 " + month + "월 " + day + "일";
		}
		/* 결제종료일 계산 함수 */
		function payEndDate(date) {
			var arrDate = date.split("-");
			var getDate = new Date(parseInt(arrDate[0]),parseInt(arrDate[1])-1,parseInt(arrDate[2]));
			getDate.setDate(getDate.getDate() + 7);
			
			//return getDate;
			$("#calEndDate").text(formatDateKor(getDate));
		}
		
		///////////////////////////////////////////////////////
		/*폼데이터 값받아오고 퍼센테이지 계산하는 함수 페이지 전체로드시 실행된다. */
		function fn_loadedWriteData() {
			percentage = 0;
			
			if(obj.length > 0) {
				obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
			}
			writeData.minorCode = $("#_subCode").val();		//소분류코드
			writeData.projectTitle = $("#_projectTitle").val();
			writeData.projectThumnail = $("#projectThumnailCk").val();	//프로젝트썸네일 밸류 확인
			writeData.projectSumary = $("#_projectSummary").val();
			writeData.memberNick = $("#_memberNick").val();
			//writeData.memberProfile = $("#memberProfileCk").val();	//창작자 프로필 확인
			writeData.goalPrice = removeCommas($("#_goalPrice").val());	//콤마를 제거하여 데이터삽입
			writeData.endDate = $("#_endDate").val();
			writeData.projectContent = $("#editor").val();
			writeData.projectTelF = $("#_projectTelF").val();
			writeData.projectTelM = $("#_projectTelM").val();
			writeData.projectTelE = $("#_projectTelE").val();
			writeData.projectEmail = $("#_projectEmail").val();
			writeData.bank = $("#_bank").val();
			writeData.accNum = $("#_accNum").val();
			writeData.accName = $("#_accName").val();
			//writeData.accType = $(".accType:checked").val();
			//writeData.birthday = $("#_birthday").val();
			
			rewards = new Array();	//리워드 배열
			var rewardsLength = $(".reward").length;
			for(var i=0; i<rewardsLength; i++) {
				var reward = new Object();
				
				reward.packageNo = (i+1);
				reward.rewardMoney = removeCommas($(".rewardMoney").eq(i).val());
				reward.deliDay = $(".rewardDeli").eq(i).val();
				
				var products = new Array();	//리워드 구성품들배열
				for(var j=0; j<$(".reward").eq(i).find($(".rewardName")).length; j++) {
					var product = new Object();
					
					product.packageNo = i;
					product.rewardName = $(".reward").eq(i).find(".rewardName").eq(j).val();
					product.rewardCnt = $(".reward").eq(i).find(".rewardCnt").eq(j).val();
					
					products[j] = product;
				}
				reward.products = products;
				console.log(i + ":" + reward.rewardMoney);
				writeData.rewards = rewards;
				
				rewards[i] = reward;
			}
			
			$.each(writeData,function(key,value) {
				if(value != null && value.length > 0 && percentage < 100 && value != "<p>&nbsp;</p>") {
					percentage = percentage + ((1/Object.keys(writeData).length) * 100);
				}
			});
			
			percentage = Math.round(percentage);
			$("#progress-span").html(percentage + "%");
			$(".progress-bar").css("width", percentage + "%");
			writeData.projectPhone = $("#_projectTelF").val() + $("#_projectTelM").val() + $("#_projectTelE").val();
			if(percentage >= 100) {
				$("#project-entry-btn").removeClass('disabled');
			}
			else {
				$("#project-entry-btn").addClass('disabled');
			}
		}
		
		//프로젝트 데이터베이스에 저장하는 함수
		function projectSaving() {
			fn_loadedWriteData();
			
			var jsonData = JSON.stringify(writeData);
			$("#viewLoading").fadeIn(500);
			$.ajax({
				url: "${path }/projectWrite/tempSaveProject.do?projectNo=${projectNo }",
				data: jsonData,
				dataType: "html",
				type: "POST",
			    contentType:"application/json;charset=UTF-8",
				success: function(data) {
					for(var i=0; i<rewards.length; i++) {
						jsonData = JSON.stringify(rewards[i]);
						
						$.ajax({
							url: "${path }/projectWrite/tempSaveProjectReward.do?projectNo=${projectNo }",
							data: jsonData,
							dataType: "html",
							type: "POST",
						    contentType:"application/json;charset=UTF-8",
							success: function(data) {
								$("#viewLoading").fadeOut(500);
							}
						});
					}
				}
			});
		}
		
		///////////////////////////////////////////////////////////
		/* 프로젝트 대표이미지 */
		$("#_projectThumnail").change(function() {
            var file = $("#_projectThumnail")[0].files[0];
            var formData = new FormData();
            formData.append("upFile", file);
			
			$.ajax({
				url: '${path }/upload/projectThumnail.do?projectNo=${projectNo}',
				data: formData,
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data) {
					$("#projectThumnailCk").val(data);
					$("#thumnail-img").attr("width", "100%");
					$("#thumnail-img").attr("height", "100%");
					$("#thumnail-img").attr("src", data);
					fn_loadedWriteData();
				}
			});
			
		});
		///////////////////////////////////////////////////////////
		/* 프로필 이미지 */
		$("#_memberProfile").change(function() {
            var file = $("#_memberProfile")[0].files[0];
            var formData = new FormData();
            formData.append("upFile", file);
			
			$.ajax({
				url: '${path }/upload/memberProfile.do?memberEmail=${creator.getMemberEmail() }',
				data: formData,
				processData: false,
				contentType: false,
				type: 'POST',
				success: function(data) {
					$("#memberProfileCk").val(data);
					$("#profile-image").attr("src", data);
					fn_loadedWriteData();
				}
			});
			
		});
		
		///////////////////////////////////////////////////////////
		/* 프로젝트 검토요청하기 */
		$("#project-entry-btn").click(function() {
			fn_loadedWriteData();
			projectSaving();
			
			if(percentage >= 100) {		//작성완성률이 100%여야 검토요청이가능 우선 신청페이지내용 데이터베이스에 저장후 작성한프로젝트상태를 신청함으로 변환
				$("#viewLoading").fadeIn(500);
				$.ajax({
					url: "${path }/projectWrite/entryProject.do?projectNo=${projectNo }",
					dataType: "html",
					success: function(data) {
						alert(data);
						$("#viewLoading").fadeOut(500);
						location.href="${path }/";
					}
				});
			}
			else {
				console.log("작성완성률이 100%가 되어야 검토요청이 가능합니다.");
			}
		});
		
		///////////////////////////////////////////////////////////
		/* 프로젝트 임시저장하기 */
		$("#projectSaveTemp-btn").click(function() {
			projectSaving();
		});
	});
	
	
	/* number tel maxlength 함수 */
	function maxLengthCheck(object){
		if (object.value.length > object.maxLength){
			object.value = object.value.slice(0, object.maxLength);
		}    
	}
	/* 썸네일변경 */
	function fn_uploadThumnail() {
		$(".projectThumnail").click();
	}
	/* 프로필변경 */
	function fn_uploadProfile() {
		$("#_memberProfile").click();
	}
	
	
	///////////////////////////////////////////////////////
	/* 탭변환 함수 */
	function fn_changeTab(select) {
		var currentTab = select;
		$("#tabCnt").val(currentTab);
        $(".write-detail").removeClass('selected');
        $(".write-detail").eq(select).addClass('selected');
        
        $("#write-next-btn").removeClass("disabled");
    	$("#write-back-btn").removeClass("disabled");
        
        if(currentTab == $(".write-detail").length - 1) {
        	$("#write-next-btn").addClass("disabled");
        }
        else if (currentTab == 0) {
        	$("#write-back-btn").addClass("disabled");
        }
        
        $(".nav-tabs").removeClass("nav-selected");
        $(".nav-tabs").eq(currentTab).addClass("nav-selected");
	}
	function fn_changeTabNext() {
		var currentTab = Number($("#tabCnt").val());
		if(currentTab < $(".write-detail").length - 1) {
			currentTab = currentTab + 1;
			$("#tabCnt").val(currentTab);
		}
		
		if(currentTab < $(".write-detail").length) {
			$(".write-detail").removeClass('selected');
	        $(".write-detail").eq(currentTab).addClass('selected');
	        $(".nav-tabs").removeClass("nav-selected");
	        $(".nav-tabs").eq(currentTab).addClass("nav-selected");
	        if(currentTab == $(".write-detail").length - 1) {
	        	$("#write-next-btn").addClass("disabled");
	        }
	        else {
	        	$("#write-back-btn").removeClass("disabled");
	        }
		}
	}
	function fn_changeTabBack() {
		var currentTab = Number($("#tabCnt").val());
		if(currentTab > 0) {
			currentTab = currentTab - 1;
			$("#tabCnt").val(currentTab);
		}
		
		if(currentTab >= 0 ) {
			$(".write-detail").removeClass('selected');
	        $(".write-detail").eq(currentTab).addClass('selected');
	        $(".nav-tabs").removeClass("nav-selected");
	        $(".nav-tabs").eq(currentTab).addClass("nav-selected");
	        if(currentTab == 0) {
	        	$("#write-back-btn").addClass("disabled");
	        }
	        else {
	        	$("#write-next-btn").removeClass("disabled");
	        }
		}
	}
	
	/* reward추가ajax */
	function fn_addReward() {
		var rewardCnt = 0;
		if($(".reward") != null){
			rewardCnt = $(".reward").length;
		}
		else {
			var rewardCnt = 0;
		}
		
		if(rewardCnt < 5) {
			$.ajax({
				url: "${path }/projectWrite/addReward.do" ,
				dataType: "html", 
				success: function(data) {
					$("#reward-container").append(data);
					$(function() {
						
					});
					for(var i=0; i<$(".reward_priority").length; i++) {
						$(".reward_priority").eq(i).val(i);
						$(".reward-delete-button").eq(i).attr("onclick", "fn_removeReward(" + i + ")");
						$(".add-product").eq(i).attr("onclick", "fn_addProduct(" + i + ")");
						$(".deliveryPicker").eq(i).attr("onchange", "calDeliDays(" + i + ")");
						
						$(".isDeli").eq(i).attr("id", "isDeli"+i);
						$(".isNotDeli").eq(i).attr("id", "isNotDeli"+i);
						$(".isDeliLa").eq(i).attr("for", "isDeli"+i);
						$(".isDeliNotLa").eq(i).attr("for", "isNotDeli"+i);
					}
				}
			});
		}
	}
	
	function fn_removeReward(index) {
		$(".reward").eq(index).remove();
		$(".reward-delete-button").css("display", "inline-block");
		for(var i=0; i<$(".reward_priority").length; i++) {
			$(".reward_priority").eq(i).val(i);
			$(".reward-delete-button").eq(i).attr("onclick", "fn_removeReward(" + i + ")");
			$(".add-product").eq(i).attr("onclick", "fn_addProduct(" + i + ")");
			$(".deliveryPicker").eq(i).attr("onchange", "calDeliDays(" + i + ")");
		}
		$(".reward-delete-button").eq(0).css("display", "none");
	}
	function fn_addProduct() {
		var target = $(event.target).closest('.rewardProduct-container');
		var length = $(event.target).closest('.rewardProduct-container').children('.product-col').length;
		if(length < 5) {
			$.ajax({
				url: "${path }/projectWrite/addRewardProduct.do" ,
				dataType: "html", 
				success: function(data) {
					target.append(data);
				}
			});
		}
	}
	function fn_removeProduct() {
		$(event.target).closest('.reward-col').remove();
	}
	function addCommas() {
		var val = $(event.target).val();
		val = val.replace(/[^0-9]/g,"").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(event.target).val(val);
	}
	
	/* 리워드 배송일 날짜계산 함수 */
	function caldeliDate() {
		var val = $(event.target).val();
		val = val.replace(/[^0-9]/g,"");
		$(event.target).val(val);	//숫자만입력받게함
		
		var endDay = Number($("#seeEndDays").val());
		
		var today = new Date();
		today.setDate(today.getDate() + endDay + Number(val));
		$(event.target).siblings(".deliveryPicker").datepicker('setDate', today);
	}
	function calDeliDays(index) {
		var endDay = $("#_endDate").val();
		var deliEndDate = $(".deliveryPicker").eq(index).val();
		if(endDay != "") {
			var arrDate1 = deliEndDate.split("-");
			var getDate1 = new Date(parseInt(arrDate1[0]),parseInt(arrDate1[1])-1,parseInt(arrDate1[2]));
			var arrDate2 = endDay.split("-");
			var getDate2 = new Date(parseInt(arrDate2[0]),parseInt(arrDate2[1])-1,parseInt(arrDate2[2]));
			var getDiffTime = getDate1.getTime() - getDate2.getTime();

			var result = Math.floor(getDiffTime / (1000 * 60 * 60 * 24)); 
			
			$(".deli-day").eq(index).val(result);
		}
	}
	function changePayEndCalDeliDate() {
		var payEndVal = $("#seeEndDays").val();
		
		for(var i=0; i<$(".deliveryPicker").length; i++) {
			var endDay = Number($(".deli-day").eq(i).val());
			
			var today = new Date();
			today.setDate(today.getDate() + endDay + Number(payEndVal));
			$(".deli-day").eq(i).siblings(".deliveryPicker").datepicker('setDate', today);
		}
	}

</script>
	<section class="projectWrite-section section">
		<div class="projectWrite-header">프로젝트신청
		</div>
		<div class="projectWrite-nav">
			<div class="nav-tabs nav-selected"><button onclick="fn_changeTab(0)">프로젝트 개요</button></div>
			<div class="nav-tabs"><button onclick="fn_changeTab(1)">펀딩/리워드/옵션</button></div>
			<div class="nav-tabs smartEditorLoad"><button onclick="fn_changeTab(2)">프로젝트 소개</button></div>
			<div class="nav-tabs"><button onclick="fn_changeTab(3)">계좌 및 인증</button></div>
		</div>
		
		<!-- 신청서영역 -->
		<article class="progress-area" style="display:block;">
			<div class="write-section">
				<div class="write-category">
					<span>작성 완성률</span><input type="hidden" id="percentage" value="0" />
				</div>
				<div class="write-content-flex">
					<div class="progress-container">
						<div class="progress" style="height: 10px;">
							<div class="progress-bar" style="width:0%; background-color: #126196"></div>
						</div> 
						<sup>작성률이 100%가 되어야 프로젝트 검토요청하기를 할수있습니다.</sup>
					</div>
					<div class="progress-percent">
						<span id="progress-span">0%</span>
					</div>
					<div>
						<button class="btn btn-primary" style="background-color: #126196; border: 0px; margin-right: 5px;">미리보기</button>
						<button id="project-entry-btn" class="btn btn-primary disabled" style="background-color: #FF8C00; border: 0px;">검토 요청하기</button>
					</div>
				</div>
			</div>
		</article>
		
		<article class="write-detail write-summary selected">
			<c:import url = "writeSummary.jsp"> 
				<c:param name = "midCategoryList" value = "${midCategoryList }" /> 
				<c:param name = "minorCategoryList" value = "${minorCategoryList }" /> 
				<c:param name="creator" value="${creator }" />
			</c:import>
		</article>
		
		<article class="write-detail fund-reward-option">
			<jsp:include page="writeFundRewardOption.jsp"></jsp:include>
		</article>
		
		<article class="write-detail intro">
			<jsp:include page="writeProjectIntro.jsp"></jsp:include>
		</article>
		
		<article class="write-detail account-certification">
			<jsp:include page="writeAccount.jsp"></jsp:include>
		</article>
		
		<article id="write-btn-container">
			<button class="btn btn-secondary write-btn smartEditorLoad" id="write-back-btn" onclick="fn_changeTabBack()" style="border: 0px;">이전</button>
			<button class="btn btn-primary write-btn" id="projectSaveTemp-btn" style="background-color: #FF8C00; border: 0px;">임시저장</button>
			<button class="btn btn-primary write-btn smartEditorLoad" id="write-next-btn" onclick="fn_changeTabNext()" style="background-color: #126196; border: 0px;">다음</button>
		</article>
		<input type="hidden" id="tabCnt" value="0" />
	</section>
<div id='viewLoading' class="spinner-border" style="width:150px; height:150px; position: fixed; top: 250px;"></div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${path }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="${path }/resources/css/projectWrite.css" rel="stylesheet">
<script>
	$(function() {
		var loadFlag = false;
		//전역변수
	    var obj = [];
		
		$(".smartEditorLoad").click(function () {
			var currentTab = Number($("#tabCnt").val());
			if(currentTab == 2 && loadFlag == false) {
			    //스마트에디터 프레임생성
			    nhn.husky.EZCreator.createInIFrame({
			        oAppRef: obj,
			        elPlaceHolder: "editor",
			        sSkinURI: "./resources/editor/SmartEditor2Skin.html",
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
		
		/* 작성 완성률 */
		//퍼센테이지를 계산하기위해 각 제이슨 멤버변수를 공백으로 초기화했음.
		var percentage = Number($("#percentage").val());
		var writeData = new Object();
		var contentCnt = 0;
		writeData.subCtg = "";
		writeData.projectTitle = "";
		writeData.projectThumnail = "";
		writeData.projectSummary = "";
		writeData.memberNick = "";
		writeData.memberProfile = "";
		writeData.goalPrice = "";
		writeData.endDate = "";
		writeData.projectContent = "";
		writeData.projectTel = "";
		writeData.projectEmail = "";
		writeData.bank = "";
		writeData.accNum = "";
		writeData.accType = "";
		writeData.birthday = "";
		$("*").keyup(function () {
			console.clear();
			console.log("완성률: " + percentage);
			
			writeData.projectTitle = $(".projectTitle").val();
			
			writeData.projectSummary = $(".projectSummary").val();
			writeData.memberNick = $(".memberNick").val();
			
			writeData.goalPrice = $(".goalPrice").val();
			writeData.endDate = $(".endDate").val();
			var tel = "";
			for(var i=0; i<$(".projectTel").length; i++) {
				tel = tel + $(".projectTel").eq(i).val();
			}
			writeData.projectTel = tel;
			writeData.projectEmail = $(".projectEmail").val();
			writeData.accNum = $(".accNum").val();
			
			writeData.birthday = $(".birthday").val();
			
			
		});
		
		$("article:not(iframe)").click(function() {
			console.clear();
			writeData.subCtg = $(".subCode").val();
			writeData.projectThumnail = $(".projectThumnail").val();
			writeData.memberProfile = $(".memberProfile").val();
			writeData.bank = $("#bank_").val();
			writeData.accType = $(".accType:checked").val();
			if(obj.length > 0) {
				obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
				projectContent = $("#editor").val();
				writeData.projectContent = $("#editor").val();
			}
			
			$.each(writeData,function(key,value) {
				console.log('key:'+key+', value:'+value);
				if(value != null && value.length > 0) {
					percentage = percentage + (1/Object.keys(writeData).length * 100);
				}
			});
			console.log(percentage);
			$("#progress-span").html(percentage + "%");
			$(".progress-bar").css("width", percentage + "%");
			percentage = 0;
		})
		
		
	});
	
	
	
	/* 썸네일변경 */
	function fn_uploadThumnail() {
		$(".projectThumnail").click();
	}
	
	
	/* 탭변환 */
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
						<sup>작성률이 100%가 되어야 다음페이지로 넘어갑니다.</sup>
					</div>
					<div class="progress-percent">
						<span id="progress-span">0%</span>
					</div>
					<div>
						<button class="btn btn-primary" style="background-color: #126196; border: 0px; margin-right: 5px;">미리보기</button>
						<button class="btn btn-primary" style="background-color: #FF8C00; border: 0px;">검토 요청하기</button>
					</div>
				</div>
			</div>
		</article>
		
		<article class="write-detail write-summary selected">
			<jsp:include page="writeSummary.jsp"></jsp:include>
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
			<button class="btn btn-primary write-btn" id="" onclick="" style="background-color: #FF8C00; border: 0px;">임시저장</button>
			<button class="btn btn-primary write-btn smartEditorLoad" id="write-next-btn" onclick="fn_changeTabNext()" style="background-color: #126196; border: 0px;">다음</button>
		</article>
		<input type="hidden" id="tabCnt" value="0" />
		
		<form name="projectContent">
		</form>
	</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
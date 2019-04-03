<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트개요</title>
<script src="${path }/resources/js/jquery-3.3.1.js"></script>
<script src="${path }/resources/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="${path }/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR" rel="stylesheet">
<link href="${path }/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${path }/resources/css/basic.css" rel="stylesheet">
<link href="${path }/resources/css/header.css" rel="stylesheet">
<link href="${path }/resources/css/projectWrite.css" rel="stylesheet">
</head>
<script type="text/javascript">
    $(function(){
        //전역변수
        var obj = [];              
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
        //전송버튼
        $("#insertBoard").click(function(){
            //id가 smarteditor인 textarea에 에디터에서 대입
            obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
            //폼 submit
            $("#insertBoardFrm").submit();
        });
        $("*").click(function() {
        	console.log("DD");
        	obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
	        var projectContent = $("#editor").val();
	        if(projectContent != null) {
	        	console.log(projectContent);
	        }
        });
    });
</script>
<body>
	    <form action="./insertBoard.do" method="post" id="insertBoardFrm" enctype="multipart/form-data">
        <textarea name="editor" id="editor" style="width: 700px; height: 400px;"></textarea>
        <input type="button" id="insertBoard" value="등록" />
    </form>
</body>
</html>
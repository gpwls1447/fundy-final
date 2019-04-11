<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<style>
	.comment-count
	{
	    width: 100%;
	    font-size: 21px;
	    font-weight: bold;
	}
	
	.comment-warning
	{
	    font-size: 13px;
	    margin: 10px 0 20px 0;
	}
	
	.textarea
	{
	    width: 100%;
	    height: auto;
	    border-bottom: 1px solid #ccc;
	    padding-bottom: 5px;
	    font-size: 15px;
	}
	
	.textarea:focus + .textarea-bar
	{
	    width: 100%;
	}
	
	.textarea-bar
	{
	    align-self: center;
		display: block;
	    width: 0;
	    height: 1px;
	    background-color: #444;
	    margin-top: -1px;
	    transition: .4s ease;
	}
	
	.write-btn-set
	{
	    display: flex;
	    width: 100%;
	    justify-content: flex-end;
	}
	
	.cancel-btn{margin: 5px 15px 15px 0; padding: 8px 25px}
	
	.write-btn{margin: 5px 0 15px 0; padding: 8px 35px;}
	
	.comment-unit
	{
	    width: 100%;
	    margin: 25px 0 0 0;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: center;
	}
	
	.reply-unit
	{
		margin: 5px 0 0 0;
	}
	
	.comment-header
	{
	    width: 100%;
	    display: flex;
	}
	
	.comment-profile
	{
	    width: 50px;
	    height: 50px;
	    border-radius: 50%;
	    margin-right: 15px;
	}
	
	.comment-nick-date
	{
	    width: 100%;
	    display: flex;
	    flex-flow: column nowrap;
	    justify-content: center;
	    transform: translateY(-5px);
	    position: relative;
	}
	
	.comment-nick
	{
	    width: 100%;
	    font-size: 16px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.comment-date
	{
	    font-size: 13px;
	    color: gray;
	}
	
	.comment-menu-btn
	{
	    color: gray;
	    cursor: pointer;
	    margin-bottom: -10px;
	}
	
	.comment-menu
	{
	    position: absolute;
	    right: 0;
	    top: 40px;
	    box-shadow: 1px 1px 3px 0 rgba(0, 0, 0, .4);
	    color: gray;
	    padding: 5px 0;
	    border-radius: 3px;
	    display: none;
	    z-index: 5;
	}
	
	.comment-menu i
	{
	    margin-right: 10px;
	    transform: translateY(5px);
	    color: gray;
	    font-size: 21px;
	}
	
	.comment-menu > div
	{
	    padding: 0 30px 5px 25px;
	    font-size: 14px;
	    cursor: pointer;
	}
	
	.comment-menu > div:hover
	{
	    background-color: #eee;
	}
	
	.comment-text
	{
	    width: 100%;
	    padding-left: 65px;
	    font-size: 14px;
	    box-sizing: border-box;
	    margin: 5px 0;
	}
	
	.comment-footer
	{
	    width: 100%;
	    padding-left: 65px;
	    box-sizing: border-box;
	    display: flex;
	    flex-flow: column nowrap;
	    align-items: flex-start;
	    font-size: 15px;
	    font-weight: bold;
	}
	
	.comment-btn-container > button:active
	{
	    background-color: #ccc;
	}
	
	.comment-btn-container
	{
	    color: #444;
	    margin-top: -10px;
	}
	
	.like-btn
	{
	    font-size: 18px;
	    transform: translate(-6px, 9px);
	    cursor: pointer;
	    padding: 8px;
	    border-radius: 50%;
	    color: #777;
	}
	
	.like-btn:active{background-color: #ccc;}
	
	.reply-btn
	{
	    font-weight: bold;
	    margin-left: -7px;
	    font-size: 13px;
	    transform: translateY(-2px);
	   	color: #777;
	}
	
	.toggle-reply
	{
	    cursor: pointer;
	    font-size: 14px;
	    margin-bottom: 5px;
	    color: #222;
	}
	
	.reply-container
	{
	    width: 100%;
	    margin-top: 5px;
	    padding-left: 65px;
	    box-sizing: border-box;
	}
	
	.liked
	{
	    color: var(--basic-color);
	}
	
	.edit-bar
	{
	    display: none;
	    width: 100%;
	    height: 1px;
	    background-color: #444;
	    margin-top: 10px;
	}
	
	#marginer
	{
	    width: 100%;
	    display: block;
	    margin: 15px 0;
	}
</style>
<div id="comment-container">
<div class="comment-count">댓글 ${totalCount }개</div>
<div class="comment-warning">본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있으며. 해당 내용으로 인해 메이커, 후원자, 제3자에게 피해가 가지 않도록 유의하시기 바랍니다.</div>
<div class="textarea comment-textarea" contenteditable="true"></div>
<span class="textarea-bar"></span>
<div class="write-btn-set">
	<button class="cancel-btn cancel-comment nude-btn ripple">취소</button>
	<button class="write-btn write-comment basic-btn basic-btn-active ripple">등록</button>
</div>

<span id="marginer"></span>

<c:forEach items="${list }" var="list">
<div data-comment-no="${list.commentNo }" class="comment-unit">
    <div class="comment-header">
        <img class="comment-profile" src="${path }/resources/images/memberProfile/${list.memberProfile}">
        <div class="comment-nick-date">
            <div class="comment-nick">${list.memberNick }<i class="material-icons comment-menu-btn">more_vert</i></div>
            <fmt:formatDate value="${list.commentDate }" var="cDate" pattern="yyyy.MM.dd mm:ss"/>
            <div class="comment-date">${cDate }</div>
            <div class="comment-menu">
				<div class="edit-btn"><i class="material-icons">edit</i>수정</div>
				<div class="delete-comment-btn"><i class="material-icons">delete</i>삭제</div>
            </div>
        </div>
    </div>
    <div class="comment-text">${list.commentContent }</div>
    <span class="edit-bar"></span>
    <div class="write-btn-set">
        <button class="cancel-btn cancel-edit nude-btn ripple">취소</button>
        <button class="write-btn save-comment-edit nude-btn ripple">저장</button>
    </div>
    <div class="comment-footer">
        <div class="comment-btn-container">
            <i class="material-icons nude-btn like-btn ripple">thumb_up</i>
            <span class="like-count"></span>
            <button class="ripple nude-btn reply-btn">REPLY</button>
        </div>
        <div class="textarea reply-textarea" contenteditable="true"></div>
        <span class="textarea-bar"></span>
        <div class="write-btn-set">
            <button class="cancel-btn nude-btn cancel-reply ripple">취소</button>
            <button class="write-reply write-btn basic-btn basic-btn-active ripple">등록</button>
        </div>
        <c:if test="${fn:length(list.crList) != 0}">
        <div class="toggle-reply"><span>답글 ${fn:length(list.crList)} 보기</span><span style="display:none">답글 숨기기</span></div>
        </c:if>
    </div>
    <div class="reply-container">
        <c:forEach items="${list.crList }" var="crList">
        <div data-comment-reply-no="${crList.commentReplyNo }" class="comment-unit reply-unit">
            <div class="comment-header">
				<img class="comment-profile" src="images/default_profile_1.png">
				<div class="comment-nick-date">
				    <div class="comment-nick">${crList.memberNick }<i class="material-icons comment-menu-btn">more_vert</i></div>
				    <fmt:formatDate value="${crList.commentReplyDate }" var="replyDate" pattern="yyyy.MM.dd hh:mm:ss"/>
				    <div class="comment-date">${replyDate }</div>
				    <div class="comment-menu">
				        <div class="edit-btn"><i class="material-icons">edit</i>수정</div>
				        <div class="delete-reply-btn"><i class="material-icons">delete</i>삭제</div>
				    </div>
				</div>
            </div>
            <div class="comment-text">${crList.commentReplyContent }</div>
            <span class="edit-bar"></span>
            <div class="write-btn-set">
				<button class="cancel-btn cancel-edit nude-btn ripple">취소</button>
				<button class="write-btn save-reply-edit nude-btn ripple">저장</button>
            </div>
            <div class="comment-footer">
				<div class="comment-btn-container">
				    <i class="material-icons nude-btn like-btn ripple">thumb_up</i><span class="like-count"></span>
				</div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>
</c:forEach>
</div>
${pageBar }
<script>

	/* 페이지 바 함수 */
	var fn_paging = cPage => {
		location.href='${path}/projectList/projectListDetail_community?cPage='+cPage+'&projectNo='+${projectNo};
	};
	    //코멘트 메뉴 버튼 토글
	    var commentMenuBtn = $('.comment-menu-btn');
	    $(() => {
	        commentMenuBtn.on('mousedown', e => {
	            const commentMenu = $('.comment-menu');
	            const clickedMenu = $(e.target).parent().next().next();

	            if(commentMenuBtn.index(e.target) > -1 && commentMenu.has(':visible').index(clickedMenu) > -1)
	            {commentMenu.hide(); $('body').off('click'); return;}
	            if(commentMenu.has(':visible').length > 0)
	            {commentMenu.filter(':visible').hide();}
	            
	            clickedMenu.toggle();
	            $('body').off('click');

	            $('body').on('click', e => {
	                if(commentMenuBtn.index(e.target) > -1) return;
	                commentMenu.hide();
	                $('body').off('click');
	            });
	        });
	    });  
	    
	    //코멘트 작성
	    var commentWriteBtn = $('.write-comment');
	    $(() => {
	    	commentWriteBtn.on('click', e => {
				const commentText = $('.comment-textarea').html();
				const parsedText = commentText.replace(/(<([^>]+)>)/g, '<br>');
	    		
	    		$.ajax({
	    			type: 'post',
	    			url: '${path}/comment/insertComment.do',
	    			data: {'projectNo' : ${projectNo} , 'memberNick' : '${loggedMember.memberNick}', 'memberEmail' : '${loggedMember.memberEmail}', 'commentContent' : parsedText},
	    			dataType: 'html',
	    			success: data => {
	    				$('.cancel-comment').trigger('click');
	    				$('#marginer').after(data);
	    			}
	    		});
	    	});
	    });
	    
	    //댓글 작성
	    var replyWriteBtn = $('.write-reply');
	    $(() => {
	    	replyWriteBtn.on('click', e => {
	    		const replyText = $(e.target).parent().prev().prev().html();
	    		const parsedText = replyText.replace(/(<([^>]+)>)/g, '<br>');
	    		$.ajax({
	    			type: 'post',
	    			url: '${path}/comment/insertCommentReply.do',
	    			data: {'commentNo' : $(e.target).parent().parent().parent().data('commentNo'),
	    				'commentReplyContent' : parsedText,
	    				'memberEmail' : '${loggedMember.memberEmail}',
	    				'memberNick' : '${loggedMember.memberNick}'},
	    			dataType: 'html',
	    			success: data => {
	    				$(e.target).prev().trigger('click');
	    				$(e.target).parent().parent().next().append(data);
	    			}
	    		});
	    	});
	    });
	    
	    //답글 토글
	    var replyToggleBtn = $('.toggle-reply');
	    $(() => {
	        replyToggleBtn.parent().next().hide();
	        replyToggleBtn.on('click', e => {
	            $(e.target).toggle();
	            $(e.target).siblings().toggle();
	            $(e.currentTarget).parent().next().toggle();
	        });
	    });

	    //댓글작성 버튼 토글
	    var commentTextArea = $('.comment-textarea');
	    $(() => {
	        commentTextArea.on('focus', e => {
	            $(e.target).next().next().show();
	        });
			
	    //댓글작성 취소
	        $('.cancel-comment').on('click', e => {
	            $(e.target).parent().hide();
	            commentTextArea.text("");
	            commentTextArea.blur();
	        });
	    });
	    
	    //코멘트 삭제버튼 작동
	    var deleteCommentBtn = $('.delete-comment-btn');
	    $(() => {
	    	deleteCommentBtn.on('click', e => {
	    		$.ajax({
	    			type: 'post',
	    			url: '${path}/comment/commentDelete.do',
	    			data: {'commentNo' : $(e.currentTarget).parent().parent().parent().parent().data('commentNo')},
	    			dataType: 'json',
	    			success: data => {
	    				if(date.result == 1)
	    				{
	    					$(e.currentTarget).parent().parent().parent().parent().remove();    					
	    				}
	    				else
	    				{
	    					alert("실패");	
	    				}
	    			}
	    		});
	    	});
	    });
	    
	    //답글 삭제 버튼 바인드
	    var deleteReplyBtn = $('.delete-reply-btn');
	    $(() => {
	    	deleteReplyBtn.on('click', e => {
	    		$.ajax({
	    			type: 'post',
	    			url: '${path}/comment/commentReplyDelete.do',
	    			data: {'commentReplyNo' : $(e.currentTarget).parent().parent().parent().parent().data('commentReplyNo')},
	    			dataType: 'json',
	    			success: data => {
	    				if(date.result == 1)
	    				{
	    					$(e.currentTarget).parent().parent().parent().parent().remove();    					
	    				}
	    				else
	    				{
	    					alert("실패");	
	    				}
	    			}
	    		});
	    	});
	    });

	    //답글 작성 버튼 토글
	    $(() => {
	        $('.reply-textarea').hide();
	        $('.write-btn-set').hide();
	        $('.reply-btn').on('click', e => {
	            $(e.target).parent().next().show().focus();
	            $(e.target).parent().siblings('.write-btn-set').show();
	        });

	        $('.cancel-reply').on('click', e => {
	            $(e.target).parent().hide();
	            $(e.target).parent().prev().prev().hide();
	        });
	    });

	    //좋아요 클릭
	    var likeBtn = $('.like-btn');
	    $(() => {
	        likeBtn.on('click', e => {
	            $(e.target).toggleClass('liked');
	        });
	    });

	    //수정, 수정취소버튼 클릭 이벤트 바인드
	    var editBtn = $('.edit-btn');
	    var cancelEditBtn =$('.cancel-edit')
	    $(() => {
	        editBtn.on('click', e => {
	            const target = $(e.currentTarget).parent().parent().parent().next();

	            target.data('tempText', target.text());
	            target.data('target', target);

	            target.attr('contenteditable', 'true').focus();
	            target.next().animate({width: 'toggle'}, 200);
	            editCommon(target);
	        });

	        cancelEditBtn.on('click', e => {
	            const target = $(e.target).parent().prev().prev().data('target');

	            target.text(target.data('tempText'));
	            target.attr('contenteditable', 'false');
	            target.next().hide();
	            editCommon(target);
	        });
	    });

	    var editCommon = target => {
	        target.prev().toggle();
	        target.next().next().toggle();
	        target.next().next().next().toggle();
	    };

	    //답글 수정 저장 버튼 바인드
		var saveReplyBtn = $('.save-reply-edit');
	    $(() => {
	        saveReplyBtn.on('click', e => {
	            const target = $(e.target).parent().prev().prev();
	            const parsedText = target.html().replace(/(<([^>]+)>)/g, '<br>');
	            $.ajax({
	            	type: 'post',
	            	url: '${path}/comment/commentReplyUpdate.do',
	            	data: {'commentReplyNo' : $(e.currentTarget).parent().parent().data('commentReplyNo'),
	            		'commentReplyContent' : parsedText	
	            	},
	            });
	            saveFunction(target);
	        });
	    });
	    
	    //코멘트 수정 저장 버튼 바인드
	    var saveCommentBtn = $('.save-comment-edit');
	    $(() => {
	        saveCommentBtn.on('click', e => {
	            const target = $(e.target).parent().prev().prev();
	            const parsedText = target.html().replace(/(<([^>]+)>)/g, '<br>');
	            $.ajax({
	            	type: 'post',
	            	url: '${path}/comment/commentUpdate.do',
	            	data: {'commentNo' : $(e.currentTarget).parent().parent().data('commentNo'),
	            		'commentContent' : parsedText
	            	},
	            });
	            saveFunction(target);
	        });
	    });
	    
	    var saveFunction = target => {
	        target.attr('contenteditable', 'false');
	        target.next().hide();
	        editCommon(target);
	    };
</script>
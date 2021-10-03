<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/header.jsp" %>


    <section>
        <article class="main-container">
            <div class="wrap">   
                <h3 class="writetitle">수정하기</h3>
            </div>
        </article>
        <article class="main-container">
            <div class="wrap">
                <form class="boardWrite clearfix" action="<c:url value='/board/freeUpdate' />" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="bno" value="${article.bno}">
                    <select class="form-control">
                        <option>자유게시판</option>
                        <option>뽐내기 게시판</option>
                    </select>
                    <input class="form-control" placeholder="제목을 입력하세요" value="${article.title}" name="title" readonly>
                    <label for="file">사진첨부</label> 
                    <input type="file" class="photoBtn" name="file" id="file" >
                    <div class="imgbox">
                    	<img id="file-img" src="" style="height: inherit">
                    </div>
                    <textarea name="content" class="textArea" rows="15" style="margin-bottom: 10px;" placeholder="내용을 입력하세요">${article.content}</textarea>                        
                    <button type="button" class="listBtn"><a href="<c:url value='/board/freeboard'/>">목록</a></button>
                    <button type="submit" class="updateBtn">수정</button>
                </form>
            </div>
        </article>
    </section>

	<%@ include file="../include/footer.jsp" %>
	
	
	<script>
	//목록이동 처리
			$(function() {
				$('#listBtn').click(function() {
					location.href="<c:url value='/board/freeboard' />"
				});
			});
			
			const updateBtn = document.getElementById('updateBtn');
			updateBtn.onclick = function() {
					if(document.updateForm.title.value === '') {
						alert('제목은 필수 항목 입니다.');
						document.updateForm.title.focus();
						return;
					} else if(document.updateForm.content.value === '') {
						alert('내용은 필수 항목 입니다.');
						document.updateForm.content.focus();
						return;
					} else {
						document.updateForm.submit();
						location.href="<c:url value='/board/freeboard' />"
					}
			};
			
			 //자바 스크립트 파일 미리보기 기능
			function readURL(input) {
	        	if (input.files && input.files[0]) {
	        		
	            	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
	            	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
		        	reader.readAsDataURL(input.files[0]); 
	            	//파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
		            $(".imgbox").css("display", "block");
	            	
	            	reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
	                	$('#file-img').attr("src", event.target.result); 
	                	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
		        	}
	        	}
		    }
			$("#file").change(function() {
		        readURL(this); //this는 #file자신 태그를 의미
		        
		    });
	
	</script>
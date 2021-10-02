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
                    <button type="button" class="photoBtn"> 사진첨부 </button>
                    <div class="imgbox"></div>
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
	
	</script>
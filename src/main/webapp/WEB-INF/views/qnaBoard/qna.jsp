<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="../include/header.jsp" %>

   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>




    <section>
        <article class = "QNA main-container">
            
            <h2>Q&A</h2>

            <!--자주하는 질문-->
            <div class="FAQ wrap">
                <h3>자주하는 질문</h3>
                <div class="list">
                    <ul>
                        <li class="question">Q. 다툼이 일어나면 어떻게 하나요?</li>
                        <li class="answer">A. 분리된 공간에 둡니다.</li>
                    
                        <li class="question">Q. 다툼이 일어나면 어떻게 하나요?</li>
                        <li class="answer">A. 분리된 공간에 둡니다.</li>
                    
                        <li class="question">Q. 다툼이 일어나면 어떻게 하나요?</li>
                        <li class="answer">A. 분리된 공간에 둡니다.</li>
                    </ul>
                </div>

            </div>

            <!--1대1 문의-->
            <div class="personal wrap">
            	<form action="<c:url value='/qnaBoard/registForm' />" name="registForm" method="post">
	                <h3>1대1 문의</h3>
	                <p>
	                   온라인 상담에 대한 답변은 보통 1-2일 정도 시간이 소요되며,
	                   유치원 일정에 따라 조금 늦어질 수 있습니다.
	                </p>
	                <p style="margin-bottom: 30px;">
	                   최대한 빠른 시일 내에 정성껏 답변 드리도록 노력하겠습니다. 
	                </p>
	
	                <div class="personal-txt">           
	                    <input type="text" class="input" id="qnaTitle" name="title" placeholder="제목">
	                    <textarea class="personal-area" id="" rows="7" name="content" placeholder="내용"></textarea>
	                </div>
				</form>
				
                <button id="counsel">상담하기</button>
            </div>

            

        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>

    <script>
    const registBtn = document.getElementById('counsel');
		registBtn.onclick = function() {
			document.registForm.submit();
		//form태그는 document.폼 네임으로 바로 접근이 가능.
		/*
			if(document.registForm.writer.value === '') {
				alert('작성자는 필수 항목 입니다.');
				document.registForm.writer.focus();
				return; //이벤트 함수 강제 종료
			} else if(document.registForm.title.value === '') {
				alert('제목은 필수 항목 입니다.');
				document.registForm.title.focus();
				return;
			} else if(document.registForm.content.value === '') {
				alert('내용은 필수 항목 입니다.');
				document.registForm.content.focus();
				return;
			} else {
				document.registForm.submit();
			}
			*/
	}
    

		$(document).ready(function(){
		    $("li.question").click(function(){
		        $(this).next().toggle("fast");
	        });
        });

    </script>
    
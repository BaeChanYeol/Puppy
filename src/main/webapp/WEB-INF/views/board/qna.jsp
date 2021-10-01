<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>

   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.js"></script>


////////////////////////////////////이거 왜 있는건지 모르겠음///////////////////////////////////////////
//////////////실제로 쓰는건 qnaBoard에 qna.jsp 쓰는 중//////////////////////////////////////////////

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
                <h3>1대1 문의</h3>
                <p>
                   온라인 상담에 대한 답변은 보통 1-2일 정도 시간이 소요되며,
                   유치원 일정에 따라 조금 늦어질 수 있습니다.
                </p>
                <p style="margin-bottom: 30px;">
                   최대한 빠른 시일 내에 정성껏 답변 드리도록 노력하겠습니다. 
                </p>

                <div class="personal-txt">           
                    <input type="text" class="input" id="qnaTitle" placeholder="제목">
                    <textarea class="personal-area" id="" rows="7" placeholder="내용"></textarea>
                </div>

                <button id="counsel">상담하기</button>
            </div>

            

        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>

    <script>

		$(document).ready(function(){
		    $("li.question").click(function(){
		        $(this).next().toggle("fast");
	        });
        });

    </script>
    
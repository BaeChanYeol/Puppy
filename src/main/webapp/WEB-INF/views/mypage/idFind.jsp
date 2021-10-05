<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


        <section>
            <article class="idFind">
                <div class="idFind-title">
                    <h2>아이디 찾기</h2>
                    <div class="idFind-logo">
                        <img src="../img/simbol.png" alt="simbol">
                    </div>
                    <h5>아이디는 생년월일, 이름, 이메일을 통해 찾을 수 있습니다.</h5>
                </div>
    
                <div class="idFindform">
                    <form action="<c:url value='/user/idFind'/>" method="POST" id="idFindForm">
                        <div class="clearfix">
                            <h5>생년월일</h5>
                            <div class="idFindform-wrap">
                                <select name="year" id="selectYear">
                                    <c:forEach var="i" begin="1920" end="2020">
	                                	<option value="${i}년 ">${i}년</option>                            	                            	
                            		</c:forEach>
                                </select>
                            </div>
                            <div class="idFindform-wrap">
                                <div class="idFindform-wrap-left">
                                    <select name="manth" id="selectMonth">
                                       <c:forEach var="i" begin="1" end="12">
                                    	<option value="${i}월 ">${i}월</option>
                                    </c:forEach>
                                    </select>
                                </div>
                                <div class="idFindform-wrap-right">
                                    <select name="day" id="selectDay">
                                        <c:forEach var="i" begin="1" end="31">
                                    		<option value="${i}일 ">${i}일</option>
                                    	</c:forEach>
                                    </select>
                                </div>
                            </div>
                            <input type="hidden" name="birth" id="selectBirth">
                        </div>
                        <h5><label for="selectName">이름</label></h5>
                        <input type="text" name="name" id="selectName" placeholder="이름을 입력해주세요~">
                        <h5><label for="selectemail">이메일</label></h5>
                        <input type="text" name="email" id="selectEmail" placeholder="이메일형식에 맞게 입력해주세요~">
                    
                        <div class="idFind-bottom clearfix">
                            <div class="idFind-bottom1">
                                <button type="submit" class="idFindBtn1">아이디 찾기</button>
                            </div>
                            <div class="idFind-bottom2">
                                <button type="button" class="idFindBtn2" >취소하기</button>
                            </div>
                        </div>
                        
    
                    </form>
                </div>
            </article>
        </section>

<%@ include file="../include/footer.jsp" %>

<script>
	
	
	$('.idFindBtn1').click(function(e) {
		e.preventDefault();
		
		if($('#selectName').val() == ''){
			alert('이름은 필수 항목입니다.');
			$('#selectName').focus();
		}else if($('#selectEmail').val()==''){
			alert('이메일은 필수 항목입니다.');
			$('#selectEmail').focus();
		}else{
			const birth = $('#selectYear').val() +  $('#selectMonth').val() + $('#selectDay').val();
			$('#selectBirth').val(birth);
			$('#idFindForm').submit();
		}
	
	});
	
	$('.idFindBtn2').click(function(e) {
		e.preventDefault();
		if(confirm('정말 취소하시겠습니까?')){
			window.history.back();
		}
	});
	
</script>


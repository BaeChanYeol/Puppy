<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>

    
    <section>
        <article class="pwChange">
            <div class="pwChange-title">
                <h2>비빌번호 변경</h2>
                <div class="pwChange-logo">
                    <img src="../img/simbol.png" alt="simbol">
                </div>
            </div>

            <div class="pwChangeform">
                <form action="<c:url value='/user/changePassword'/>" method="POST" id="pwChangeForm">
                    
                    <input type="hidden" value="${user.id}" name="id">
                    <h5><label for="newPw">새 비밀번호</label></h5>
                    <input type="password" name="newPw" id="newPw" placeholder="새 비밀번호를 입력해주세요~">
                    <span></span>
                    <h5><label for="newPwCheck">새 비밀번호 확인</label></h5>
                    <input type="password" name="newPwCheck" id="newPwCheck" placeholder="새 비빌번호를 입력해주세요~">
                
                    <div class="pwChange-bottom clearfix">
                        <div class="pwChange-bottom1">
                            <button type="submit" class="pwChangeBtn1">변경하기</button>
                        </div>
                        <div class="pwChange-bottom2">
                            <button type="button" class="pwChangeBtn2">취소하기</button>
                        </div>
                    </div>
                    

                </form>
            </div>
        </article>
    </section>

<%@ include file="../include/footer.jsp" %>

    <script>
    	if('${msg}' == '인증성공'){
    		alert('인증성공!');
    	}
    	
    	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,/,&,*,?,_,~])|([!,@,#,$,/,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

    	$('.pwChangeBtn1').click(function(e) {
			e.preventDefault();
			
			if($('#newPw').val() == '' ){
				alert('비밀번호는 필수정보입니다.');
				$('#newPw').focus();
				return;
			}else if(!getPwCheck.test($('#newPw').val()) && $('#newPw').length < 9 ){
				alert('비밀번호는 특수문자포함 9자이상입니다.');
				$('#newPw').focus();				
				return;
			}else if($('#newPw').val() !== $('#newPwCheck').val()) {
				alert('비밀번호가 일치하지 않습니다.');
				$('#newPwCheck').focus();
				return;
			}else{
				$('#pwChangeForm').submit();
			}
		});
    	$('.pwChangeBtn2').click(function() {
			if(confirm('정말 취소하시겠습니까?')){
				location.href="<c:url value='/'/>"
			}
		});
    	
    </script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



   
    <!-- 회원가입 모달 -->

 <div class="joinModal-wrap" id="join_modal">
        <div class="joinModal">
            <div class="joinModal_close">
                <a href="#"><img src="<c:url value='/img/close.png'/>" alt="close" id="close1"></a>
            </div>
            <div class="join-title">
                <h2>회원 가입</h2>
                <div class="join-logo">
                    <img src="<c:url value='/img/simbol.png'/>" alt="simbol">
                </div>
                <h5>회원정보를 입력해주세요</h5>
            </div>

            <div class="joinform">
                <form action="<c:url value='/user/join'/>" method="POST">
                    <h5><label for="id">아이디</label></h5>
                    <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요~">
                    <!-- 비동기 처리 태그 -->
                    <span class="join-check" id="id_check"></span>
                    <h5><label for="pw">비밀번호</label></h5>
                    <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요~">
                     <span class="join-check" id="pw_chk"></span>
                    <h5><label for="pw_check">비밀번호 확인</label></h5>
                    <input type="password" name="pw_check" id="pw_check" placeholder="비밀번호를 입력해주세요~">
                     <span class="join-check" id="pw_chk2"></span>
                    <h5><label for="name">이름</label></h5>
                    <input type="text" name="name" id="name" placeholder="이름을 입력해주세요~">
                     <span class="join-check" id="name_check"></span>
                    <div class="clearfix">
                        <h5>생년월일</h5>
                        <div class="joinform-wrap">
                            <select name="year" id="year">
                            	<c:forEach var="i" begin="1920" end="2020">
	                                <option value="${i}">${i}년</option>                            	                            	
                            	</c:forEach>
                            	
                            </select>
                        </div>
                        <div class="joinform-wrap">
                            <div class="joinform-wrap-left">
                                <select name="month" id="month" >
                                	<c:forEach var="i" begin="1" end="12">
                                    	<option value="${i}">${i}월</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="joinform-wrap-right">
                                <select name="day" id="day">
                                    <c:forEach var="i" begin="1" end="31">
                                    	<option value="${i}">${i}일</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h5><label for="email">이메일</label></h5>
                    <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요~">
                    <span class="join-check" id="email_check"></span>

                    <h5><label for="phone">휴대전화</label></h5>
                    <div class="joinform-phone clearfix">
                        <input type="text" name="phone" id="phone" placeholder="- 제외하고 입력해주세요!">
                        <button>인증번호받기</button>
                        <input type="text" name="phone_check" id="phone_check" placeholder="인증번호를 입력해주세요!">
                        <button class="check">인증번호확인</button>
                    </div>

                    <h5><label for="address">주소</label></h5>
                    <div class="joinform-address">
                        <input type="text" name="addNum" id="addNum" placeholder="우편번호">
                        <button type="button" id="search_address" onclick="goPopup();" >주소 찾기</button>
                        <div>
                            <input type="text" name="address1" id="address1" placeholder="기본 주소" readonly>
                            <input type="text" name="address2" id="address2" placeholder="상세 주소">
                        </div>
                    </div>
  					<input type="hidden" id="birth" name="birth">
  					
                    <button type="submit" class="joinBtn">가 입 하 기</button>       
                    
                </form>
            </div>


        </div>

    </div>
    
<script>

$(document).ready(function() {
	
	const getIdCheck = RegExp(/^[a-zA-Z0-9]{5,20}$/);
	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	const getNameCheck = RegExp(/^[가-힣]+$/);
	const getEmailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
	
	$('#id').blur(function () {
		
		if($(this).val()== ''){
			$('#id_check').html('<b style="color:red; font-size:12px ">*아이디는 필수 정보입니다.</b>');
			chk1 = false;
		}else if(!getIdCheck.test($(this).val())){
			$('#id_check').html('<b style="color:red; font-size:12px ">*영문자, 숫자조합 5~20자만 가능합니다.</b>');			
			chk1 = false;
		}else{
			
			$.ajax({
				url : "<c:url value='/user/idCheck'/>",
				type : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : 'text',
				data : $('#id').val(),
				success : function(result) {
					if(result == 'duplication'){
						$('#id_check').html('<b style="color:red; font-size:12px ">*중복된 아이디입니다.</b>');	
							chk1 = false;
					}else{
						$('#id_check').html('<b style="color:green; font-size:12px ">*사용가능한 아이디입니다.</b>');	
							chk1 = true;
					}
					
				},
				error : function() {
					alert('관리자에게 문의하세요');
					location.href="<c:url value='/'/>"
				}
			
			});
			
		} 
			
	});//아이디 검증 완료
	
	$('#pw').blur(function() {
		
		if($(this).val()==''){
			$('#pw_chk').html('<b style="color:red; font-size:12px ">*비밀번호는 필수 정보입니다.</b>');			
				chk2 = false;
		}else if(!getPwCheck.test($(this).val()) || $(this).val().length < 9){
			$('#pw_chk').html('<b style="color:red; font-size:12px ">*특수문자 포함 9자리 이상!</b>');			
				chk2 = false;
		}else{
			$('#pw_chk').html('<b style="color:green; font-size:12px ">*훌륭한 비밀번호입니다!</b>');
				chk2 = true;			
		}
		
	});	//비밀번호 검증완료
	
	$('#pw_check').blur(function() {
		
		if($(this).val()==''){
			$('#pw_chk2').html('<b style="color:red; font-size:12px ">*비밀번호확인은 필수 정보입니다.</b>');		
			chk3 = false;
		}else if($('#pw').val() != $('#pw_check').val()){
			$('#pw_chk2').html('<b style="color:red; font-size:12px ">*비밀번호가 같지 않습니다.</b>');						
			chk3 = false;
		}else{
			$('#pw_chk2').html('<b style="color:green; font-size:12px ">*훌륭한 비밀번호입니다!</b>');			
			chk3 = true;
		}		
	
	}); //비밀번호 확인 검증완료
	
	$('#name').blur(function() {
		
		if($(this).val()==''){
			$('#name_check').html('<b style="color:red; font-size:12px ">*이름은 필수 정보입니다.</b>');		
			chk4 = false;
		}else if(!getNameCheck.test($(this).val())){
			$('#name_check').html('<b style="color:red; font-size:12px ">*이름은 한글로만 작성하세요!</b>');	
			chk4 = false;
		}else{
			$('#name_check').html('<b style="color:green; font-size:12px ">*예쁘고 멋진 이름이네요!</b>');	
			chk4 = true;
		}
		
	}); //이름검증 끝
	
	$('#email').blur(function() {
		if(!getEmailCheck.test($(this).val())){
			$('#email_check').html('<b style="color:red; font-size:12px ">*올바르지 않은 이메일형식입니다.</b>');				
			chk5 = false;
		}else{			
			$('#email_check').html('<b style="color:green; font-size:12px ">*올바른 이메일형식입니다.</b>');				
			chk5 = true;
		}
		
	}); //이메일 검증 끝
	
	$('.joinBtn').click(function(e) {
		e.preventDefault();
		
		if(!chk1 && chk2 && chk3 && chk4 && chk5){
			alert('입력정보를 확인하세요');
			return;
		}else{
			const birth = $('#year').val() + '-' + $('#month').val() + '-' + $('#day').val();
			$('#birth').val(birth);
			$('form').submit();
		}
		
		
	});
	
	
	
}); // jquery 종료


function goPopup(){
	const pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp", "pop", "width=570, height=420, scrollbars=yes, resizable=yes");
};


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	document.getElementById("address1").value = roadAddrPart1;
	document.getElementById("address2").value = addrDetail;
	document.getElementById("addNum").value = zipNo;
};



</script>

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
                     <span class="join-check" id="id_check"></span>
                    <h5><label for="pw_check">비밀번호 확인</label></h5>
                    <input type="password" name="pw_check" id="pw_check" placeholder="비밀번호를 입력해주세요~">
                     <span class="join-check" id="id_check"></span>
                    <h5><label for="name">이름</label></h5>
                    <input type="text" name="name" id="name" placeholder="이름을 입력해주세요~">
                    <div class="clearfix">
                        <h5>생년월일</h5>
                        <div class="joinform-wrap">
                            <select name="year" >
                                <option value="1994">1994</option>
                            </select>
                        </div>
                        <div class="joinform-wrap">
                            <div class="joinform-wrap-left">
                                <select name="month" >
                                    <option value="12">12</option>
                                </select>
                            </div>
                            <div class="joinform-wrap-right">
                                <select name="day" >
                                    <option value="27">27</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h5><label for="email">이메일</label></h5>
                    <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요~">
                    <span class="join-check" id="id_check"></span>

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
	
	
	$('#id').blur(function () {
		
		if($(this).val()== ''){
			$('#id_check').html('<b style="color:red; font-size:12px ">*아이디는 필수 정보입니다.</b>');
		}else if(!getIdCheck.test($(this).val()){
			$('#id_check').html('<b style="color:red; font-size:12px ">*영문자, 숫자조합 5~20자만 가능합니다.</b>');			
		}else{
			
			$.ajax({
				url : "<c:url value='/user/idCheck'/>",
				type : "POST",
				headers : {
					"Content-Type" : "application/json"
				},
				dataType : text,
				data : $('#id').val(),
				success : function(result) {
					
					
				},
				error : function() {
					
				}
			
			});
			
			
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

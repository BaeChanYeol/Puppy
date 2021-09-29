<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <!-- 비밀번호로 본인인증하고 내 정보를 수정하는 페이지 -->
    <div class="mypage clearfix">
        <aside class="side">
            <h2>마이페이지</h2>
            <ul class="mysidemenu">
                <li>
                    <a href="#"> 예약 내역</a>
                </li>
                <li>
                    <a href="#" class="myhover"> <img src="../img/mymember.png" alt="구매내역"> 회원정보 수정</a>
                </li>
                <li>
                    <a href="#"> 내가 쓴 글</a>
                </li>
                <li>
                    <a href="#"> 좋아요 누른글</a>
                </li>
                <li>
                    <a href="#"> 문의내역</a>
                </li>
                <li>
                    <a href="#"> 장바구니</a>
                </li>
                <li>
                    <a href="#"> 찜한 상품</a>
                </li>
                <li>
                    <a href="#"> 구매 내역</a>
                </li>
            </ul>
        </aside>
        <section class="side-content">
            <article class="main-container">
                <div class="mytitle myinfomodify-logo">
                    <h2>
                        내정보 수정
                    </h2>
                </div>
            </article>
            <article class="main-container">
                <div class="myinfomodifyform">            
                    <form action="<c:url value='/user/update'/>" method="POST" id="updateForm">
                        <div class="myarea">
                            <label for="myId">아이디</label>
                            <input type="text" name="id" id="myId" readonly value="${user.id}">
                            
                        </div>
                        <div class="myarea">
                            <label for="myPw">비밀번호</label>
                            <input type="password" name="pw" id="myPw" >
                            <span></span>
                        </div>
                        <div class="myarea">
                            <label for="myPwChk">비밀번호 확인</label>
                            <input type="password" name="myPwChk" id="myPwChk">
                            <span></span>
                        </div>
                        <div class="myarea">
                            <label for="myName">이름</label>
                            <input type="text" name="name" id="myName" value="${user.name}">
                        </div>
                        <div class="myarea">
                            <label for="myEmail">이메일</label>
                            <input type="text" name="email" id="myEmail" value="${user.email}">
                            <span></span>
                        </div>
                        <div class="myarea myarea-top">
                            <label for="myPhone">휴대전화</label>
                            <div class="myinfomodifyform-phone clearfix">
                                <input type="text" name="phone" id="myPhone" value="${user.phone}">
                                <button type="button">인증번호받기</button>
                                <input type="text" name="myPhoneChk" id="myPhoneChk" placeholder="인증번호를 입력해주세요!">
                                <button type="button" class="check">인증번호확인</button>
                            </div>
                        </div>
                        <div class="myarea myarea-top">
                            <label for="address">주소</label>
                            <div class="myinfomodifyform-address">
                                <input type="text" name="addrZipNum" id="myAddrNum" value="${user.addrZipNum}" >
                                <button type="button" id="search_myAddress" onclick="goPopup();" >주소찾기</button>
                                <div>
                                    <input type="text" name="addrBasic" id="myAddrBasic" value="${user.addrBasic}" readonly>
                                    <input type="text" name="addrDetail" id="myAddrDetail" value="${user.addrDetail}">
                                </div>
                            </div>
                        </div>
                        
                        <div class="myinfomodify-bottom clearfix">
                            <div class="myinfomodify-bottom1">
                                <button type="submit" id="updateBtn" class="myinfomodifyBtn1">변경하기</button>
                            </div>
                            <div class="myinfomodify-bottom2">
                                <button type="button" onclick="history.back();" class="myinfomodifyBtn2">취소하기</button>
                            </div>
                        </div>
                        
                    </form>
                </div>
            </article>
        </section>
    </div>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    
    if("${msg}" == "success"){
		alert('본인인증 성공!');
	}
    
    $(document).ready(function() {
		
    	const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,/,&,*,?,_,~])|([!,@,#,/,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
    	const getNameCheck = RegExp(/^[가-힣]+$/);
    	const getEmailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);

    	$('#updateBtn').click(function(e) {
			e.preventDefault();
			if($('#myPw').val() == '' ){
				alert('비밀번호는 필수정보입니다.');
				$('#myPw').focus();
				return;
			}else if(!getPwCheck.test($('#myPw').val()) && $('#myPw').length < 9 ){
				alert('비밀번호는 특수문자포함 9자이상입니다.');
				$('#myPw').focus();				
				return;
			}else if($('#myPw').val() !== $('#myPwChk').val()) {
				alert('비밀번호가 일치하지 않습니다. 확인란을 확인하세요.');
				$('#myPwChk').focus();
				return;
			}else if($('#myName').val() == ''){
				alert('이름은 필수정보입니다.');
				$('#myName').focus();
				return;
			}else if(!getNameCheck.test($('#myName').val())){
				alert('이름은 한글로만 작성하세요!');
				$('#myName').focus();			
				return;
			}else if(!getEmailCheck.test($('#myEmail').val())){
				alert('올바르지 않은 이메일 형식입니다.');
				$('#myEmail').focus();
				return;
			}else if($('#myPhone').val().includes('-')){
				alert('- 제외하고 입력해주세요!');
				$('#myPhone').focus();
				return;
			}else{
				$('#updateForm').submit();				
			}
	
		});
    	
	});
    function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
    	document.getElementById("myAddrBasic").value = roadAddrPart1;
    	document.getElementById("myAddrDetail").value = addrDetail;
    	document.getElementById("myAddrNum").value = zipNo;
    };
    
    </script>

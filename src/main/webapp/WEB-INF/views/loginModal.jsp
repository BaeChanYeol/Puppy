<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   


   <!-- 로그인 모달 -->

<div class="loginModal-wrap" id="login_modal">
	<div class="loginModal">
		<div class="loginModal_close">
			<a href="#"><img src="<c:url value='/img/close.png'/>" alt="close" id="close"></a>
		</div>
		<h2>로그인</h2>

		<div class="loginform-wrap">
			<form action="#" method="POST">
				<div class="logininput-wrap">
					<input type="text" placeholder="아이디를 입력하세요!" name="loginId" id="loginId">
				</div>
				<div class="logininput-wrap">
					<input type="password" placeholder="비밀번호를 입력하세요!" name="loginPw" id="loginPw">
				</div>
				<div class="logininput-wrap clearfix">
					<div class="login-checkbox">
						<input type="checkbox" id="idRemember"> 아이디 저장
					</div>
					<div class="login-checkbox">
						<input type="checkbox" id="autoLogin"> 자동 로그인
					</div>
				</div>
				<div class="logininput-wrap-btn">
					<div class="logininput-wrap">
						<button class="login-btn" type="button">로그인</button>
					</div>
					<div class="logininput-wrap">
						<button class="naver-btn" type="button">네이버 로그인</button>
					</div>
					<div class="logininput-wrap">
						<button class="kakao-btn" type="button">Kakao 로그인</button>
					</div>
				</div>
			</form>

			<div class="login-modal-bottom clearfix">
				<div class="modal-bottom">
					<a href="#">회원가입</a>
				</div>
				<div class="modal-bottom">
					<a href="#">아이디찾기</a>
				</div>
				<div class="modal-bottom">
					<a href="#">비밀번호찾기</a>
				</div>
			</div>
		</div>
	</div>
</div>
    


<script>

	$(document).ready(function() {
		
		$('.login-btn').click(function() {
			
			if($('#loginId').val()==''){
				alert('아이디를 입력해주세요!');
				return;
			}else if($('#loginPw').val()==''){
				alert('비밀번호를 입력해주세요!');
				return;				
			}else{
				
				const idRemember = $('#idRemember').is(':checked');
				const autoLogin = $('#autoLogin').is(':checked');
				
				const userInfo = {
					"id" : $('#loginId').val(),
					"pw" : $('#loginPw').val(),
					"autoLogin" : autoLogin,
					"idRemember" : idRemember
				};
				
				$.ajax({
					type : "POST",
					url : "<c:url value='/user/login'/>",
					headers: {
						"Content-Type" : "application/json"
					},
					dataType: "text",
					data : JSON.stringify(userInfo),
					success: function(result) {
						console.log(result);
						if(result == "idFail" || result == "pwFail"){
							alert('아이디 혹은 비밀번호가 틀렸습니다.');
							$('#loginId, #loginPw').val('');
						}else{
							alert('로그인 성공!');
							location.href='<c:url value="/" />';
						}
		
						
					},
					erroer: function() {
						alert('관리자에게 문의하세요');
						$('#loginId, #loginPw').val('');
						location.href='<c:url value="/" />';
					}
					
				});
				
			}
			
		});
		
	});

</script>

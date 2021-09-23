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
			<form action="" method="POST">
				<div class="logininput-wrap">
					<input type="text" placeholder="아이디를 입력하세요!">
				</div>
				<div class="logininput-wrap">
					<input type="password" placeholder="비밀번호를 입력하세요!">
				</div>
				<div class="logininput-wrap clearfix">
					<div class="login-checkbox">
						<input type="checkbox"> 아이디 저장
					</div>
					<div class="login-checkbox">
						<input type="checkbox"> 자동 로그인
					</div>
				</div>
				<div class="logininput-wrap-btn">
					<div class="logininput-wrap">
						<button class="login-btn" type="submit">로그인</button>
					</div>
					<div class="logininput-wrap">
						<button class="naver-btn" type="submit">네이버 로그인</button>
					</div>
					<div class="logininput-wrap">
						<button class="kakao-btn" type="submit">Kakao 로그인</button>
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


</script>

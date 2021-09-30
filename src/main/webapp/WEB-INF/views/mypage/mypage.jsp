<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


   <section>
        <article class="main-container">
            <div class="wrap title">
                <h2>마이 페이지</h2>
            </div>
        </article>
        <article class="main-contanier">
            <div class="wrap mypage-wrap">
                <div class="profile">
                    <div class="mypage-profile profile-img">
                        <img src="../img/default_profile.png" alt="프로필">
                        <button> 프로필 편집</button>
                    </div>
                    <div class="mypage-profile profile-text">
                        <p class="name">${user.name}</p>
                        <p class="niname">${user.id}</p>
                        <p class="phon">${user.phone}</p>
                        <p>가입날짜: <span class="ragdate"> <fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd"/> </span></p>
                        <p class="email">${user.email}</p>
                    </div>
                    <div class="mypage-profile out">
                        <a href="<c:url vlaue='/user/delete'/>" onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</a>
                    </div>
                </div>
            </div>
            <div class="wrap mypage-centent clearfix">
                <div class="mypage-menu">
                    <a href="<c:url value='/reserveBoard/reserveList'/>">
                        <img src="../img/myreserve.png" alt="예약 내역">
                        <h5>예약 내역</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="<c:url value='/user/passwordCheck'/>">
                        <img src="../img/mymember.png" alt="회원정보 수정">
                        <h5>회원정보 수정</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/mytext.png" alt="내가 쓴글">
                        <h5>내가 쓴글</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/mylikelist.png" alt="좋아요 누른글">
                        <h5>좋아요 누른글</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/myinquiry.png" alt="문의내역">
                        <h5>문의내역</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/mybasket.png" alt="회원탈퇴">
                        <h5>장바구니</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/mypageheart.png" alt="찜한 상품">
                        <h5>찜한 상품</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/mybuylist.png" alt="구매 내역">
                        <h5>구매 내역</h5>
                    </a>
                </div>
            </div>

       
        </article>
    </section>
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    	if('${msg}' == 'updateSuccess'){
    		alert('회원정보 수정이 완료되었습니다.');
    	}
    
    </script>

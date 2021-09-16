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
                        <p class="name">홍길동</p>
                        <p class="niname">콩이아빠</p>
                        <p class="phon">010-1234-5678</p>
                        <p>가입날짜: <span class="ragdate">2021.09.14</span></p>
                        <p class="email">aaa1234@naver.com</p>
                    </div>
                    <div class="mypage-profile out">
                        <a href="#">회원탈퇴</a>
                    </div>
                </div>
            </div>
            <div class="wrap mypage-centent clearfix">
                <div class="mypage-menu">
                    <a href="">
                        <img src="../img/myreserve.png" alt="예약 내역">
                        <h5>예약 내역</h5>
                    </a>
                </div>
                <div class="mypage-menu">
                    <a href="">
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

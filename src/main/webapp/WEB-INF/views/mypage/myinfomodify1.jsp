<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>



    <!-- 내 정보 수정에서 비밀번호 확인페이지 -->
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
                <div class="mytitle">
                    <h2>회원 정보 수정</h2>
                </div>
            </article>
            <article class ="main-container">
                <div class="myinfomodify-title">
                    
                    <div class="myinfomodify-logo">
                        <img src="../img/simbol.png" alt="simbol">
                    </div>
                    <h4>회원님의 안전한 정보 보호를 위해 다시 한번 비밀번호를 입력해주세요.</h4>
                </div>
            
                
                <div class="myInfoModify1-passwordOk">
                    <form action="<c:url value='/user/myinfo'/>" method="POST">
                        <input type="password" name="pw" class="myInfoModify1-password" placeholder="비밀번호를 입력하세요."><br>
                        <button class="myInfoModify1-ok">확인</button>
                    </form>
                </div>
            </article>
    </section>
    </div>
    <%@ include file="../include/footer.jsp" %>
    
    <script> 
    	if("${msg}" == "pwFail"){
    		alert('비밀번호가 틀렸습니다.');
    	}
    </script>

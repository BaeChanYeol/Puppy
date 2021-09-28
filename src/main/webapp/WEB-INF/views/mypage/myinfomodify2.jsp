<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <!-- 비밀번호로 본인인증하고 내 정보를 수정하는 페이지 -->
    <div class="mypage">
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
                    <form action="" method="POST">
                        <div class="myarea">
                            <label for="">아이디</label>
                            <input type="text" name="id" id="" placeholder="아이디를 입력해주세요~">
                        </div>
                        <div class="myarea">
                            <label for="">비밀번호</label>
                            <input type="password" name="pw" id="" placeholder="비밀번호를 입력해주세요~">
                            <span></span>
                        </div>
                        <div class="myarea">
                            <label for="">비밀번호 확인</label>
                            <input type="password" name="pw_check" id="" placeholder="비밀번호를 입력해주세요~">
                            <span></span>
                        </div>
                        <div class="myarea">
                            <label for="">이름</label>
                            <input type="text" name="name" id="" placeholder="이름을 입력해주세요~">
                        </div>
                        <div class="myarea">
                            <label for="">이메일</label>
                            <input type="text" name="email" id="" placeholder="이메일을 입력해주세요~">
                            <span></span>
                        </div>
                        <div class="myarea myarea-top">
                            <label for="phone">휴대전화</label>
                            <div class="myinfomodifyform-phone clearfix">
                                <input type="text" name="phone" id="phone" placeholder="- 제외하고 입력해주세요!">
                                <button>인증번호받기</button>
                                <input type="text" name="phone_check" id="phone_check" placeholder="인증번호를 입력해주세요!">
                                <button class="check">인증번호확인</button>
                            </div>
                        </div>
                        <div class="myarea myarea-top">
                            <label for="address">주소</label>
                            <div class="myinfomodifyform-address">
                                <input type="text" name="addNum" id="addNum" placeholder="우편번호 찾기">
                                <button>우편번호찾기</button>
                                <div>
                                    <input type="text" name="address1" id="address" placeholder="기본 주소" readonly>
                                    <input type="text" name="address2" placeholder="상세 주소">
                                </div>
                            </div>
                        </div>
                        
                        <div class="myinfomodify-bottom clearfix">
                            <div class="myinfomodify-bottom1">
                                <button type="submit" class="myinfomodifyBtn1">변경하기</button>
                            </div>
                            <div class="myinfomodify-bottom2">
                                <button type="submit" class="myinfomodifyBtn2">취소하기</button>
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
    </script>

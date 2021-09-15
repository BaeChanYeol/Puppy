<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="./include/header.jsp" %>



    <div class="joinModal-wrap">

        <div class="joinModal">
            <div class="joinModal_close">
                <a href="#"><img src="./img/close.png" alt="close"></a>
            </div>
            <div class="join-title">
                <h2>회원 가입</h2>
                <div class="join-logo">
                    <img src="./img/simbol.png" alt="simbol">
                </div>
                <h5>회원정보를 입력해주세요</h5>
            </div>

            <div class="joinform">
                <form action="" method="POST">
                    <h5><label for="">아이디</label></h5>

                    <input type="text" name="id" id="" placeholder="아이디를 입력해주세요~">
                    <!-- 비동기 처리 태그 -->
                    <span></span>
                    <h5><label for="">비밀번호</label></h5>
                    <input type="password" name="pw" id="" placeholder="비밀번호를 입력해주세요~">
                    <span></span>
                    <h5><label for="">비밀번호 확인</label></h5>
                    <input type="password" name="pw_check" id="" placeholder="비밀번호를 입력해주세요~">
                    <span></span>
                    <h5><label for="">이름</label></h5>
                    <input type="text" name="name" id="" placeholder="이름을 입력해주세요~">
                    <div class="clearfix">
                        <h5>생년월일</h5>
                        <div class="joinform-wrap">
                            <select name="year" id="">
                                <option value="">1994</option>
                            </select>
                        </div>
                        <div class="joinform-wrap">
                            <div class="joinform-wrap-left">
                                <select name="month" id="">
                                    <option value="">12</option>
                                </select>
                            </div>
                            <div class="joinform-wrap-right">
                                <select name="day" id="">
                                    <option value="">27</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h5><label for="">이메일</label></h5>
                    <input type="text" name="email" id="" placeholder="이메일을 입력해주세요~">
                    <span></span>

                    <h5><label for="phone">휴대전화</label></h5>
                    <div class="joinform-phone clearfix">
                        <input type="text" name="phone" id="phone" placeholder="- 제외하고 입력해주세요!">
                        <button>인증번호받기</button>
                        <input type="text" name="phone_check" id="phone_check" placeholder="인증번호를 입력해주세요!">
                        <button class="check">인증번호확인</button>
                    </div>

                    <h5><label for="address">주소</label></h5>
                    <div class="joinform-address">
                        <input type="text" name="addNum" id="addNum" placeholder="우편번호 찾기">
                        <button>우편번호찾기</button>
                        <div>
                            <input type="text" name="address1" id="address" placeholder="기본 주소" readonly>
                            <input type="text" name="address2" placeholder="상세 주소">
                        </div>
                    </div>

                    
                    
                    <button type="submit" class="joinBtn">가 입 하 기</button>
                    

                </form>
            </div>


        </div>

    </div>
<%@ include file="./include/footer.jsp" %>


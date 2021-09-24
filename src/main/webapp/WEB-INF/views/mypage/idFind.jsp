<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


        <section>
            <article class="idFind">
                <div class="idFind-title">
                    <h2>아이디 찾기</h2>
                    <div class="idFind-logo">
                        <img src="../img/simbol.png" alt="simbol">
                    </div>
                    <h5>아이디는 생년월일, 이름, 이메일을 통해 찾을 수 있습니다.</h5>
                </div>
    
                <div class="idFindform">
                    <form action="" method="POST">
                        <div class="clearfix">
                            <h5>생년월일</h5>
                            <div class="idFindform-wrap">
                                <select name="year" id="">
                                    <option value="">1994</option>
                                </select>
                            </div>
                            <div class="idFindform-wrap">
                                <div class="idFindform-wrap-left">
                                    <select name="month" id="">
                                        <option value="">12</option>
                                    </select>
                                </div>
                                <div class="idFindform-wrap-right">
                                    <select name="day" id="">
                                        <option value="">27</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <h5><label for="name">이름</label></h5>
                        <input type="text" name="name" id="" placeholder="이름을 입력해주세요~">
                        <span></span>
                        <h5><label for="email">이메일</label></h5>
                        <input type="text" name="email" id="email" placeholder="이메일형식에 맞게 입력해주세요~">
                        <span></span>
                    
                    
                        <div class="idFind-bottom clearfix">
                            <div class="idFind-bottom1">
                                <button type="submit" class="idFindBtn1">아이디 찾기</button>
                            </div>
                            <div class="idFind-bottom2">
                                <button type="submit" class="idFindBtn2">취소하기</button>
                            </div>
                        </div>
                        
    
                    </form>
                </div>
            </article>
        </section>

<%@ include file="../include/footer.jsp" %>



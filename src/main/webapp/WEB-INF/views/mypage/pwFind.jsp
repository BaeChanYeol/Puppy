<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>

<body>
    <section>
        <article class="pwFind">
            <div class="pwFind-title">
                <h2>비밀번호 찾기</h2>
                <div class="pwFind-logo">
                    <img src="../img/simbol.png" alt="simbol">
                </div>
                <h5>비밀번호는 이름, 가입한 아이디, 이메일을 통해 찾으실 수 있습니다.</h5>
            </div>
            <div class="pwFindform">
                <form action="" method="POST">
                    
                    <h5><label for="name">이름</label></h5>
                    <input type="text" name="name" id="" placeholder="이름을 입력해주세요~">
                    
                    <h5><label for="id">아이디</label></h5>
                    <input type="text" name="id" id="" placeholder="아이디를 입력해주세요~">
                    <span></span>

                    <h5><label for="email">이메일</label></h5>
                    <input type="text" name="email" id="email" placeholder="이메일형식에 맞게 입력해주세요~">
                    <span></span>
        
        
                    <div class="pwFind-bottom clearfix">
                        <div class="pwFind-bottom1">
                            <button type="submit" class="pwFindBtn1">비밀번호 찾기</button>
                        </div>
                        <div class="pwFind-bottom2">
                            <button type="submit" class="pwFindBtn2">취소하기</button>
                        </div>
                    </div>
        
                </form>
            </div>
        </article>
    </section>
    <%@ include file="../include/footer.jsp" %>

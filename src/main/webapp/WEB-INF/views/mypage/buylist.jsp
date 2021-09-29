<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <div class="mypage clearfix">
    <aside class="side">
        <h2>마이페이지</h2>
        <ul class="mysidemenu">
            <li>
                <a href="#"> 예약 내역</a>
            </li>
            <li>
                <a href="#"> 회원정보 수정</a>
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
                <a href="#" class="myhover"> <img src="../img/mybuylist.png" alt="구매내역">구매 내역</a>
            </li>
        </ul>
    </aside>
    <section class="side-content">
        <article class="main-container">
            <div class="mytitle">
                <h2>
                    구매내역
                </h2>
            </div>
        </article>
        <article class="main-container">
            <div class="side-wrap">
                <table>
                    <tr>
                        <th>상품이미지</th>
                        <th>상품정보</th>
                        <th>구매확정</th>
                    </tr>
                    <tr>
                        <td class="buylist-img">
                            <img src="../img/basket1.jpg" alt="껌">
                        </td>
                        <td class="buylist-content">
                                <p class="buydate">2021/08/30</p>
                                <p class="buy">배송완료</p>
                                <p class="buytitle">유기농 개껌 치석제거 3SET</p>
                                <p class="buyprice">27,150원</p>
                                <p class="buyamount">5개</p>
                        </td>
                        <td class="buylist-btn">
                            <button class="buylist-btn">반품신청</button>
                            <button class="buylist-btn">교환신청</button>
                            <button class="buylist-btn">구매확정</button>
                            <button class="buylist-btn">배송조회</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="buylist-img">
                            <img src="../img/basket2.jpg" alt="껌">
                        </td>
                        <td class="buylist-content">
                                <p class="buydate">2021/08/30</p>
                                <p class="buy">배송완료</p>
                                <p class="buytitle">유기농 개껌 치석제거 3SET</p>
                                <p class="buyprice">27,150원</p>
                                <p class="buyamount">5개</p>
                        </td>
                        <td class="buylist-btn">
                            <button class="buylist-btn">반품신청</button>
                            <button class="buylist-btn">교환신청</button>
                            <button class="buylist-btn">구매확정</button>
                            <button class="buylist-btn">배송조회</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="buylist-img">
                            <img src="../img/basket3.jpg" alt="껌">
                        </td>
                        <td class="buylist-content">
                                <p class="buydate">2021/08/30</p>
                                <p class="buy">배송완료</p>
                                <p class="buytitle">유기농 개껌 치석제거 3SET</p>
                                <p class="buyprice">27,150원</p>
                                <p class="buyamount">5개</p>
                        </td>
                        <td class="buylist-btn">
                            <button class="buylist-btn">반품신청</button>
                            <button class="buylist-btn">교환신청</button>
                            <button class="buylist-btn">구매확정</button>
                            <button class="buylist-btn">배송조회</button>
                        </td>
                    </tr>
                    
                </table>
            </div>
        </article>

    </section>
</div>
    
    <%@ include file="../include/footer.jsp" %>

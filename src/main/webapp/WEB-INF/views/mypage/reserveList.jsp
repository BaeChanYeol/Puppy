<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <div class="mypage clearfix">
        <aside class="side">
            <h2>마이페이지</h2>
            <ul class="mysidemenu">
                <li>
                    <a href="#"  class="myhover"> <img src="../img/myreserve.png" alt="구매내역"> 예약 내역</a>
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
                    <a href="#"> 구매 내역</a>
                </li>
            </ul>
        </aside>
        <section class="side-content">
            <article class="main-container">
                <div class="mytitle">
                    <h2>
                       예약내역
                    </h2>
                </div>
            </article>
            <article class="maincontainer">
                <div>
                    <div class="myReserve">
                        <p>
                            <b>※ 당일 예약은 취소가 불가한 점 양해 바랍니다.</b>
                        </p>

                        <table>
                            <tr>
                                <th>번호</th>
                                <th>예약일</th>
                                <th>이용서비스</th>
                                <th>이용일</th>
                                <th>이용금액</th>
                                <th>취소가능기간</th>
                                <th>상태</th>
                            </tr>

                            <tr>
                                <td>5</td>
                                <td>9/6</td>
                                <td>유치원</td>
                                <td>9/13</td>
                                <td>42,000원</td>
                                <td>9/12 23:59까지</td>
                                <td><button>취소</button></td>
                            </tr>

                            <tr>
                                <td>4</td>
                                <td>9/6</td>
                                <td>호텔</td>
                                <td>9/10</td>
                                <td>78,000원</td>
                                <td>9/9 23:59까지</td>
                                <td><button>취소</button></td>
                            </tr>

                            <tr>
                                <td>3</td>
                                <td>9/6</td>
                                <td>유치원</td>
                                <td>9/7</td>
                                <td>42,000원</td>
                                <td>9/6 23:59까지</td>
                                <td><button>취소</button></td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>9/6</td>
                                <td>유치원</td>
                                <td>9/6</td>
                                <td>42,000원</td>
                                <td>9/5 23:59까지</td>
                                <td>취소불가</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td>9/1</td>
                                <td>유치원</td>
                                <td>9/3</td>
                                <td>42,000원</td>
                                <td>-</td>
                                <td>이용완료</td>
                            </tr>
                        </table>

                    </div>
                    <div class="pagination">

                        <button type="button" onclick="location.href='#'">&#10094;</button>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <button type="button" onclick="location.href='#'">&#10095;</button>
                        
                    </div>
                </div>
            </article>
        </section>
    </div>
    
    <%@ include file="../include/footer.jsp" %>


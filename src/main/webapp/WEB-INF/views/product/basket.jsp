<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


   <section>
        <!-- 장바구니헤더 및 이미지-->
        <article class="main-container">
            <div class="wrap title">
                <h2>장바구니</h2>
            </div>
        </article>

        <article class="main-container">
            <div class="wrap">
                <table class="basket-table">
                    <tr>
                        <th class="first"><input type="checkbox"></th>
                        <th class="basket-img">상품 이미지</th>
                        <th class="basketcontent">상품 정보</th>
                        <th class="bas-hit">수량</th>
                        <th class="bas-del">상품삭제</th>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>
                            <img src="../img/basket1.jpg" alt="basketItem4">
                        </td>
                        <td class="second">
                            <p>
                                <span class="bastitle">순면 배변패드</span><br>
                                옵션:  <span>중형견용</span><br>
                                판매가: <span>20,700원</span>
                            </p>
                        </td>
                        <td>
                            <button>-</button>
                            <span>2</span>
                            <button>+</button>
                        </td>
                        <td>
                            <button class="barbtn">상품삭제</button>
                        </td>
                    </tr>
                </table>
                <button class="basdel">전체삭제</button>
            </div>
        </article>
        <article class="main-container">
            <div class="wrap">
                <div class="basketprice">
                    <table>
                        <tr>
                            <td><strong>상품금액</strong></td>
                            <td rowspan="2">+</td>
                            <td><strong>배달비</strong></td>
                            <td rowspan="2">=</td>
                            <td><strong>총 상품 금액</strong></td>
                        </tr>
                        <tr>
                            <td>45,000원</td>
                            <td>3,000원</td>
                            <td>48,000원</td>
                        </tr>
                    </table>
                </div>
                <div class="basket-button">
                    <button>주문하기</button>
                    <button>쇼핑계속하기</button>
                </div>
            </div>
        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>

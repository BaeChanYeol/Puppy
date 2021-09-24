<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <section>
        <article class="order">
            <div class="order-title">
                <h2>주문하기</h2>
            </div>
            <div class="orderPage">
                <table class="orderPage-table">
                    <tr> 
                        <td>
                            <div class="orderPage-name">
                                <h3 class="orderPage-name">홍길동 <p class="orderPage-name"
                                        style="font-size: 0.6em; color: blue;">기본배송지</p>
                                </h3>
                                <div class="orderPage-info">
                                    <p>서울특별시 마포구 신촌로 ㅇㅇㅇ ㅁㅁ아파트 101호</p>
                                    <p>010-1234-5678</p>
                                    <select name="orderPage-require" required>
                                        <option value="orderPage-select1">배송시 요청사항 선택하기</option>
                                        <option value="orderPage-select2">직접 수령하겠습니다.</option>
                                        <option value="orderPage-select3">문 앞에 놓아주세요.</option>
                                        <option value="orderPage-select4">경비실에 맡겨주세요.</option>
                                        <option value="orderPage-select5">배송 전 휴대폰으로 연락주세요.</option>
                                        <option value="orderPage-select6">파손위험이 있는 상품이니 조심히 다뤄주세요.</option>
                                </div>
                            </div>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            <div class="orderPage-productTitle">
                                <h3 class="orderPage-productTitle">주문상품</h3>
                            </div>
                            <div class="orderPage-product1" id="orderPage-product">
                                <img class="orderPage-photo" src="../img/pad.png">
                            </div>
                            <div class="orderPage-product2" id="orderPage-product">
                                <p>친환경 부드러운 순면 강아지 패드</p>
                                <p>배송비 2,500원</p>
                                <h2 class="orderPage-product2-price">19,000원</h2>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="orderPage-account">
                                <h3 class="orderPage-account">결제금액</h3>
                            </div>
                            <div>
                                <h4 class="orderPage-price">상품금액</h4>
                                <p class="orderPage-price" id="orderPage-money">20,000</p>
                            </div>
                            <div>
                                <h4 class="orderPage-price2">배송비</h4>
                                <p class="orderPage-price2" id="orderPage-money2">2,500</p>
                            </div>
                            <div>
                                <h4 class="orderPage-allaccount">총 결제금액</h4>
                                <p class="orderPage-allaccount" id="orderPage-money3">22,500</p>
                            </div>
                        </td>

                    </tr>
                    <tr>
                        <td class="orderPage-payButtonAll">
                            <button class="orderPage-payButton">신용카드</button>
                            <button class="orderPage-payButton">계좌이체</button>
                            <button class="orderPage-payButton">휴대폰결제</button>
                        </td>
                    </tr>

                </table>
            </div> <!-- 주문페이지 끝나는 공간 -->
            <div class="orderPage-finalButton">
                <button class="orderPage-finalButton1">결제하기</button>
                <button class="orderPage-finalButton2">취소하기</button>
            </div>
        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>

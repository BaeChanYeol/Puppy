<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    


    <section>
        <article class="main-container">
            <div class="wrap title">
                <h2>주문하기</h2>
            </div>
        </article>
        <article class="main-container">
            <div class="wrap orderPage">
                <h3>구매자정보</h3>
                <table>
                    <tr class="orderPagetrtop">
                        <td class="orderPagetd">이름</td>
                        <td>홍길동</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">이메일</td>
                        <td>asd@naver.com</td>
                    </tr>
                    <tr class="orderPagetrbottom">
                        <td class="orderPagetd">휴대폰 번호</td>
                        <td>010-1234-5678</td>
                    </tr>
                </table>
            </div>
            <div class="wrap orderPage">
                <h3 class="deliverytitle">받는사람정보</h3>
                <a href="#" class="deliverybtn"> 배송지변경</a>
                <table>
                    <tr class="orderPagetrtop">
                        <td class="orderPagetd">이름</td>
                        <td>홍길동 <span class="order-basic">기본배송지</span></td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">배송주소</td>
                        <td>서울특별시 마포구 흑석동 123-45 미래건물 304호</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">연락처</td>
                        <td>010-1234-5678</td>
                    </tr>
                    <tr class="orderPagetrbottom">
                        <td class="orderPagetd">배송 요청사항</td>
                        <td>
                            <select name="orderPage-require" required>
                            <option value="orderPage-select1">배송시 요청사항 선택하기</option>
                            <option value="orderPage-select2">직접 수령하겠습니다.</option>
                            <option value="orderPage-select3">문 앞에 놓아주세요.</option>
                            <option value="orderPage-select4">경비실에 맡겨주세요.</option>
                            <option value="orderPage-select5">배송 전 휴대폰으로 연락주세요.</option>
                            <option value="orderPage-select6">파손위험이 있는 상품이니 조심히 다뤄주세요.</option>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="wrap orderPage">
                <h3>상품정보</h3>
                <table class="productinfor">
                    <tr class="orderPagetrtop">
                        <td class="order_img">상품 이미지</td>
                        <td>상품 이름</td>
                        <td>색상</td>
                        <td>수량</td>
                    </tr>
                    
                    
                    
                    
                    <c:forEach var = "vo" items="${orderList}" varStatus="st">
	                    <tr class="orderPagetrbottom">
	                        <td class="order_img"><img src="../img/snack1.jpg" alt="#"></td>
	                        <td class="items">${vo.pname}</td>
	                        <td>${vo.amount}개</td>
	                        <td>${vo.price}원</td>
	                    </tr>
	                        <input type="hidden" id="part_sum${st.count}" name="part_sum" value="${vo.amount * vo.price}">
	                        
					</c:forEach>
                </table>
              	<input type="hidden" id="length" value="${fn:length(orderList)}">
                
            </div>
            <div class="wrap orderPage">
                <h3>결제정보</h3>
                <table>
                    <tr class="orderPagetrtop">
                        <td class="orderPagetd">총상품가격</td>
                        <td class = "total_price">45,000원</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">배송비</td>
                        <td>2,500원</td>
                    </tr>
                    <tr>
                        <td class="orderPagetd">총결제가격</td>
                        <td class="final_price" >47,500원</td>
                    </tr>
                    <tr class="orderPagetrbottom">
                        <td class="orderPagetd">결제 방법</td>
                        <td>
                            <input type="radio" name="size"> 신용카드
                            <input type="radio" name="size"> 계좌이체
                            <input type="radio" name="size"> 휴대폰결제
                            <input type="radio" name="size"> 무통장입금(가상계좌)
                        </td>
                    </tr>
                </table>
            </div>
            <div class="wrap orderPagebtn">
            <a href="#">결제하기</a>
            </div>
        </article>

    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    
    //금액 세자리씩 콤마로 구분하는 함수
    function numberWithCommas(x) {
    	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
    
    $(document).ready(function(){
    	var totalPrice = 0;
        var i = 1;
        while(i <= parseInt($('#length').val())){
	        totalPrice += parseInt($('#part_sum'+i).val());
	        console.log(totalPrice);
	        i++;
        	
        }     
        document.querySelector('.total_price').textContent = numberWithCommas(totalPrice) + '원';
        document.querySelector('.final_price').textContent = numberWithCommas(totalPrice + 2500) + '원';
        
    })
    

    </script>

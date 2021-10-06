<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%
    //String name = (String)request.getAttribute("name");
    //String email = (String)request.getAttribute("email");
    //String phone = (String)request.getAttribute("phone");
    //String address = (String)request.getAttribute("address");
    //int totalPrice = (int)request.getAttribute("totalPrice");    
%>

    <section>
    
       <form name="orderRegistForm" id="orderRegistForm" action="<c:url value='/product/orderRegistForm'/>" method="post">
	        <article class="main-container">
	            <div class="wrap mytitle">
	                <h2>주문하기</h2>
	            </div>
	        </article>
	        <article class="main-container">
	            <div class="wrap orderPage">
	                <h3>구매자정보</h3>
	                <table>
	                    <tr class="orderPagetrtop">
	                        <td class="orderPagetd">이름</td>
	                        <td>${login.name}</td>
	                    </tr>
	                    <tr>
	                        <td class="orderPagetd">이메일</td>
	                        <td>${login.email}</td>
	                    </tr>
	                    <tr class="orderPagetrbottom">
	                        <td class="orderPagetd">휴대폰 번호</td>
	                        <td id="ph">${login.phone}</td>
	                    </tr>
	                </table>
	            </div>
	            <div class="wrap orderPage">
	                <h3 class="deliverytitle">받는사람정보</h3>
	                <a href="#" class="deliverybtn" onclick="goPopup();"> 배송지변경</a>
	                <table>
	                    <tr class="orderPagetrtop">
	                        <td class="orderPagetd">이름</td>
	                        <td>${login.name} <span class="order-basic">기본배송지</span></td>
	                    </tr>
	                    <tr>
	                        <td class="orderPagetd">배송주소</td>
	                        <td id="addr"> ${login.addrBasic} ${login.addrDetail} </td> <!-- ${user.addrBasic + user.addrDetail} -->
	                    </tr>
	                    <tr>
	                        <td class="orderPagetd">연락처</td>
	                        <td id="pho">${login.phone}</td>
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
	                            </select>
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
	                    	<%--  <c:if test="${ login.id == vo.writer }">  --%>
	                    	
			                    <tr class="orderPagetrbottom">
			                        <td class="order_img"><img src="../img/snack1.jpg" alt="#"></td>
			                        <td class="items">${vo.pname}</td>
			                        <td>${vo.amount}개</td>
			                        <td>${vo.price}원</td>
			                    </tr>
			                    <input type="hidden" id="part_sum${st.count}" name="part_sum" value="${vo.amount * vo.price}">
		                        <input type="hidden" name="writer" value="${login.id}"> 
		                     <%-- </c:if>  --%>
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
	            	<%-- <a href="<c:url value="/product/pay"/>">결제하기</a> --%>
	            	<button id="order_btn">결제하기</button>
	            </div>
	        </article>
 	  </form>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    
    const registBtn = document.getElementById('order_btn');
    registBtn.onclick = function() {
    	document.orderRegistForm.submit();
    	
	    	<%-- var IMP = window.IMP; // 생략가능
	        IMP.init('imp86265330'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	        var msg;
	        
	        IMP.request_pay({
	            pg : 'kakaopay',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '똑독 유치원 애견샵 결제',
	            amount : '3000',                  // 결제 금액 처리해야함
	            buyer_email : "<c:out value='${users.email}' />",
	            buyer_name : "<c:out value='${users.name}' />",
	            buyer_tel : "<c:out value='${users.phone}' />",
	            buyer_addr : "<c:out value='${users.addrBasic}' />",
	            buyer_postcode : '123-456' 
	            
	        }, function(rsp) {
	            if ( rsp.success ) {
	                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	                jQuery.ajax({
	                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	                    type: 'POST',
	                    dataType: 'json',
	                    data: {
	                        imp_uid : rsp.imp_uid
	                        //기타 필요한 데이터가 있으면 추가 전달
	                    }
	                }).done(function(data) {
	                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                    if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        
	                        alert(msg);
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
	                });
	                //성공시 이동할 페이지
	                document.orderRegistForm.submit();
	                location.href="<%=request.getContextPath()%>/product/buylist";
	                
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                location.href="<%=request.getContextPath()%>/order/payFail";
	                alert(msg);
	            }
	        }); --%>
    	
    	
    	
    }
    
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
        
        function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
        	document.getElementById("addr").value = roadAddrPart1 + addrDetail;
        	//document.getElementById("addr").innerHTML = roadAddrPart1 + addrDetail;
        };
        
        
        var test = "<c:out value='${login.phone}' />";
        console.log(test);
        var testDate = test.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
        console.log(testDate);
        document.getElementById("ph").innerHTML = testDate;
        document.getElementById("pho").innerHTML = testDate;
        
        //document.querySelectorAll('#ph, #phone').textContent = testDate;
        
        //$("#ph").textContent = testDate;
        
        //var phone_before = "<c:out value='${users.phone}' />";
        	
        	
        /*
        console.log(phone_before);
        var phone_after = phone_before.substr(0,3) + '-' + phone_before.substr(3,7) + '-' + phone_before.substr(7,11);
        console.log('hey: '+phone_after);
        document.querySelector('#phone').textContent = phone_after;
        */
    });
    

    </script>

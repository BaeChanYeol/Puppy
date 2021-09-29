<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="../include/header.jsp" %>

    <section>
        <article class="main-container">
        <form class="cart_form" action="<c:url value='/product/registForm' />" name="registForm" method="post">
            <div class="wrap">
                <div class="clearfix">
                    <div class="detail-img">
                        <img src="../img/toothbrush.jpg" alt="prodect">
                    </div>
                    <div class="detail-explan">
                    	<input type="hidden" name="pno" value="${item.pno}">
                        <div class="detail-explan-item">
                            <h4>${item.pname}</h4>
                            <div class="right-sort">
                                <p>
                                    <strong>${item.price}원</strong>
                                </p>
                            </div>
                        </div>

                        
                        <div class="detail-explan-select">
                            <select name="opt" id="opt" >
                            	 
                            	 <c:forTokens var="item" items="${item.opt}" delims="/">

       								<option value="${item}">${item}</option>
									
   								 </c:forTokens>


                            	<!-- 
                            	<c:forEach var="op" items="" varStatus="st">
 	                               <option value="">옵션을 선택하세요~</option>
                            	</c:forEach>
                            	 -->
                            	<!--  
                                <option value="">강아지 용품에만</option>
                                <option value="">넣을 생각입니다.</option>
                                <option value="">고민중이에요</option>
                                -->
                            </select>
                        </div>
                        <div class="detail-explan-zzim clearfix">
                            <button class="heart-zzim"></button>
                        </div>
                        <div class="detail-explan-exe">
                            <p><b>택배배송 3,000원</b>(주문시 결제)</p>
                        </div>
                        <div class="detail-explan-product clearfix">
                            <div class="detail-cntBtn">
                       			<div class="detail-cntBtn1"><a href="javascript:change_cnt('m')">-</a></div>
                                <div class="detail-cntBtn2">1</div>
                                <input type="hidden" name="amount" id="cnt" value="1">
                        		<div class="detail-cntBtn3"><a href="javascript:change_cnt('p')">+</a></div>
                            </div>
                            <p>강아지 실리콘 칫솔</p>
                        </div>
                        <div class="detail-explan-item3 clearfix">
                            <div class="detail-total">
                                <p>총 상품금액</p>
                                <h4 id="total_amount">${item.price}원</h4>
                            </div>
                        </div>
                        <div class="detail-explan-item4 clearfix">
                            <div>
                                <button type="submit" class="detail-btn1" id="res_btn">장바구니</button>
                            </div>
                            <div>
                                <button type="submit" class="detail-btn2" >바로구매</button>
                            </div>
                        </div>
                    </div>
                </div>
       		</div>
       				
       		</form>
        </article>
        <c:out value="${item.opt}"/>

        <article class="main-container">
            <div class="wrap">
                <div class="detail-menu clearfix">
                    <button>상품정보</button>
                    <button>리뷰</button>
                    <button>Q&A</button>
                    <button>반품/교환정보</button>
                </div>
                <div>
                    <div class="detail-product">
                        <img src="../img/ex1.png" alt="">
                    </div>
                    <div class="detail-product">
                        <img src="../img/ex1.png" alt="">
                    </div>
                    <div class="detail-product">
                        <img src="../img/ex1.png" alt="">
                    </div>

                </div>
                <div class="reviews">

                    <div class="label">
                        <h3>상품 리뷰</h3>
                    </div>

                    <table>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>별점</th>

                        <tr>
                            <td>4</td>
                            <td class="review-title">빠른 배송 좋네요</td>
                            <td>ooo2***</td>
                            <td>2021.09.07</td>
                            <td>★★★★★</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td class="review-title">쏘쏘하네요</td>
                            <td>parj***</td>
                            <td>2021.09.05</td>
                            <td>★★★★☆</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td class="review-title">택배 박스가 찢어져서 왔어요</td>
                            <td>kim6***</td>
                            <td>2021.09.04</td>
                            <td>★★★☆☆</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td class="review-title">잘 쓰고 있어요</td>
                            <td>dbs2***</td>
                            <td>2021.09.04</td>
                            <td>★★★★☆</td>
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



                <div class="qna">
                    <div class="label">
                        <h3>Q&A</h3>
                    </div>
                    <div class="qna-area">


                        <button class="p-qna">상품문의</button>
                        <table>

                            <tr>
                                <td><button>답변대기</button></td>
                                <td class="qna-title">제품 문의</td>
                                <td>dbs2***</td>
                                <td>2021.09.07</td>
                            </tr>

                            <tr>
                                <td><button>답변완료</button></td>
                                <td class="qna-title">포장 문의</td>
                                <td>kim5***</td>
                                <td>2021.09.06</td>
                            </tr>

                            <tr>
                                <td><button>답변완료</button></td>
                                <td class="qna-title">문의</td>
                                <td>park***</td>
                                <td>2021.09.04</td>
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



                <div class="refund">
                    <div class="refund-area">

                        <div class="label">
                            <h3>배송/반품/교환 관련 유의사항</h3>
                        </div>

                        <table>

                            <tr>
                                <td class="refund-title">배송정보</td>
                                <td class="refund-content">
                                    <ul>
                                        <li style="list-style: disc;">상품별로 상품 특성 및 배송지에 따라 배송유형 및 소요기간이 달라집니다.</li>
                                        <li style="list-style: disc;">일부 주문상품 또는 예약상품의 경우 기본 배송일 외에 추가 배송 소요일이 발생될 수
                                            있습니다.
                                        </li>
                                        <li style="list-style: disc;">도서 산간 지역은 별도의 배송비와 반품비가 추가될 수 있습니다.</li>
                                        <li style="list-style: disc;">상품의 배송비는 공급업체의 정책에 따라 다르오며 공휴일 및 휴일은 배송이 불가합니다.
                                        </li>
                                    </ul>
                                </td>
                            </tr>

                            <tr>
                                <td class="refund-title">취소/반품/교환 안내</td>
                                <td class="refund-content">
                                    <ul>
                                        <li style="list-style: disc;">상품하자 이외 사이즈, 색상교환 등 단순 변심에 의한 교환/반품 택배비 고객부담으로
                                            왕복택배비가
                                            발생합니다.</li>
                                        <li style="list-style: disc;">주문완료 후 재고 부족 등으로 인해 주문 취소 처리가 될 수도 있는 점 양해 부탁드립니다.
                                        </li>
                                        <li style="list-style: disc;">교환 신청은 최초 1회에 한하며, 교환 배송 완료 후에는 추가 교환 신청은 불가합니다.
                                        </li>
                                        <li style="list-style: disc;">반품/교환은 미사용 제품에 한해 배송완료 후 7일 이내 접수하여 주십시오.</li>
                                        <li style="list-style: disc;">상품하자, 오배송의 경우 택배비 무료로 교환/반품이 가능하지만 모니터의 색상차이, 착용감,
                                            사이즈의 개인의 선호도는 상품의 하자 사유가 아닙니다.</li>
                                        <li style="list-style: disc;">고객 부주의로 상품이 훼손, 변경된 경우 반품 / 교환이 불가능 합니다.</li>

                                    </ul>
                                </td>
                            </tr>

                            <tr>
                                <td class="refund-title">반품/교환 불가능한 경우</td>
                                <td class="refund-content">
                                    <ul>
                                        <li style="list-style: disc;">제품을 사용 또는 훼손한 경우, 사은품 누락, 상품 TAG, 보증서, 상품 부자재가 제거
                                            혹은
                                            분실된 경우</li>
                                        <li style="list-style: disc;">밀봉포장을 개봉했거나 내부 포장재를 훼손 또는 분실한 경우</li>
                                        <li style="list-style: disc;">시간이 경과되어 재판매가 어려울 정도로 상품가치가 상실된 경우</li>
                                        <li style="list-style: disc;">고객님의 요청에 따라 주문 제작되어 고객님 외에 사용이 어려운 경우</li>
                                        <li style="list-style: disc;">기타 전자상거래 등에서의 소비자보호에 관한 법률이 정하는 청약철회 제한사유에 해당하는 경우
                                        </li>
                                    </ul>
                                </td>
                            </tr>




                        </table>

                    </div>




                </div>
            </div>
        </article>

    </section>

    
    <%@ include file="../include/footer.jsp" %>
    
     <script>
    const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	var sel_op = $("#opt option:selected").val();
	console.log('a '+ sel_op);
    
    const registBtn = document.getElementById('res_btn');
    registBtn.onclick = function() {
    	
    	document.registForm.submit();
    }
    
    
    Number.prototype.format = function(){ 
    	if(this==0) return 0;
    	var reg = /(^[+-]?\d+)(\d{3})/;
    	var n = (this + ''); 
    	while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2'); 
    	return n; 
    }; 
    String.prototype.format = function(){ 
    	var num = parseFloat(this); 
    	if( isNaN(num) ) return "0"; 
    	return num.format(); 
    };


    
	    var basic_amount = "<c:out value='${item.price}' />"; 
	    
	    function change_cnt(t){ 
	    	//var min_qty = '수량버튼'*1; 
	    	var min_cnt = 1; 
	    	var this_cnt = $("#cnt").val()*1; 
	    	var max_cnt = '200'; // 현재 재고 
	    	if(t=="m"){ 
	    		this_cnt -= 1; 
	    		if(this_cnt < min_cnt){ 
	    			alert("수량은 1개 이상 입력해 주십시오."); 
	    			return; 
	    		} 
	    	} else if(t=="p"){ 
	    		this_cnt += 1; 
	    		if(this_cnt > max_cnt){ 
	    			alert("죄송합니다. 재고가 부족합니다."); 
	    			return; 
	    		} 
	    	} 
	    	var show_total_amount = basic_amount * this_cnt; 
	    	$("#cnt").val(this_cnt); 
	    	$('.detail-cntBtn2').html(this_cnt);
	    	$("#total_amount").val(show_total_amount); 
	    	$("#total_amount").html(show_total_amount.format()); 
	    }
		/////////////////////////////////////////////////////////////////////
		
    	var test = "<c:out value='${item.opt}'/>";
    	//console.log(test);
    	
    	//const opt_arr = test.split("/");
    	
    	
    
    </script>

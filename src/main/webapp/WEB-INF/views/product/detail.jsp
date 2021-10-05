<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="../include/header.jsp" %>
    
<style>
	.reviews .review-nonclick {
	font-size: 18px;
	height: 50px;
	border-bottom: #996633 1px solid;
	padding: 14px 5px;
	margin: 20px 0;
}

	.reviews .review-click {
	display: none;
	background-color: #fafafa;
	font-size: 18px;
	height: auto;
	padding: 14px 20px;
}

.pagination2 a {
    display: inline-block;
    width: 30px;
    height: 30px;
    border:1px solid #ccc ;
    color: #000;
    padding: 5px;
}
.pagination2 a:hover {
    color: #fff;
    background: #996633;
}
.pagination2 button {
    display: inline-block;
    width: 30px;
    height: 30px;
    border:1px solid #ccc ;
    color: #fff;
    padding: 5px;
    background: #996633;
}
</style>    

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
                    	<input type="hidden" name="pname" value="${item.pname}">
                    	<input type="hidden" name="price" value="${item.price}">
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
                            <%-- <button type="button" class="heart-zzim" onclick="location.href='<c:url value='/product/zzimRegistForm'/>'"></button> --%>
                            
                            <c:choose>
							    <c:when test="${item.zzim eq '0'}"> <!-- 찜이 안 되어 있는 상태일 때 -->
							        <button type="button" id="zzim" value="${item.zzim}" class="heart-zzim" onclick="return goZzim(this.form);"><img alt="" id="test" src="../img/heart2.png"></button>
							    </c:when>
							    <c:otherwise> <!-- 찜이 되어 있는 상태일 때 -->
							        <button type="button" id="zzim" value="${item.zzim}" class="heart-zzim" onclick="return goZzim(this.form);"><img alt="" id="test" src="../img/heart3.png"></button>
							    </c:otherwise>
							</c:choose>
                            
                            <%-- <button type="button" id="zzim" value="${item.zzim}" class="heart-zzim" onclick="return goZzim(this.form);"><img alt="" id="test" src="../img/heart2.png"></button> --%>
                        	<!-- <img alt="" id="test" src="../img/heart2.png"> -->
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
                            <p>${item.pname}</p>
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
                                <%-- <button type="button" class="detail-btn2" onclick="location.href='<c:url value='/product/orderpage?buy=${item.pno}&p_price=${item.price}&amount=$("#cnt").val();'/>'">바로구매</button> --%>
                                <button type="button" class="detail-btn2" onclick="goDirect()">바로구매</button>
                            </div>
                        </div>
                    </div>
                </div>
       		</div>
       				
       		</form>
        </article>
        <!--  <c:out value="${item.opt}"/> -->

        <article class="main-container">
            <div class="wrap">
                <div class="detail-menu clearfix">
                    <button>상품정보</button>
                    <button id="reviewBtn">리뷰</button>
                    <button id="qnaBtn">Q&A</button>
                    <button id="refundBtn">반품/교환정보</button>
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
                
                <div class="reviews" id="reviews">
					
                    <div class="label">
                        <h3>상품 리뷰</h3>
                    </div>

					
                    <table>
<!--                    <th>번호</th> -->                        
						<th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        
                        
                        <c:forEach var="vo" items="${reviewList}">
	                        <tr class="review-nonclick">
	                            <%-- <td>${vo.revno}</td> --%>
	                            <td class="review-title" id="review-title" style="padding-left:40px;">${vo.content}</td>
	                            <td>ooo2***</td>
	                            <td><fmt:formatDate value="${vo.reviewDate}" pattern="yyyy-MM-dd" /></td>
	                            
	                            
	                        </tr>
	                        <tr class="review-click">
	                        	
	                        	<td colspan="3" style="text-align:left; padding-left:40px;">${vo.content}</td>
	                        </tr>
                        </c:forEach>

                        
                        
                        

                    </table>
					
                </div>
                

                <form action="<c:url value='/product/detail#reviews' />" name="pageForm">
                    <div class="text-center">
                    
                    <input type="hidden" name="pno" value="${item.pno}">
                    <!-- 페이지 관련 버튼들이 ul 태그로 감싸져 있다. -->
                    
                    <ul class="pagination" id="pagination">
                       <c:if test="${pc.prev}"> <!-- 이전  -->
                       		<a href="#" data-pageNum="${pc.beginPage-1}">&lt;</a>
                       </c:if>
                       
                       <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                       		<a href="#" data-pageNum="${num}" class="${pc.paging.pageNum == num ? 'active' : ''}">${num}</a>
                       </c:forEach>
                       
                        <c:if test="${pc.next}"> <!-- 다음  -->
                        	<a href="#" data-pageNum="${pc.endPage+1}">&gt;</a>
                        </c:if>                    
                    </ul>
                    
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                    
                    </div>
         		</form>
         		
         		
                <form action="<c:url value='/product/reviewRegistForm' />" name="reviewRegistForm" method="post">
	                <article class="main-contaier">
	                	<!-- 리뷰 입력창 -->   
		                <div class="review-content wrap clearfix">
		                	<!-- <input type="text" class="" name="title"> -->
		                	<input type="hidden" name="pno" value="${item.pno}">
		                	
		                    <textarea class="reviewArea" id="review" name="content" rows="5" cols="130"></textarea>
		                    <button type="submit" id="reg_review">등록하기</button>
		                </div>
	        		</article>
				</form>
				


                <div class="qna" id="qna">
                    <div class="label">
                        <h3>Q&A</h3>
                    </div>
                    <div class="qna-area">


                        <!-- <button class="p-qna">상품문의</button> -->
                        <table>
							<c:forEach var="vo" items="${qnaList}">
	                            <tr>
	                                <td><button>답변대기</button></td>
	                                <td class="qna-title" id="qna-title" style="padding-left:40px;">${vo.content}</td>
	                                <td>dbs2***</td>
	                                <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
	                            </tr>
							</c:forEach>
	                           




                        </table>

                    </div>
                    
                    <form action="<c:url value='/product/detail#qna' />" name="pageForm2">
	                    <div class="text-center">
	                    
	                    <input type="hidden" name="pno" value="${item.pno}">
	                    <!-- 페이지 관련 버튼들이 ul 태그로 감싸져 있다. -->
	                    
	                    <ul class="pagination2" id="pagination2">
	                       <c:if test="${pc2.prev}"> <!-- 이전  -->
	                       		<a href="#" data-pageNum="${pc2.beginPage-1}">&lt;</a>
	                       </c:if>
	                       
	                       <c:forEach var="num" begin="${pc2.beginPage}" end="${pc2.endPage}">
	                       		<a href="#" data-pageNum="${num}" class="${pc2.paging.pageNum2 == num ? 'active' : ''}">${num}</a>
	                       </c:forEach>
	                       
	                        <c:if test="${pc2.next}"> <!-- 다음  -->
	                        	<a href="#" data-pageNum="${pc2.endPage+1}">&gt;</a>
	                        </c:if>                    
	                    </ul>
	                    
	                    <input type="hidden" name="pageNum2" value="${pc2.paging.pageNum2}">
	                    <input type="hidden" name="countPerPage2" value="${pc2.paging.countPerPage2}">
	                    
	                    </div>
         			</form>
         			
         			<form action="<c:url value='/product/qnaRegistForm' />" name="qnaRegistForm" method="post">
		                <article class="main-contaier">
		                	<!-- qna 입력창 -->   
			                <div class="review-content wrap clearfix">
			                	<!-- <input type="text" class="" name="title"> -->
			                	<input type="hidden" name="pno" value="${item.pno}">
			                	
			                    <textarea class="qnaArea" id="qna" name="content" rows="5" cols="130"></textarea>
			                    <button type="submit" id="reg_qna">등록하기</button>
			                </div>
		        		</article>
					</form>
         			
         			

                    <!-- <div class="pagination">

                        <button type="button" onclick="location.href='#'">&#10094;</button>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <button type="button" onclick="location.href='#'">&#10095;</button>

                    </div> -->



                </div>



                <div class="refund" id="refund">
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
	
	
	function goDirect(){
		location.href="<c:url value='/product/orderpage?buy=${item.pno}&p_price=${item.price}&amount="+$("#cnt").val();+"'/>";
			
	}
	
	function goZzim(frm){
		frm.action="<c:url value='/product/zzimRegistForm'/>";
		frm.submit();
		return true;	
	}
	
	$(document).ready(function(){
	    $(".review-click").click(function(){
	        $(this).next().toggle("fast");
        });
	    
	    
	   
	    
	    $(function() {
		    var zzim_status = "<c:out value='${item.zzim}' />"; 
		    $("#test").on("click", function() {
				if(zzim_status == 0){
					console.log("찜 누름!");
					//$(this).attr("src", "../img/heart3.png");
					//$(this).attr.replace("heart2.png", "heart3.png");
					$(this).attr("src", "../img/heart3.png");
					zzim_status = 1;
				} else {
					console.log("찜 해제!");
					//$(this).attr("src", "../img/heart2.png");
					//$(this).attr.replace("heart3.png", "heart2.png");
					$(this).attr("src", "../img/heart2.png");
					zzim_status = 0;
				}
		    });    
	    }); 
		
	    
	    
	  
	    $('.review-title').each(function(i,item){
	    	//console.log($(item).html());
	    	//console.log("content확인:"+ $(item).html().length);
	    	var content = "";
	    	if($(item).html().length > 7){
	    		content = $(item).html().substring(0,7) + "...";
	    		console.log("content: "+content);
				$(item).html(content);
	    	} else{
	    		$(item).html();
	    	}
	    });
	    
	    
	    $("#reviewBtn").on("click",function(event){
	          // 이동 버튼을 클릭시 pre 태그로 스크롤의 위치가 이동되도록 한다.
	          // 1. pre태그의 위치를 가지고 있는 객체를 얻어온다. => offset 객체
	          var offset = $("#reviews").offset();
	 
	          // offset은 절대 위치를 가져온다. offset.top을 통해 상단의 좌표를 가져온다.
	          // position은 부모를 기준으로한 상대위치를 가져온다.
	          $("html, body").animate({scrollTop:offset.top},600);
	 
	        });
	    
	    $("#qnaBtn").on("click",function(event){
	          var offset = $("#qna").offset();
	          $("html, body").animate({scrollTop:offset.top},600);
	        });
	    
	    $("#refundBtn").on("click",function(event){
	          var offset = $("#refund").offset();
	          $("html, body").animate({scrollTop:offset.top},600);
	        });


	    
    });

	$(document).ready(function(){
	    $(".review-nonclick").click(function(){
	        $(this).next().toggle("fast");
        });
    });
    

	
    const registBtn = document.getElementById('res_btn');
    registBtn.onclick = function(e) {
    	e.preventDefault(); 
    	document.registForm.submit();
    }
    
    
    const registBtn2 = document.getElementById('reg_review');
    registBtn2.onclick = function() {
    	document.reviewRegistForm.submit();
    }
    
    const registBtn3 = document.getElementById('reg_qna');
    registBtn3.onclick = function() {
    	document.qnaRegistForm.submit();
    }
    
    const pagination = document.getElementById('pagination');
	pagination.onclick = function(e) {
		e.preventDefault(); 
		const value = e.target.dataset.pagenum;
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	}
	
    const pagination2 = document.getElementById('pagination2');
	pagination2.onclick = function(e) {
		e.preventDefault(); 
		const value = e.target.dataset.pagenum;
		document.pageForm2.pageNum2.value = value;
		document.pageForm2.submit();
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
	    	$("#total_amount").html(show_total_amount.format()+"원"); 
	    }
		/////////////////////////////////////////////////////////////////////
		
    	var test = "<c:out value='${item.opt}'/>";
    	//console.log(test);
    	
    	//const opt_arr = test.split("/");
    	
    	
    
    </script>

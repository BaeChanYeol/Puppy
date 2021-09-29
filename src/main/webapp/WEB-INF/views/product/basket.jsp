<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<style>
.basket-cntBtn {
	width: 80px;
	height: 20px;
	margin: 0 auto;
}

.basket-cntBtn div {
	float: left;
	text-align: center;
}

.basket-cntBtn1, .basket-cntBtn3 {
	border: 1px solid black;
	width: 20px;
}

.basket-cntBtn2 {
	width: 40px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
</style>

<section>
	<!-- 장바구니헤더 및 이미지-->
	<article class="main-container">
		<div class="wrap title">
			<h2>장바구니</h2>
		</div>
	</article>

	<article class="main-container">
		<div class="wrap">
			<form name="orderForm" id="orderForm"
				action="<c:url value='/product/orderpage'/>">
				<table class="basket-table">
					<tr>
						<th class="first"><input type="checkbox" id="allCheck"></th>
						<th class="basket-img">상품 이미지</th>
						<th class="basketcontent">상품 정보</th>
						<th class="bas-hit">수량</th>
						<th class="bas-hit">상품금액</th>
						<th class="bas-del">상품삭제</th>
					</tr>

					<% int x = 1; %>
					<c:forEach var="vo" items="${cartList}" varStatus="st">
						<tr>
							<td><input type="checkbox" name="buy" class="chBox"
								id="pnum${st.count}" value="${vo.pno}" data-pno="${vo.pno}"></td>
							<td><img src="../img/basket1.jpg" alt="basketItem4"></td>
							<td class="bas-second">
								<p>
									<span class="bastitle" id="pname">${vo.pname}</span><br>
									옵션: <span>${vo.opt}</span><br> 
									판매가: <span><input
										type="hidden" name="p_price" id="price${st.count}"
										class="p_price" value="${vo.price}">${vo.price}원</span>
								</p>
							</td>
							<td>
								<div class="basket-cntBtn">
									<div class="basket-cntBtn1" class="down">
										<a onclick="javascript:basket.changePNum(<%=x%>);"
											class="down">-</a>
									</div>
									<!-- <input type="text" class="basket-cntBtn2 cnt" name="amount" id="cnt<%=x%>"  value="${vo.amount}" onkeyup="javascript:basket.changePNum(<%=x%>);" readonly="readonly" style="text-align: center; float: left; width:20px;height: 20px;">
			                        	 -->
									<input type="text" class="basket-cntBtn2 cnt" class="amount"
										name="amount" id="amount${st.count}" value="${vo.amount}"
										onkeyup="javascript:basket.changePNum(<%=x%>);"
										readonly="readonly"
										style="text-align: center; float: left; width: 20px; height: 20px;">
									<div class="basket-cntBtn3" class="up">
										<a onclick="javascript:basket.changePNum(<%=x%>);" class="up">+</a>
									</div>
								</div>
							</td>
							<td id="sum"><div class="sum<%=x%>"
									style="text-align: center;">
									<b id="sumPrice">${vo.amount*vo.price}원</b>
								</div></td>
							<%
								x++;
							%>
							<td>
								<button class="barbtn">상품삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</form>
			<button class="basdel">선택삭제</button>
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
						<td id="sum_p_price">45,000원</td>
						<td>3,000원</td>
						<td id="final_price">48,000원</td>
					</tr>
				</table>
			</div>
			<div class="basket-button">
					<br>
					<br>
					<br>
					<br>
					<br>
					<button class="btn1" onclick="page_back();" value="전전 페이지로 이동">쇼핑계속하기</button>
					<button class="btn2" onclick="goOrder()">주문하기</button>
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</article>
</section>

<%@ include file="../include/footer.jsp"%>

<script>
$(document).ready(function() {

	$(".basdel").click(function(e){
		  //var confirm_val = confirm("정말 삭제하시겠습니까?");
		  e.preventDefault();
		  //if(confirm_val) {
		   var checkArr = new Array();
		   
		   $("input[class='chBox']:checked").each(function(){
		    checkArr.push($(this).attr("data-pno"));
		   });
		    
		   $.ajax({
			   
		    url : "<c:url value='/product/deleteCart' />",
		    type : "post",
		    data : { chbox : checkArr },
		    success : function(result){
		    	if(result == 1){ location.href = "<c:url value='/product/basket' />"; }
		    	else alert("삭제 실패");
		    	
		    }
		   });
		 });
   
		$("#allCheck").click(function(){
			 var chk = $("#allCheck").prop("checked");
			 if(chk) {
			  $(".chBox").prop("checked", true);
			 } else {
			  $(".chBox").prop("checked", false);
			 }
			});
			
		$("#allCheck").click();
		
		
    	$(".chBox").click(function(){
    		$("#allCheck").prop("checked", false);
    	});
  
	
});
	


    /*체크박스에 체크한 상품(상품번호,주문수량)을 가지고 주문 폼 페이지로 이동*/
	function goOrder(){
		//1. 장바구니에 담긴 상품이 없는 경우
		var chk=$('input[name="buy"]');
		if(chk.length==0){
			return;
		}
		//2. 담긴 상품이 있다면 체크박스 갯수 만큼 반복문 돌면서 체크한 상품과 체크 안된 상품을 구분하여, 체크 안된 상품의 주문 수량은 서버쪽에 적송되지 않도록 disabled 처리한다.
		var cnt =0;
		$.each(chk,function(i,ch){
			if($(ch).is(":checked")){
				cnt++;
				$('#amount'+(i+1)).prop('disabled',false);//비활성화
				$('#price'+(i+1)).prop('disabled',false);//비활성화
			}else{
				//체크 안된 상품의 주문 수량 비활성화 
				$('#amount'+(i+1)).prop('disabled',true);//비활성화
				$('#price'+(i+1)).prop('disabled',true);//비활성화
			}
		});

		if(cnt==0){
			alert('주문할 상품을 체크하세요');
			$('input[name="amount"]').prop('disabled',false);//비활성화
			return;	
		}
		orderForm.submit();
	}
    
	function cartEdit(num,count){
		//alert(num+"/"+count);
		ef.cartNum.value=num;
		var qty=$('#amount'+count).val(); //수정된 수량값을 알 수 있음
		//alert(qty);
		ef.amount.value=qty;
		ef.method='post';
		ef.submit();
	}

	function cartDel(num, pnum){
		//alert(num);
		var yn=confirm(pnum+'번 상품을 정말 삭제하시겠습니까?');
		if(yn){
		df.pno.value=num;
		df.method='post';
		df.submit();
		}
	}
    
    
	
    function page_back(){

		history.go(-2)();

	}
    
    
    let basket = {
    	    totalCount: 0, 
    	    totalPrice: 0,
    	    //체크한 장바구니 상품 비우기
    	    delCheckedItem: function(){
    	        document.querySelectorAll("input[name='buy']:checked").forEach(function (item) {
    	            $('.thing').remove();
    	        });
    	        //AJAX 서버 업데이트 전송
    	    
    	        //전송 처리 결과가 성공이면
    	        this.reCalc();
    	        this.updateUI();
    	    },
    	    //장바구니 전체 비우기
    	    delAllItem: function(){
    	        document.querySelectorAll('.row.data').forEach(function (item) {
    	            item.remove();
    	          });
    	          //AJAX 서버 업데이트 전송
    	        
    	          //전송 처리 결과가 성공이면
    	          this.totalCount = 0;
    	          this.totalPrice = 0;
    	          this.reCalc();
    	          this.updateUI();
    	    },
    	    //재계산
    	    
    	    reCalc: function(){
    	        var sum =0;
    	        $('input[type="checkbox"]').each(function (i,item) {
	    	        
    	            if($(item).is(":checked")){
    	         		if($(item).attr('id') != 'allCheck'){
    	         			
	    	            	const $checkbox = $(item);
	    	         		const $td = $checkbox.parent();    	         
	    	            	
	    	            	var total = $td.siblings('#sum').find('#sumPrice').html();
	    	            	
	    	            	total=total.replace("원","").replace(",","");
	                		console.log(total);
	    	                //this.totalCount += count;
	    	                //var price = "<c:out value='${item.price}' />";
	    	                
	    	                //var price = $('.p_price').val();
	    	                
	    	                
	    	                //this.totalPrice += count * price;
	    	                sum += parseInt(total);
    	         		}
					   	            	
    	            }
    	        }); 
    	        this.totalPrice = sum;   	
   	            console.log(this.totalPrice);
    	    },
    	    //화면 업데이트
    	    updateUI: function () {
    	        //document.querySelector('#sum_p_num').textContent = '상품갯수: ' + this.totalCount.formatNumber() + '개';
    	        
    	        document.querySelector('#sum_p_price').textContent = this.totalPrice.formatNumber() + '원';
    	        var final_price = this.totalPrice + 3000;
    	        document.querySelector('#final_price').textContent = final_price.formatNumber() + '원';
    	        
    	    },
    	    //개별 수량 변경
    	    changePNum: function (pos) {
    	        var item = document.querySelector('input[id=amount'+pos+']');
    	        var p_num = parseInt(item.getAttribute('value'));
    	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
    	        
    	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

    	        item.setAttribute('value', newval);
    	        item.value = newval;

    	        //console.log('newval' + newval);
    	        //var price = "<c:out value='${vo.price}' />";
    	        var price = $('#price'+pos).val();
    	        //console.log( 'price'+price);
  	     
    	        
    	        $('.sum'+pos).html('<b id="sumPrice">'+(newval * price).formatNumber()+'원</b>');
    	        //item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
    	        //AJAX 업데이트 전송
    	        //전송 처리 결과가 성공이면    
    	        this.reCalc();
    	        this.updateUI();
    	    },
    	    checkItem: function () {
    	        this.reCalc();
    	        this.updateUI();
    	    },
    	    delItem: function () {
    	        event.target.remove();
    	        this.reCalc();
    	        this.updateUI();
    	    }
    	}

    	// 숫자 3자리 콤마찍기
    	Number.prototype.formatNumber = function(){
    	    if(this==0) return 0;
    	    let regex = /(^[+-]?\d+)(\d{3})/;
    	    let nstr = (this + '');
    	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
    	    return nstr;
    	};
    
    </script>

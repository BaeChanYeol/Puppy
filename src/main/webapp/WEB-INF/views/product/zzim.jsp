<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>



<div class="mypage clearfix">
	<aside class="side">
		<h2>마이페이지</h2>
		<ul class="mysidemenu">
			<li><a href="#"> 예약 내역</a></li>
			<li><a href="#"> 회원정보 수정</a></li>
			<li><a href="#"> 내가 쓴 글</a></li>
			<li><a href="#"> 좋아요 누른글</a></li>
			<li><a href="#"> 문의내역</a></li>
			<li><a href="#"> 장바구니</a></li>
			<li><a href="#" class="myhover"> <img
					src="../img/mypageheart.png" alt="구매내역">찜한 상품
			</a></li>
			<li><a href="#"> 구매 내역</a></li>
		</ul>
	</aside>
	<section class="side-content">
		<article class="main-container">
			<div class="mytitle">
				<h2>찜한상품</h2>
			</div>
		</article>

		<article class="main-container">
			<div class="side-wrap myZzim">

				<table>
					<tr>
						
						<th colspan="2">상품 정보</th>
						<th>삭제</th>
					</tr>
					<c:forEach var="vo" items="${zzimList}">
						<c:if test="${ login.id == vo.writer }"> 
							<tr>
								
								<td id="left"><img src="../img/snack1.jpg" alt="zzimItem4"></td>
								<td id="right">
									<!--상품정보-->
									<p>
										<span><a href="<c:url value='/product/detail?pno=${vo.pno}'/>">${vo.pname}</a><br>${vo.price}원<br> 무료배송
										</span>
									</p>
		
								</td>
								<td id="delete"><img src="../img/delete.png" id="delBtn" alt="delete-btn" onclick="location.href='<c:url value="/product/zzimDelete/${vo.pno} "/>'"></td>
							</tr>
						</c:if>
					</c:forEach>


					


				</table>
			</div>


			
		</article>
	</section>
</div>

<%@ include file="../include/footer.jsp"%>

<script>
        

</script>


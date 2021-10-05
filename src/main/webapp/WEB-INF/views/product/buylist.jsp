<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.Date" %>

    <%@ include file="../include/header.jsp" %>
    
    <style>
    	.buylist-btn {
    		margin-top: 3px;
    	}
    	
    	.buyDate{
    		text-align: left;
    		font-size: 20px;
    		background: #fafafa;
    	}
    	
    </style>


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
            	<!-- buy=116&p_price=4800&amount=4 -->
		        <%-- <form name="orderForm" id="orderForm" action="<c:url value='/product/orderpage'/>" > --%>
	                <table>
	                    <tr>
	                        <th>상품이미지</th>
	                        <th>상품정보</th>
	                        <th>구매확정</th>
	                    </tr>
	                    <c:forEach var = "ovo" items="${buyList2}" varStatus="s">
	                    	<%-- <c:out value="${ovo.writer}"></c:out> --%>
		                    <%-- <c:if test="${ login.id == ovo.writer }"> --%>
		                    <c:if test="${ fn:contains(ovo.writer, login.id) }">
		                    		<tr class= "buyDate">
		                    			<td colspan="3">
		                    				<p class="buydate"><fmt:formatDate value="${ovo.regdate}" pattern="yyyy.MM.dd"/> / 주문번호: ${ovo.ono}</p>
		                    			</td>
		                    		</tr>
		                    		
		                    	
		
									<c:set var="dayAfter1" value="<%=System.currentTimeMillis()%>"/>
									
		                    		
				                    <c:forEach var="vo" items="${buyList}" >
				                      <c:if test="${ovo.ono == vo.ono}"> 
					                    <tr>
					                        <td class="buylist-img">
					                            <img src="../img/basket1.jpg" alt="껌">
					                        </td>
					                        <td class="buylist-content">
					                                
					                                <p class="buytitle"><a href="<c:url value='/product/detail?pno=${vo.pno}'/>">${vo.pname}</a></p>
					                                <p class="buyprice" style="display: inline;">${vo.price}</p>
					                                <p class="buyamount" style="font-size:small;">원/${vo.amount}개</p>
					                                
					                                <c:choose>
								                    	<c:when test="${ dayAfter1 - dateList[s.index] < 60*60*24*1000 }"> <!-- 10.2, 10.3, 10.4 -->
								                    		<p class="buy">상품준비중</p>
								                    	</c:when>	
								                    	<c:when test="${ dayAfter1 - dateList[s.index] > 3*60*60*24*1000 }">  <!-- 10.7 -->
								                    		<p class="buy">배송완료</p>
								                    	</c:when>
								                    	<c:otherwise>
								                    		<p class="buy">배송중</p>
								                    	</c:otherwise>
								                    	
								                    </c:choose>
					                                
					                                
					                        </td>	
					          				   <td class="buylist-btn">
					                            <button class="buylist-btn">반품/교환</button>
					                            <button class="buylist-btn review-btn" onclick="location.href='<c:url value='/product/detail?pno=${vo.pno}#reviews'/>'">리뷰쓰기</button>
					                            <!-- buy=116&p_price=4800&amount=4 -->
					                            <button class="buylist-btn rebuy" onclick="location.href='<c:url value='/product/orderpage?buy=${vo.pno}&p_price=${vo.price}&amount=${vo.amount}'/>'">재구매</button>
					                            
					                        </td>
					                    </tr>
						              </c:if>
				                    </c:forEach>
		                    </c:if>
	                    </c:forEach>
	                </table>
                <!-- </form> -->
            </div>
            
            
            <form action="<c:url value='/product/buylist' />" name="pageForm">
                    <div class="text-center">
                      
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
	                    
	                    <input type="hidden" id="pageNum" name="pageNum" value="${pc.paging.pageNum}">
	                    <input type="hidden" id="countPerPage" name="countPerPage" value="${pc.paging.countPerPage}">
                    
                    </div>
                    
                    <div class="search">
	                    <input type="text" placeholder="검색어 입력">
	                    <button type="button" onclick="location.href='#'">검색</button>
                	</div>
                	
                	<br><br><br><br><br>
        	  </form>
            
        </article>

    </section>
</div>
    
    <%@ include file="../include/footer.jsp" %>
    
    
    <script>
    
	    /* const registBtn = document.getElementById('rebuy');
	    registBtn.onclick = function() {
	    	document.orderForm.submit();
	    } */
    	
    
	    const pagination = document.getElementById('pagination');
		pagination.onclick = function(e) {
			e.preventDefault(); 
			const value = e.target.dataset.pagenum;
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		}
    </script>
    
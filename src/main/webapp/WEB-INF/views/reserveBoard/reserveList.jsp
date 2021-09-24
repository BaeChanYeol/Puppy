<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>

    <%@ include file="../include/header.jsp" %>


    <section class="reserveList">

	
        <div class="myReserve">
            <h3>예약 내역</h3>

            <p>
                <b>※ 당일 예약은 취소가 불가한 점 양해 바랍니다.</b>
            </p>

            <table>
            	<tr>
	                <th>번호</th>
	                <th>체크인</th>
	                <th>체크아웃</th>
	                <th>이용서비스</th>
	                <th>견종</th>
	                <th>이용금액</th>
	                <th>취소가능기간</th>
	                <th>상태</th>
				</tr>
				<c:forEach var="vo" items="${reserveList}" varStatus="s">
				
	                <tr>
	                    <td>${vo.resNo}</td>
	                    <td>${vo.chkIn}</td>
	                    <td>${vo.chkOut}</td>
	                    <td>${vo.service}</td>
	                    <td>&nbsp;${vo.breed}&nbsp;</td>
	                    
	                    <c:choose>
	                    	<c:when test="${vo.service == '호텔&데이케어'}"><td>42,000원</td></c:when>
	                    	<c:when test="${vo.service == '유치원'}"><td>30,000원</td></c:when>
	                    	<c:when test="${vo.service == '그루밍'}"><td>55,000원</td></c:when>
	                    	<c:when test="${vo.service == '스튜디오'}"><td>60,000원</td></c:when>
	                    	<c:when test="${vo.service == '메디컬센터'}"><td>50,000원</td></c:when>
	                    	<c:when test="${vo.service == '스페셜케어'}"><td>45,000원</td></c:when>
	                    	<c:otherwise><td>0원</td></c:otherwise>
	                    </c:choose>
	                    
	                   
	                    
	                    	<jsp:useBean id="today" class="java.util.Date" />
							<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="nowTime" />
				
							<fmt:parseDate var="cdate" value="${vo.chkIn}" pattern="yyyy-MM-dd" />
							<fmt:formatDate var="cdate" value="${cdate}" pattern="yyyy-MM-dd" />
							
							
							
							<c:set var="dayago" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>
							<fmt:formatDate value="${dayago}" pattern="yyyy-MM-dd" var="dayago"/>
	                 	

	                    <c:choose>
	                    	<c:when test="${cdate == nowTime}">
	                    		<td>${dayago} 23:59까지</td>
	                    		<td>취소불가</td>
	                    	</c:when>
	                    	<c:when test="${cdate > nowTime}">
	                    		<td>${chkList[s.index]} 23:59까지</td>
	                    		<td><button id="cancel"  onclick="location.href='<c:url value="/reserveBoard/reserveDelete/${vo.resNo} "/>'">취소</button></td>
	                    	</c:when>
	                    	<c:when test="${cdate < nowTime}">
	                    		<td>-</td>
	                    		<td>이용완료</td>
	                    	</c:when>
	                    	<c:otherwise></c:otherwise>
	                    </c:choose>
	                    
	                    
	                  
	                </tr>
	            </c:forEach>

                
            </table>

        </div>
        
        
        <form action="<c:url value='/reserveBoard/reserveList' />" name="pageForm">
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
                    
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                    
                    </div>
         </form>
	
          </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
	    
    
    const pagination = document.getElementById('pagination');
	pagination.onclick = function(e) {
		e.preventDefault(); 
		const value = e.target.dataset.pagenum;
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	}
	
	    
	    
	 
    </script>


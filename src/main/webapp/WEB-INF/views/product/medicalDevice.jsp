<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>




    <section>

        <article class="main-container">
           <div class="wrap mytitle">
         <h2>의료기기</h2>
      </div>

            
            <span id="count-per-page" style="float: right;">
                <input class="btn btn-cpp" type="button" value="8">  
                <input class="btn btn-cpp" type="button" value="16">   
                <input class="btn btn-cpp" type="button" value="24">
            </span>
        </article>
        
        <article class="main-container">
            <div class="product wrap">
                <ul>
                    <c:forEach var="vo" items="${itemList}">		
		                    <li class="item">
		                        <div>
		                            <a href="<c:url value='/product/detail?pno=${vo.pno}'/>">
		                                <img src="../img/oxygen.jpg" alt="유기농 개껌">
		                                <p class="align category">${vo.cate}</p>
		                                <p class="align p-title">${vo.pname}</p>
		                                <p class="align p-price">${vo.price}원<span class="cost">8,000원</span></p>
		                            </a>
		                        </div>
		                    </li>
		              </c:forEach>

                </ul>
            </div>


            <form action="<c:url value='/product/items' />" name="pageForm">
                    <div class="text-center">
                    	<input type="hidden" name="type" id="type" value="${itemList[0].type}">
                    
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
    
<%@ include file="../include/footer.jsp" %>

<script>

	$('#count-per-page .btn-cpp').click(function() {
		const count = $(this).val();
		var type = $('#type').val();
		location.href="<c:url value='/product/items?type="+type+"&pageNum=${pc.paging.pageNum}&countPerPage="+count+"'/>";
	});
	
	
	const pagination = document.getElementById('pagination');
	pagination.onclick = function(e) {
		e.preventDefault(); 
		const value = e.target.dataset.pagenum;
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	}
</script>


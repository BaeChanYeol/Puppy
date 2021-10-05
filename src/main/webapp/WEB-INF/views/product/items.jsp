
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ include file="../include/header.jsp" %>



  
    <section>

        <article class="main-container">
            <div class="wrap title">
                <h2>강아지용품</h2>
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
		                                <img src="../img/best1.PNG" alt="유기농 개껌">
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

			<!-- 
            <div class="wrap">    
                <div class="pagination">

                    <button type="button" onclick="location.href='#'">이전</button>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                    <a href="#">8</a>
                    <a href="#">9</a>
                    <a href="#">10</a>
                    <button type="button" onclick="location.href='#'">다음</button>
                    
                </div>

                <div class="search">
                    <input type="text" placeholder="검색어 입력">
                    <button type="button" onclick="location.href='#'">검색</button>
                </div>
                <br><br><br><br><br>
            </div>
             -->

        </article>
    </section>
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    //$(function() {
		  //한 페이지당 보여줄 게시물 개수가 변동하는 이벤트 처리
			$('#count-per-page .btn-cpp').click(function() {
				const count = $(this).val();
				var type = $('#type').val();
				location.href="<c:url value='/product/items?type="+type+"&pageNum=${pc.paging.pageNum}&countPerPage="+count+"'/>";
			});
    //});	
    
	    const pagination = document.getElementById('pagination');
		pagination.onclick = function(e) {
			e.preventDefault(); 
			const value = e.target.dataset.pagenum;
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		}
    </script>



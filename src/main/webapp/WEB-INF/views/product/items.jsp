
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="../include/header.jsp" %>



  
    <section>

        <article class="main-container">
            <div class="wrap title">
                <h2>강아지용품</h2>
            </div>
        </article>
        
        <article class="main-container">
            <div class="product wrap">
                <ul>
                	<c:forEach var="vo" items="${itemList}">
	                    <li class="item">
	                        <div>
	                            <a href="<c:url value='/product/detail?pno=${vo.pno}'/>">
	                                <img src="../img/snack1.jpg" alt="유기농 개껌">
	                                <p class="align category">${vo.cate}</p>
	                                <p class="align p-title">${vo.pname}</p>
	                                <p class="align p-price">${vo.price}원<span class="cost">8,000원</span></p>
	                            </a>
	                        </div>
	                    </li>
	                 </c:forEach>
                    

                </ul>
            </div>


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

        </article>
    </section>
    <%@ include file="../include/footer.jsp" %>



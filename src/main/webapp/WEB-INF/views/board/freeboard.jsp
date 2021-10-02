<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <section>
	
        <article class="main-container">
            <div class="wrap">
                <div class="freeboard-title">
                    <h2>자유게시판</h2>
                </div>

                <!-- 정렬 기준 OR 게시물 개수-->
                <div class="freeboard-sort">
                    <select name="viewConunt">
                        <option value="">10개씩</option>
                        <option value="">15개씩</option>
                        <option value="">20개씩</option>
                    </select>
                </div>

                <div class="freeboard-list ">
                    <table class="freeboard-table">
                        <thead>
                            <tr>
                                <th class="freenum">글번호</th>
                                <th>제목</th>
                                <th class="freewrite">작성자</th>
                                <th class="freeregdate">작성일</th>
                                <th class="freehit">조회</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vo" items="${boardList}">
	                            <tr>
	                                <td>${vo.bno}</td>
	                                <td>
	                                	<a href="<c:url value='/board/boardDetail?bno=${vo.bno}' />">${vo.title}</a>
	                                	&nbsp;&nbsp;&nbsp;
	                                	<c:if test="${vo.newMark}">
	                                		<img alt="newMark" src="<c:url value='/img/icon_new.gif' />">
	                                	</c:if>
	                                </td>
	                                <td>${vo.content}</td>
	                                <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
	                              <!--    <td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd"/></td>
	                            --><td>${vo.viewCnt}<td/>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <div class="freeboard-write clearfix">
                        <button class="freeboard-write-btn"><a href="<c:url value='/board/boardWrite'/>">글쓰기</a></button>
                    </div>

					<form action="<c:url value='/board/freeboard' />" name="pageForm">
                    <div class="text-center">
                    
                    
                    <!-- 페이지 관련 버튼들이 ul 태그로 감싸져 있다. -->
                    <div class="pagination" id="pagination">
                       <c:if test="${pc.prev}">
                       		<button type="button" onclick="location.href='/puppy/board/freeboard?pageNum=${pc.beginPage-1}&countPerPage=${pc.paging.countPerPage}'" data-pageNum="${pc.beginPage-1}">&#10094;</button>
                       </c:if>
                       
                       <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
                        <a class="${pc.paging.pageNum == num ? 'active' : ''}" href="<c:url value='/board/freeboard?pageNum=${num}&countPerPage=${pc.paging.countPerPage}' />" data-pageNum="${num}">${num}</a>
                       </c:forEach>
                    
                        <c:if test="${pc.next}">
                        	<button type="button" onclick="location.href='/puppy/board/freeboard?pageNum=${pc.endPage+1}&countPerPage=${pc.paging.countPerPage}'" data-pageNum="${pc.endPage+1}">&#10095;</button>
                        </c:if>
                                               
                    </div>
                    
                    <!-- 페이지 관련 버튼을 클릭시 숨겨서 보낼 값 -->
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
                    <input type="hidden" name="condition" value="${pc.paging.condition}">
                    
                   
                    </div>
		    </form>

                   
                </div>

                <div class="freeboard-search">
                    <form action="<c:url value='/board/freeboard' />">
                        <select name="condition">
                            <option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
                            <option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
                            <option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
                            <option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
                        </select>

                        <input type="text" name="keyword">

                        <button type="submit" class="serch-btn">검색</button>

                    </form>
                </div>
            </div>
        </article>

    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    


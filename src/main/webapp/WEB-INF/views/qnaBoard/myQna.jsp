<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../include/header.jsp" %>

    <section>
        <article>
            <h2 style="text-align:center;">문의내역</h2>
            <div class="myQnA wrap">
                <div class="myQnA-minititle">
                    <h3>1 대 1 상담 내용</h3>
                </div>
                <table class="myQnA-list">
                    <tr>
                        <td class="myQnA-num">글번호</td>
                        <td>문의 제목</td>
                        <td class="myQnA-date">작성일</td>
                    </tr>
                    
                    <c:forEach var="vo" items="${qnaList}">
	                	<tr>
	                    	<td class="myQnA-num">${vo.qno}</td>
	                        <td class="question">
	                        	<a href="<c:url value='/freeBoard/qnaDetail?qno=${vo.qno}' />">${vo.title}</a>
	                            &nbsp;&nbsp;&nbsp;
	                            
	                        </td>
	                        <td class="myQnA-time"><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
	                  
	                    </tr>
	                    
                    </c:forEach>
                    

                    
                </table>
    
            </div>
        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>

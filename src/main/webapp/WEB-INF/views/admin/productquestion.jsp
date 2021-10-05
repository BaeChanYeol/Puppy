<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/adminStyle.css'/>">	

</head>
<body>
  <div class="adminwrap clearfix">
        <aside>
            <h1><img src="<c:url value='./img/logowhite-hight.png'/>" alt=""></h1>
            <ul class="adminmenu">
                <li><a href="<c:url value='/admin/membertable' />">회원목록</a></li>
                <li class="outside">1:1문의
                    <ul>
                        <li><a href="<c:url value='/admin/reservequestion'/>" class="inside" style="margin-top:5px;">예약관리</a></li>
                        <li><a href="" class="inside adminhover">상품문의</a></li>
                        <li><a href="" class="inside">사이트문의</a></li>
                        <li><a href="#">상품등록</a></li>
                    </ul>
                </li>
                
            </ul>
        </aside>
        <nav>
            <h1>상품문의</h1>
        </nav>
        <div class="adminbody">
            <div class="admintable">
                <!-- <table>
                    <tr>
                        <th>문의번호</th>
                        <th>상품이름</th>
                        <th>아이디</th>
                        <th>문의제목</th>
                        <th>작성날짜</th>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>강아지개껌</td>
                        <td>아이디</td>
                        <td><a href="#">질문드립니다</a></td>
                        <td>2000.10.05</td>
                    </tr>
                </table> -->
                <table>
                	<tr>
                        <th>답변상태</th>
                        <th>상품이름</th>
                        <th>문의제목</th>
                        <th>아이디</th>
                        <th>작성날짜</th>
                    </tr>
                    
					<c:forEach var="vo" items="${qnaList}">
                           <tr>
                               <td><button>답변대기</button></td>
                               <td>${vo.pname}</td>
                               <td class="qna-title" id="qna-title" style="padding-left:40px;"><a href="<c:url value='/admin/questionanswer?pno=${vo.pno}'/>">${vo.content}</a></td>
                               <td>${vo.writer}</td>
                               <td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
                           </tr>
					</c:forEach>
                </table>
                
                <div class="text-center">
                    
                    
                    <!-- 페이지 관련 버튼들이 ul 태그로 감싸져 있다. -->
                    
                    <ul class="adminpagination" id="pagination" style="text-align: center;">
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
                
            </div>
        </div>
        <div class="adminfooter">
			<p> Copyrights &copy; 2021 JAVADOG. All Rights Reserved.</p>
		</div>
    </div>
</body>
</html>
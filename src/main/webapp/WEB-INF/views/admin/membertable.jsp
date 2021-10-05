<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="<c:url value='/css/adminStyle.css'/>">	
</head>
<body>
    <div class="adminwrap clearfix">
        <aside>
            <h1> <a href="<c:url value='/'/>"> <img src="../img/logowhite-hight.png" alt=""></a> </h1>
            <ul class="adminmenu">
                <li><a href="<c:url value='/admin/membertable' />" class="adminhover">회원목록</a></li>
                <li class="outside">1:1문의
                    <ul>
                        <li><a href="<c:url value='/admin/reservequestion'/>" class="inside" style="margin-top:5px;">예약관리</a></li>
                        <li><a href="<c:url value='/admin/productquestion'/>" class="inside">상품문의</a></li>
                        <li><a href="<c:url value='/admin/questionanswer'/>" class="inside">사이트문의</a></li>
                        <li><a href="#">상품등록</a></li>
                    </ul>
                </li>
                <!--  -->
            </ul>
        </aside>
        <nav>
            <h1>회원관리</h1>
        </nav>
        <div class="adminbody">
            <div class="admintable">
                <table>
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>핸드폰번호</th>
                        <th>이메일</th>
                        <th>탈퇴</th>
                    </tr>
                <c:forEach var="vo" items="${user}">    
                    <tr>
                        <td class="delid">${vo.id}</td>
                        <td>${vo.name}</td>
                        <td>${vo.phone}</td>
                        <td>${vo.email}</td>
                        <td><button type="button" id="memberdel">탈퇴</button></td>
                    </tr>
                 </c:forEach>
                </table>
                
                <form action="<c:url value='/admin/membertable' />" name="membertablePage">
					<div class="adminpagination" id="pagination">
						<c:if test="${pc.prev}">
							<button type="button" onclick="location.href='/puppy/admin/membertable?pageNum=${pc.beginPage -1}&countPerPage=${pc.paging.countPerPage}'" data-pageNum="${pc.beginPage-1}">
								&#10094;</button>
						</c:if>
	
						<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
							<a class="${pc.paging.pageNum == num ? 'active' : ''}"
								href="<c:url value='/admin/membertable?pageNum=${num}&countPerPage=${pc.paging.countPerPage}' />"
								data-pageNum="${num}">${num}</a>
						</c:forEach>
	
						<c:if test="${pc.next}">
							<button type="button"  onclick="location.href='/puppy/admin/membertable?pageNum=${pc.endPage +1}&countPerPage=${pc.paging.countPerPage}'" data-pageNum="${pc.endPage+1}">
								&#10095;</button>
						</c:if>
	
					</div>
	
					<!-- 페이지 관련 버튼을 클릭시 숨겨서 보낼 값 -->
					<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
					<input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}"> 
					<input type="hidden" name="keyword" value="${pc.paging.keyword}"> 
					<input type="hidden" name="condition" value="${pc.paging.condition}">
				</form>
				<div class="adminsearch">
					<form action="<c:url value='/admin/membertable' />">
						<select name="condition">
							<option value="title"
								${pc.paging.condition == 'id' ? 'selected' : ''}>
								제목
							</option>
					
						</select> <input type="text" name="keyword">
	
						<button type="submit" class="serch-btn">검색</button>
	
					</form>
				</div>
            </div>
        </div>
		<div class="adminfooter">
			<p> Copyrights &copy; 2021 JAVADOG. All Rights Reserved.</p>
		</div>
    </div>
    


    <script>
	$(function() {
		
    $('.admintable').on('click','#memberdel',(function(){
    	
    	const ids = $(this).parent().prev().prev().prev().prev().html();
    	/* const btn = $('#memberdel');
    	
    	const tr = btn.parent().parent();
    	const td = tr.children();
    	const ids = td.ep(0).html(); */
    	
    	

    	console.log(ids);
    	$.ajax({
			type: "post",
			url: "<c:url value='/admin/memberDelete' />",
			data: JSON.stringify({
				"id": ids
			}),
			headers: {
				"Content-type" : "application/json"
			},
			dataType: "text",
			success: function(data) {
			console.log(data);
				if(data == 'memberdeleteok'){
					alert('강제 탈퇴되었습니다.');	
					location.reload();
				}
			},
			error: function() {
				alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
			}
			
		}); //삭제 비동기 통신 끝.
    	
    	
    }));
    
	});
 
    
    
    </script>
    </body>
</html>
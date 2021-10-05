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
            <h1><img src="<c:url value='/img/logowhite-hight.png'/>" alt=""></h1>
            <ul class="adminmenu">
                <li><a href="<c:url value='/admin/membertable' />">회원목록</a></li>
                <li class="outside">1:1문의
                    <ul>
                        <li><a href="<c:url value='/admin/reservequestion'/>" class="inside adminhover" style="margin-top:5px;">예약관리</a></li>
                        <li><a href="" class="inside">상품문의</a></li>
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
            <div class="admincontent">
                <form action="<c:url value='/admin/registForm' />" name="registForm" method="post">
                	<input type="hidden" name="pno" value="${item.pno}">
                	<input class="admininput" placeholder="문의 등록한 상품" readonly value="${item.pname}">
                    <input class="admininput" placeholder="등록한고객아이디" readonly value="${item.writer}">
                    <!-- <input class="admininput" placeholder="문의 등록한 제목" readonly> -->
                    <textarea class="admintext" rows="11" style="margin-bottom: 10px;" placeholder="고객이 입력한 내용" readonly>${item.content}</textarea>                        
                    <textarea class="admintext" rows="11" style="margin-bottom: 10px;" name="answer" placeholder="답변을 등록하세요" ></textarea>                        
                    <button type="button" id="adminbtn" class="adminbtn">등록</button>
                </form>
            </div>
        </div>
        <div class="adminfooter">
			<p> Copyrights &copy; 2021 JAVADOG. All Rights Reserved.</p>
		</div>
    </div>
    
    
    <script>
    const registBtn = document.getElementById('adminbtn');
    registBtn.onclick = function(e) {
    	e.preventDefault(); 
    	document.registForm.submit();
    }
    
    </script>

</body>
</html>
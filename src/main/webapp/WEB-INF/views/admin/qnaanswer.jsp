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
                    </ul>
                </li>
                <li><a href="#">상품등록</a></li>
            </ul>
        </aside>
        <nav>
            <h1>예약문의</h1>
        </nav>
        <div class="adminbody">
            <div class="admincontent">
                <form class="">
                    <input class="admininput" placeholder="등록한고객아이디" readonly>
                    <input class="admininput" placeholder="문의 등록한 제목" readonly>
                    <textarea class="admintext" rows="11" style="margin-bottom: 10px;" placeholder="고객이 입력한 내용" readonly></textarea>                        
                    <textarea class="admintext" rows="11" style="margin-bottom: 10px;" placeholder="답변을 등록하세요"></textarea>                        
                    <button type="button" class="adminbtn">등록</button>
                </form>
            </div>
        </div>
        <div class="adminfooter">
			<p> Copyrights &copy; 2021 JAVADOG. All Rights Reserved.</p>
		</div>
    </div>

</body>
</html>
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
                <li><a href="<c:url value='/admin/membertable' />" >회원목록</a></li>
                <li class="outside">1:1문의
                    <ul>
                        <li><a href="<c:url value='/admin/reservequestion'/>" class="inside" style="margin-top:5px;">예약관리</a></li>
                        <li><a href="" class="inside">상품문의</a></li>
                        <li><a href="" class="inside">사이트문의</a></li>
                        <li><a href="#" class="adminhover">상품등록</a></li>
                    </ul>
                </li>
                
            </ul>
        </aside>
        <nav>
            <h1>상품등록</h1>
        </nav>
        <div class="adminbody">
            <div class="admincontent">
                <form class="" action="<c:url value='/product/productRegist'/>" method="post" enctype="multipart/form-data">
                    <select class="admininput" name="type">
                        <option value="i">강아지용품</option>
                        
                        <option value="m">의료기기</option>
                        <option value="s">간식식품</option>
                        
                    </select>
                    <input class="admininput" placeholder="상품이름" name="pname">
                    <input class="admininput" placeholder="카테고리" name="cate">
                    <input class="admininput" placeholder="상품가격" name="price">
                    <input class="admininput" placeholder="옵션  다중옵션 시 / 를 꼭 입력해주세요" name="opt">
                    <label for="file">사진첨부</label> 
                    <input type="file" class="photoBtn" name="file" id="file" >
                                            
                    <button type="submit" class="adminbtn" style="display: block; margin-top: 30px;">등록</button>
                </form>
            </div>
        </div>
        <div class="adminfooter">
			<p> Copyrights &copy; 2021 JAVADOG. All Rights Reserved.</p>
		</div>
    </div>
	

</body>
</html>

<script>
	if('${msg}' == 'fileFail'){
		alert('사진은 필수입니다');
	}

</script>
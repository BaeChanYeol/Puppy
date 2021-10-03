<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
    <script type="text/javascript" src="<c:url value='/smartEditor/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
    <!-- 헤더 영역-->
    <header>
        <div class="header clearfix">
            <div class="header_top">
                <div class="header_top_area">
                    <div class="hright">
                    	<c:if test="${login == null}">
	                        <a href="#" style="font-weight: normal;" id="join">회원가입</a>
	                        <a href="#" style="font-weight: normal;" id="login">로그인</a>
                    	</c:if>
                    	<c:if test="${login != null}">
	                        <a href="<c:url value='/user/mypage' />" style="font-weight: normal;" id="mypage">마이페이지</a>
	                        <a href="<c:url value='/user/logout' />" style="font-weight: normal;" id="logout" onclick="return confirm('정말 로그아웃 하시겠습니까?');">로그아웃</a>
							
                    	</c:if>
	                        <a href=<c:url value='/sitemap'/> style="font-weight: normal;">사이트맵</a>                    	
                    </div>
                    <div class="hleft">

                        <a href="<c:url value='/'/>" class="move"><img src="<c:url value='/img/simbol.png'/>" alt="댕댕이 유치원"></a>
                        <a href="/" class="move"><img src="<c:url value='/img/facebook.png'/>" alt="페이스북"></a>
                        <a href="/" class="move"><img src="<c:url value='/img/insta.png'/>" alt="instar"></a>
                        <a href="/" class="move"><img src="<c:url value='/img/tube.png'/>" alt="유튜브"></a>

                    </div>
                </div>
            </div>
            <div class="logo">
                    <a href="<c:url value='/'/>" ><img src="<c:url value='/img/logo.png'/>" alt="댕댕이 유치원"></a>
            </div>
            <nav>
                <div class="menu_area">
                    <ul class="menu">
                        <li class="menu-li">
                            <a href="<c:url value='/reserve'/>" class="menu-li-a">예약하기</a>
                        </li>
                        <li class="menu-li">
                            <a href="<c:url value='/notice'/>" class="menu-li-a">이용안내</a>
                            <ul class="second">
                                <li>
                                    <a href="<c:url value='/notice'/>">이용안내</a>
                                </li>
                                <li>
                                    <a href="<c:url value='/pickupService'/>">픽업서비스</a>
                                </li>
                            </ul>
                        </li>
                        <li class="menu-li">
                            <a href="<c:url value='/service/preschool'/>" class="menu-li-a">주요서비스</a>
                            <ul class="second">
                                <li><a href="<c:url value='/service/hotel'/>">호텔&데이케어</a></li>
                                <li><a href="<c:url value='/service/preschool'/>">유치원</a></li>
                                <li><a href="<c:url value='/service/grooming'/>">애견미용</a></li>
                                <li><a href="<c:url value='/service/studio'/>">스튜디오</a></li>
                                <li><a href="<c:url value='/service/medicalCenter'/>">메디컬센터</a></li>
                                
                            </ul>
                            
                        </li>
                        <li class="menu-li">
                            <a href="<c:url value='/product/items'/>" class="menu-li-a">애견샵</a>
                            <ul class="second">
                                <li><a href="<c:url value='/product/item'/>">강아지용품</a></li>
                                <li><a href="<c:url value='/product/medicalDevice'/>">의료기기</a></li>
                                <li><a href="<c:url value='/product/snack'/>">간식,식품</a></li>
                            </ul>
                        </li>
                        <li class="menu-li">
                            <a href="<c:url value='/board/freeboard'/>" class="menu-li-a">커뮤니티</a>                            
                            <ul class="second">
                                <li><a href="<c:url value='/board/freeboard'/>">자유게시판</a></li>
                                <li><a href="<c:url value='/boast/boastboard'/>">뽐내기게시판</a></li>
                                <li><a href="<c:url value='/qnaBoard/qna'/>">QnA</a></li>
                            </ul>
                        </li>
                        <li class="menu-li">
                            <a href="<c:url value='/professional'/>" class="menu-li-a">전문진소개</a>
                        </li>
                    </ul>
                    
                </div>
            </nav>
            
            
        </div>
    </header>
    

  <%@ include file="../loginModal.jsp" %>
  <%@ include file="../joinModal.jsp" %>

     <script>
     /* 로그아웃 처리완료*/
 	 
 	if('${msg}' == "logout"){
 		alert("로그아웃 되었습니다!");
 	}
 	
	
	if('${msg}' == 'fail'){
		alert('입력정보로 가입하신 아이디가 없습니다.');
	}
	
	if('${msg}' == 'pwFindFail'){
		alert('이름, 아이디, 이메일 중 뭐가 틀렸거나 없는 회원이라 비밀번호도 찾을 수 없습니다.');
	}
	
	
   
    const $logo = document.querySelector('.logo');
    const $header = document.querySelector('.header');
    // const $move = document.querySelector('.header_top_area>.left>a')


    var prevScrollTop = 0;
    var nowScrollTop = 0;

    function wheelDelta(){
        return prevScrollTop - nowScrollTop > 0 ? 'up' : 'down';
    };

    $(window).on('scroll', function(){
    nowScrollTop = $(this).scrollTop();
    if(wheelDelta() == 'down'){
        $logo.style.display ='none';
        $header.style.height ='102px';
        $('.move').css('width','30px');
    }
    if(nowScrollTop == 0){
        $logo.style.display ='block';
        $header.style.height ='290px';
        $('.move').css('width','25px');
    }
    prevScrollTop = nowScrollTop;
    });

    /* --------------------- 로그인 모달창 -----------------------*/

    $('#login').click(function() {
    	
    	if($.cookie('idCookie') != undefined){
    		$('#loginId').val($.cookie('idCookie'));
    		$("#idRemember").prop("checked", true);
    	}else{
    		$('#loginId').val('');
    		$("#idRemember").prop("checked", false);
    	}
    	
    	   /*네이버로그인*/
        $.ajax({
          type : "GET",
          url : "<c:url value='/social1'/>",
          headers: {
             "Content-Type" : "application/json"
          },
          dataType: "text",
          success: function(data) {
             console.log(data);
             $('#naver').attr('href', data);

          },
                   
       });

    	
    	$('#login_modal').show();
    	
    	
    	$(document).mousedown(function(e) {
    		
    		if($('#login_modal').is(e.target)){
    			$('#login_modal').hide();
    			
    		}
    	});

    	$('#close').click(function() {
    		$('#login_modal').hide();
			$('#loginId, #loginPw').val('');    		
    	});

    });
    
    /* --------------------- 회원가입  -----------------------*/

    $('#join').click(function() {
    	$('#join_modal').show();
    	
    	$(document).mousedown(function(e) {
    		
    		if($('#join_modal').is(e.target)){
    			$('#join_modal').hide();
    			
    		}
    	});

    	$('#close1').click(function() {
    		$('#join_modal').hide();
    		$('#id, #pw, #pw_check, #phone, #phone_check, #name, #email, #address1, #address2, #addNum').val('');
    		$('#id_check, #pw_chk, #pw_chk2, #name_check, #email_check').html('');
    		
    	});

    	 
        
    	
    });



   
  

   </script>
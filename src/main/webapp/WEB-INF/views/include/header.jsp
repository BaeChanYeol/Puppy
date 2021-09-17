<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
    <!-- 헤더 영역-->
    <header>
        <div class="header clearfix">
            <div class="header_top">
                <div class="header_top_area">
                    <div class="hright">
                        <a href="#" style="font-weight: normal;" id="join">회원가입</a>
                        <a href="#" style="font-weight: normal;" id="login">로그인</a>
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
                    <a href="<c:url value='/'/>" target="_blank"><img src="<c:url value='/img/logo.png'/>" alt="댕댕이 유치원"></a>
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
                            <a href="/service" class="menu-li-a">주요서비스</a>
                            <ul class="second">
                                <li><a href="<c:url value='/service/hotel'/>">호텔&데이케어</a></li>
                                <li><a href="<c:url value='/service/preschool'/>">유치원</a></li>
                                <li><a href="<c:url value='/service/grooming'/>">애견미용</a></li>
                                <li><a href="<c:url value='/service/studio'/>">스튜디오</a></li>
                                <li><a href="<c:url value='/service/medicalCenter'/>">메디컬센터</a></li>
                                
                            </ul>
                            
                        </li>
                        <li class="menu-li">
                            <a href="/purchase" class="menu-li-a">공동구매</a>
                            <ul class="second">
                                <li><a href="/purchase/items">강아지용품</a></li>
                                <li><a href="/purchase/medical">의료기기</a></li>
                                <li><a href="/purchase/snack">간식,식품</a></li>
                            </ul>
                        </li>
                        <li class="menu-li">
                            <a href="/community" class="menu-li-a">커뮤니티</a>                            
                            <ul class="second">
                                <li><a href="board/freeboard">자유게시판</a></li>
                                <li><a href="/community/showboard">뽐내기게시판</a></li>
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
    
    <!-- 회원가입 모달 -->

 <div class="joinModal-wrap" id="join_modal">
        <div class="joinModal">
            <div class="joinModal_close">
                <a href="#"><img src="./img/close.png" alt="close" id="close1"></a>
            </div>
            <div class="join-title">
                <h2>회원 가입</h2>
                <div class="join-logo">
                    <img src="./img/simbol.png" alt="simbol">
                </div>
                <h5>회원정보를 입력해주세요</h5>
            </div>

            <div class="joinform">
                <form action="" method="POST">
                    <h5><label for="id">아이디</label></h5>
                    <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요~">
                    <!-- 비동기 처리 태그 -->
                    <span></span>
                    <h5><label for="pw">비밀번호</label></h5>
                    <input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요~">
                    <span></span>
                    <h5><label for="pw_check">비밀번호 확인</label></h5>
                    <input type="password" name="pw_check" id="pw_check" placeholder="비밀번호를 입력해주세요~">
                    <span></span>
                    <h5><label for="name">이름</label></h5>
                    <input type="text" name="name" id="name" placeholder="이름을 입력해주세요~">
                    <div class="clearfix">
                        <h5>생년월일</h5>
                        <div class="joinform-wrap">
                            <select name="year" >
                                <option value="1994">1994</option>
                            </select>
                        </div>
                        <div class="joinform-wrap">
                            <div class="joinform-wrap-left">
                                <select name="month" >
                                    <option value="12">12</option>
                                </select>
                            </div>
                            <div class="joinform-wrap-right">
                                <select name="day" >
                                    <option value="27">27</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h5><label for="email">이메일</label></h5>
                    <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요~">
                    <span></span>

                    <h5><label for="phone">휴대전화</label></h5>
                    <div class="joinform-phone clearfix">
                        <input type="text" name="phone" id="phone" placeholder="- 제외하고 입력해주세요!">
                        <button>인증번호받기</button>
                        <input type="text" name="phone_check" id="phone_check" placeholder="인증번호를 입력해주세요!">
                        <button class="check">인증번호확인</button>
                    </div>

                    <h5><label for="address">주소</label></h5>
                    <div class="joinform-address">
                        <input type="text" name="addNum" id="addNum" placeholder="우편번호">
                        <button type="button" id="search_address" onclick="goPopup();" >주소 찾기</button>
                        <div>
                            <input type="text" name="address1" id="address1" placeholder="기본 주소" readonly>
                            <input type="text" name="address2" id="address2" placeholder="상세 주소">
                        </div>
                    </div>
  
                    <button type="submit" class="joinBtn">가 입 하 기</button>       
                    
                </form>
            </div>


        </div>

    </div>
    
    

     <script>

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
		$('#login_modal').show();
		
		$(document).click(function(e) {
			
			if($('#login_modal').is(e.target)){
				$('#login_modal').hide();
				
			}
		});
	
		$('#close').click(function() {
			$('#login_modal').hide();
		});

	});
	
	/* --------------------- 회원가입  -----------------------*/
	
	$('#join').click(function() {
		$('#join_modal').show();
		
		$(document).click(function(e) {
			
			if($('#join_modal').is(e.target)){
				$('#join_modal').hide();
				
			}
		});
	
		$('#close1').click(function() {
			$('#join_modal').hide();
			$('#id, #pw, #pw_check, #phone, #phone_check, #name, #email, #address1, #address2, #addNum').val('');
			
		});

	});
	
	
	function goPopup(){
		const pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp", "pop", "width=570, height=420, scrollbars=yes, resizable=yes");
	};


	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		document.getElementById("address1").value = roadAddrPart1;
		document.getElementById("address2").value = addrDetail;
		document.getElementById("addNum").value = zipNo;
	};

   </script>
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



   </script>
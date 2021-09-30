<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ include file="./include/header.jsp" %>


    
    <section>
        <article class="main-container">
            <div style="padding-top: 100px;">
                <h2 style="font-size: 30px;">사이트맵</h2>
            </div>
        </article>
        <article class="main-container">
            <div class="wrap clearfix">
                <div class="sitemap-map-group">
                    <div class="sitemap-map-group-item">
                        <h4>이용안내</h4>
                    </div>
                    <ul class="sitemap-map-block">
                        <li><a href="<c:url value='/notice'/>">이용안내</a></li>
                        <li><a href="<c:url value='/pickupService'/>">픽업서비스</a></li>
                    </ul>
                </div>
                <div class="sitemap-map-group">
                    <div class="sitemap-map-group-item">
                        <h4>주요서비스</h4>
                    </div>
                    <ul class="sitemap-map-block">
                        <li><a href="<c:url value='/service/hotel'/>">호텔&데이케어</a></li>
                        <li><a href="<c:url value='/service/preschool'/>">유치원</a></li>
                        <li><a href="<c:url value='/service/grooming'/>">그루밍</a></li>
                        <li><a href="<c:url value='/service/studio'/>">스튜디오</a></li>
                        <li><a href="<c:url value='/service/medicalCenter'/>">메디컬센터</a></li>
                	</ul>
                </div>
                <div class="sitemap-map-group">
                    <div class="sitemap-map-group-item">
                        <h4>예약하기</h4>
                    </div>
                    <ul class="sitemap-map-block">
                        <li><a href="<c:url value='/reserve'/>">예약하기</a></li>
                    </ul>
                </div>
                <div class="sitemap-map-group">
                    <div class="sitemap-map-group-item">
                        <h4>애견샵</h4>
                    </div>
                    <ul class="sitemap-map-block">
                        <li><a href="<c:url value='/product/item'/>">강아지용품</a></li>
                        <li><a href="<c:url value='/product/medicalDevice'/>">의료기기</a></li>
                        <li><a href="<c:url value='/product/snack'/>">간식</a></li>
                    </ul>
                </div>
                <div class="sitemap-map-group">
                    <div class="sitemap-map-group-item">
                        <h4>커뮤니티</h4>
                    </div>
                    <ul class="sitemap-map-block">
                        <li><a href="<c:url value='/qnaBoard/qna'/>">Q&A</a></li>
                        <li><a href="<c:url value='/board/boastboard'/>">뽐내기게시판</a></li>
                        <li><a href="<c:url value='/board/freeboard'/>">자유게시판</a></li>
                    </ul>
                </div>
                <div class="sitemap-map-group">
                    <div class="sitemap-map-group-item">
                        <h4>전문진 소개</h4>
                    </div>
                    <ul class="sitemap-map-block">
                        <li><a href="<c:url value='/professional'/>">전문진소개</a></li>
                    </ul>
                </div>
            </div>
        </article>
    </section>

<%@ include file="./include/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./include/header.jsp"%>


<section>
	<article class="main-container">
		<div class="wrap title">
			<h2>이용안내</h2>
		</div>
	</article>

	<article class="main-container">
		<div class="wrap info clearfix">
			<div class="img_block">
				<img src="./img/clock.png">
			</div>
			<div class="notice-text">
				<h3>운영시간</h3>
				<p>매일 10:00~21:00</p>
			</div>
		</div>
		<div class="wrap">
			<ul class="list-group">
				<li class="list-group-item">ㅇㅇ유치원은 연중 무휴로 운영됩니다.</li>
				<li class="list-group-item">모든 서비스는 100% 예약제로 운영됩니다.</li>
				<li class="list-group-item">호텔과 유치원은 사전예약 시 8시부터 입실이 가능합니다.</li>
				<li class="list-group-item">사전 예약 시 개인상담이 어려우니 양해해 주시기 바랍니다.</li>
			</ul>
		</div>

		<div class="wrap info clearfix">
			<div class="img_block">
				<img src="./img/notice.png">
			</div>
			<div class="notice-text">
				<h3>공지사항</h3>
				<p>이용 시 주의사항</p>
			</div>
		</div>
		<div class="wrap">
			<ul class="list-group">
				<li class="list-group-item">1년 이내 5가지 접종(종합, 코로나, 켄넬코프, 신종
					인플루엔자, 광견병) 받지 않은 반려견은 입실이 제한됩니다. <br> * 접종기록은 접종병원명이 꼭 필요하므로
					증빙 자료는 미리 준비해주세요.
				</li>
				<li class="list-group-item">1살 미만의 반려견인 경우 항체 검사가 필수 입니다.<br>
					(단, 1살 이상 시 재접종 기록 확인)
				</li>
				<li class="list-group-item">건강문제 또는 공격성이 강해 타 고객의 이용에 피해가 되는
					반려견 일 경우 입실이 제한됩니다.</li>
			</ul>
		</div>
		
		<div class="wrap">
			<div class="wrap info clearfix">
				<div class="img_block">
					<img src="./img/map.png">
				</div>
				<div class="notice-text">
					<h3>오시는 길</h3>
					<p>ㅇㅇ유치원 위치 이대역 9번출구 ㅁㅁ건물</p>
				</div>
			</div>
		</div>

		<!--
	* 카카오맵 - 약도서비스
	* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
	* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
-->
		<!-- 1. 약도 노드 -->
		<div class="wrap">
			<div id="daumRoughmapContainer1631693519383"
				class="root_daum_roughmap root_daum_roughmap_landing">
			</div>
		</div>
			
	</article>
</section>
<%@ include file="./include/footer.jsp"%>
		<!-- 2. 설치 스크립트 -->
		<script charset="UTF-8" class="daum_roughmap_loader_script"
			src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

		<!-- 3. 실행 스크립트 -->
		<script charset="UTF-8">
			new daum.roughmap.Lander({
				"timestamp" : "1631693519383",
				"key" : "27dvv",
				"mapWidth" : "700",
				"mapHeight" : "360"
			}).render();
		</script>

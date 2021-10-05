<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>



<div class="mypage clearfix">
	<aside class="side">
		<h2>마이페이지</h2>
		<ul class="mysidemenu">
			<li><a href="<c:url value='/reserveBoard/reserveList'/>"> 예약 내역</a></li>
			<li><a href="<c:url value='/user/passwordCheck'/>"> 회원정보 수정</a></li>
			<li><a href="<c:url value='/user/myBoard'/>" class="myhover"> <img
					src="../img/mytext.png" alt="구매내역"> 내가 쓴 글
			</a></li>
			<li><a href="<c:url value='/boast/likeList'/>"> 좋아요 누른글</a></li>
			<li><a href="<c:url value='/qnaBoard/qna#myqna'/>"> 문의내역</a></li>
			<li><a href="<c:url value='/product/basket'/>"> 장바구니</a></li>
			<li><a href="<c:url value='/product/zzim'/>"> 찜한 상품</a></li>
			<li><a href="<c:url value='/product/buylist'/>"> 구매 내역</a></li>
		</ul>
	</aside>
	<section class="side-content">
		<article class="main-container">
			<div class="mytitle">
				<h2>내가 쓴글</h2>
			</div>
		</article>
		<article class="main-container">
			<div class="myArticle">
				<table class="freeboard-table">
					<thead>
						<tr>
							<th class="freenum">글번호</th>
							<th>제목</th>
							<th class="freewrite">작성자</th>
							<th class="freeregdate">작성일</th>
							<th class="freehit">조회</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${freeList}">
							<tr>
								<td>${vo.bno}</td>
								<td><a
									href="<c:url value='/board/boardDetail?bno=${vo.bno}' />">${vo.title}</a>
									&nbsp;&nbsp;&nbsp; <c:if test="${vo.newMark}">
										<img alt="newMark" src="<c:url value='/img/new_mark.gif' />">
									</c:if></td>
								<td>${vo.writer}</td>
								<td><fmt:formatDate value="${vo.regdate}"
										pattern="yyyy-MM-dd" /></td>
								<!--    <td><fmt:formatDate value="${vo.updatedate}" pattern="yyyy-MM-dd"/></td>
	                            -->
								<td>${vo.viewCnt}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="freeboard-write clearfix">
				<button class="freeboard-write-btn">
					<a href="<c:url value='/board/boardWrite'/>" class="writeBtn">글쓰기</a>
				</button>
			</div>

			<form action="<c:url value='/board/freeboard' />" name="pageForm">
				<div class="text-center">


					<!-- 페이지 관련 버튼들이 ul 태그로 감싸져 있다. -->
					<div class="pagination" id="pagination">
						<c:if test="${freePc.prev}">
							<button type="button"
								onclick="location.href='/puppy/board/freeboard?pageNum=${freePc.beginPage-1}&countPerPage=${freePc.paging.countPerPage}'"
								data-pageNum="${freePc.beginPage-1}">&#10094;</button>
						</c:if>

						<c:forEach var="num" begin="${freePc.beginPage}"
							end="${freePc.endPage}">
							<a class="${freePc.paging.pageNum == num ? 'active' : ''}"
								href="<c:url value='/board/freeboard?pageNum=${num}&countPerPage=${freePc.paging.countPerPage}' />"
								data-pageNum="${num}">${num}</a>
						</c:forEach>

						<c:if test="${freePc.next}">
							<button type="button"
								onclick="location.href='/puppy/board/freeboard?pageNum=${freePc.endPage+1}&countPerPage=${freePc.paging.countPerPage}'"
								data-pageNum="${freePc.endPage+1}">&#10095;</button>
						</c:if>

					</div>

					<!-- 페이지 관련 버튼을 클릭시 숨겨서 보낼 값 -->
					<input type="hidden" name="pageNum"
						value="${freePc.paging.pageNum}"> <input type="hidden"
						name="countPerPage" value="${freePc.paging.countPerPage}">
					<input type="hidden" name="keyword"
						value="${freePc.paging.keyword}"> <input type="hidden"
						name="condition" value="${freePc.paging.condition}">


				</div>
			</form>
		</article>
		<article class="main-container">
			<div id="boast-products">
				<h2>멍스타그램</h2>
				<ul class="boasthover" id="boastlist">
					<c:forEach var="vo" items="${boastList}">
						<li class="myboard-boast"><a href="${vo.bbno}"
							id="boast_detail"> <img class="boastimg"
								src="<c:url value='/boast/display?fileLoca=${vo.fileLoca}&fileName=${vo.fileRealName}' />"
								alt="-">
		
		
								<div class="hover">
									<img class="hover-left" src="../img/heart.png" alt="좋아요"> <span
										class="span-left">${vo.like_cnt}</span> <img class="hover-right"
										src="../img/commnet.png" alt="댓글"> <span
										class="span-right">0</span>
								</div>
		
		
								<h4 class="align p-title">
		
									<p>${vo.title}</p>
								</h4>
						</a>
		
							<p class="align p-price">${vo.writer}</p>
							<div class="myboard-b-like">
								<span><fmt:formatDate value="${vo.regdate}"
										pattern="yyyy-MM-dd" /></span> <span>&middot;&nbsp;조회수 :
									${vo.view_cnt}</span>
							</div></li>
					</c:forEach>
		
		
				</ul>
		
				<div class="clearfix">
					<a href="<c:url value='/boast/boastboardWrite'/>"
						class="boast-write-btn">글쓰기</a>
				</div>
		
		
				<!-- 페이징 공간-->
				<form action="<c:url value='/boast/boastboard' />" name="boastPage">
					<div class="pagination" id="pagination">
						<c:if test="${boastPc.prev}">
							<button type="button"
								onclick="location.href='/puppy/boast/boastboard?pageNum=${boastPc.beginPage -1}&countPerPage=${boastPc.paging.countPerPage}'"
								data-pageNum="${boastPc.beginPage-1}">&#10094;</button>
						</c:if>
		
						<c:forEach var="num" begin="${boastPc.beginPage}"
							end="${boastPc.endPage}">
							<a class="${boastPc.paging.pageNum == num ? 'active' : ''}"
								href="<c:url value='/boast/boastboard?pageNum=${num}&countPerPage=${boastPc.paging.countPerPage}' />"
								data-pageNum="${num}">${num}</a>
						</c:forEach>
		
						<c:if test="${boastPc.next}">
							<button type="button"
								onclick="location.href='/puppy/boast/boastboard?pageNum=${boastPc.endPage +1}&countPerPage=${boastPc.paging.countPerPage}'"
								data-pageNum="${boastPc.endPage+1}">&#10095;</button>
						</c:if>
		
					</div>
		
					<!-- 페이지 관련 버튼을 클릭시 숨겨서 보낼 값 -->
					<input type="hidden" name="pageNum" value="${boastPc.paging.pageNum}">
					<input type="hidden" name="countPerPage"
						value="${boastPc.paging.countPerPage}"> <input type="hidden"
						name="keyword" value="${boastPc.paging.keyword}"> <input
						type="hidden" name="condition" value="${boastPc.paging.condition}">
		
		
		
				</form>
		
				<div class="freeboard-search">
					<form action="<c:url value='/boast/boastboard' />">
						<select name="condition">
							<option value="title"
								${boastPc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
							<option value="content"
								${boastPc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
							<option value="writer"
								${boastPc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
							<option value="titleContent"
								${boastPc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
						</select> <input type="text" name="keyword">
		
						<button type="submit" class="serch-btn">검색</button>
		
					</form>
				</div>
		
		
			</div>
		
		
		
		</article>
<!-- 여기부터 모달창  -->

	<div class="boast-modal-wrap">
		<div class="boast-modal">
			<div class="boast-modal_close" id="boast-close">
				<a href="#"><img src="../img/close.png" alt="close"></a>
			</div>
	
			<!--사진칸 왼쪽-->
	
			<div class="boastimg-btn bosat-btn-l">&#60;</div>
	
	
			<div class="boastimg-btn bosat-btn-r">&#62;</div>
	
	
			<div class="boast-pic" id="contentImg"></div>
	
	
	
			<!-- 내용 및 댓글-->
			<div class="boast-content">
	
				<div class="form-group">
					<p class="form-control" id="title"></p>
				</div>
	
				<div class="boast-text"
					style="word-break: break-all; overflow: scroll; overflow-x: hidden">
					<div class="text">
						<p id="content"></p>
					</div>
				</div>
	
				<div id="bbno" style="display: none"></div>
	
				<!-- 좋아요 기능 -->
				<div class="likearea">
	
					<img id="beforegood" src="../img/heart2.png" alt="좋아요버튼"> <img
						id="aftergood" src="../img/heart3.png" alt="좋아요취소버튼">
	
					<p>
						좋아요 <span id="like_cnt"> </span>개
					</p>
					<p class="bright" id="writer"></p>
	
					<button class="boastdelBtn" style="display: none"
						onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
					<button class="boastmodBtn" style="display: none"
						onclick="return confirm('글을 수정하시겠습니까?');">수정</button>
	
				</div> <!-- 좋아요 끝 -->
	
	
				<!--댓글창-->
	
				<div class="boast-comment">
	
					<div class="boasr-commentadd clearfix">
						<form action="<c:url value="/boast/boastDetail" />" method="post"
							id="insert_data">
							<div class="boasr-comadd">
								<input type="text" id="boast-reply" name="boast-reply"
									placeholder="댓글을 남겨보세요">
							</div>
							<div class="boasr-comadd">
								<button class="boast-reply-Regist">게시</button>
							</div>
						</form>
	
					</div>
					<div class="link-inner">
						<a href="##"><i class="remove"></i></a>
					</div>
				</div><!-- 댓글끝 -->
	
			</div>
		</div>
	</div>
</section>
</div>





<%@ include file="../include/footer.jsp"%>
<script>
	window.onload = function() {

		if ('${msg}' == 'boastUpdateSucess') {
			alert('글 수정이 완료되었습니다.');
		}

		const $boastimg = $('.boastimg');
		const $hover = $('.hover');

		console.log($boastimg);

		const $ul = document.querySelector('.boasthover');

		$ul.addEventListener('mouseover', function(e) {
			e.preventDefault();
			if (!e.target.matches('img[class="boastimg"]')) {
				return;
			}
			e.target.nextElementSibling.style.display = 'block';
			e.target.addEventListener('mouseout', function(e) {
				e.target.nextElementSibling.style.display = 'none';
			});

		});
	}
	//////////////////검색에서 조회 눌렀을 때////////////
	$('.boast-search').click(function() {
		location.href = '<c:url value="/boast/boastboard-search-result" />';
	});

	$('#boastlist')
			.on(
					'click',
					'#boast_detail',
					function(e) {
						console.log(e);
						e.preventDefault();

						const bbno = $(this).attr('href');
						$
								.getJSON(
										"<c:url value='/boast/boastDetail?bbno=' />"
												+ bbno,
										function(data) {
											console.log(data);

											for (let i = 0; i < data.fileList.length; i++) {
												const img = '"<c:url value="/boast/display?fileLoca='
														+ data.fileList[i].fileLoca
														+ '&fileName='
														+ data.fileList[i].fileRealName
														+ '" />"';
												let str = "";
												if (i == 0) {
													str += '<img src='+img+' alt="boast" id="boast-detail-img" style="display:block;">';
												} else {
													str += '<img src='+img+' alt="boast" id="boast-detail-img" style="display:none;">';
												}

												$('.boast-pic').append(str);

											}
											$('#bbno').html(
													data.boastContent.bbno);
											$('#title').html(
													data.boastContent.title);
											$('#content').html(
													data.boastContent.content);
											$('#like_cnt').html(
													data.boastContent.like_cnt);
											$('#writer').html(
													data.boastContent.writer);
											//수정삭제 버튼 유무
											if (data.boastContent.writer == '${login.id}') {
												$('.boastdelBtn').css(
														'display', 'block');
												$('.boastmodBtn').css(
														'display', 'block');
											}
											const bbno1 = $('#bbno').html();
											const id = $('#writer').html();
											const info = {
												"id" : id,
												"bbno" : bbno1
											}

											$
													.ajax({
														type : "POST",
														url : "<c:url value='/boast/likeCheck'/>",
														data : JSON
																.stringify(info),
														headers : {
															"Content-type" : "application/json"
														},
														success : function(data) {
															if (data == 1) {
																$("#beforegood")
																		.hide();
																$("#aftergood")
																		.show();

															} else {
																$("#beforegood")
																		.show();
																$("#aftergood")
																		.hide();

															}
															getList(1, true);

														},
														error : function() {
															alert('서버에러 입니다. 관리자에게 문의하세요.');
														}
													});
										});

						$(".boast-modal-wrap").show();

						$('.boastdelBtn').click(function() {
							const bbno = $('#bbno').html();

							$.ajax({
								type : "post",
								url : "<c:url value='/boast/delete' />",
								data : JSON.stringify({
									bbno : bbno,

								}),
								dataType : "text", //서버로부터 어떤 형식으로 받을지 (생략 가능)
								headers : {
									"Content-Type" : "application/json"
								},
								success : function(data) {
									if (data == 'delSuccess') {
										alert('글삭제가 완료되었습니다.');
										location.reload();
									} else {
										alert('관리자에게 문의하세요');
									}

								},
								error : function() {
									alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
								}
							});

						});

						$('.boastmodBtn')
								.click(
										function() {
											const bbno = $('#bbno').html();
											const url = "<c:url value='/boast/update?bbno="
													+ bbno + "'/>"
											location.replace(url)
										});

						$("#boast-close").click(function() {
							$('.boast-pic').children().remove();
							$(".boast-modal-wrap").hide();
						});

					});

	////////////////////////////댓글

	$('.boast-reply-Regist').click(function(e) {
		e.preventDefault();
		/*
		    댓글을 등록하려면 게시글 번호도 보내 주셔야 합니다.
		    댓글 내용, 작성자, 댓글 비밀번호, 게시글 번호를 
		    json 표기 방법으로 하나로 모아서 전달해 주시면 됩니다.
		    비동기 통신으로 댓글 삽입을 처리해 주시고,
		    console.log를 통해 '댓글 등록 완료!'를 확인하시고
		    실제 DB에 댓글이 추가되는지도 확인해 주세요.
		 */

		const bbno = $('#bbno').html(); //컨트롤러에서 넘어온 게시글번호
		const reply = $('#boast-reply').val(); //댓글 내용
		const replyId = '${login.id}';

		if (reply == '') {
			alert('댓글을 입력해주세요!');
			return;
		}
		if (replyId == '') {
			alert('댓글은 로그인 후에 가능합니다.');
			return;
		}
		$.ajax({
			type : "post",
			url : "<c:url value='/breply/replyRegist' />",
			data : JSON.stringify({
				bbno : bbno,
				reply : reply,
				replyId : replyId
			}),
			dataType : "text", //서버로부터 어떤 형식으로 받을지 (생략 가능)
			headers : {
				"Content-Type" : "application/json"
			},
			success : function(data) {
				console.log('통신 성공! ' + data);
				$('#boast-reply').val('');
				alert('댓글 등록이 완료되었습니다.');
				getList(1, true); //등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
			},
			error : function() {
				alert('등록에 실패했습니다. 관리자에게 문의하세요.');
			}
		}); //댓글 등록 비동기 통신 끝.

	}); //댓글 등록 이벤트 끝

	//더보기 버튼 처리(클릭시 전역변수 페이지번호에 +1값을 전달)
	//$('#moreList').click(function() {
	//더보기잖아요. 누적해야 되지 않을까요?
	//1페이지의 댓글 내용 밑에다가 2페이지를 줘야지
	//1페이지를 없애고 2페이지를 보여주는 건 좀 그렇지 않나요?
	//	               getList(++page, false);
	//  });

	//목록 요청
	let page = 1; //페이지 번호
	let strAdd = ''; //화면에 그려넣을 태그를 문자열의 형태로 추가할 변수.

	getList(1, true); //상세화면 처음 진입 시 리스트 목록을 가져옴.

	//화면을 리셋할 것인지의 여부를 bool타입의 reset변수로 받겠다.
	//(댓글이 계속 밑에 쌓여요... 페이지가 그대로 머무니까)
	function getList(pageNum, reset) {

		const bbno = $('#bbno').html(); //게시글 번호

		//getJSON 함수를 통해 JSON형식의 파일을 읽어올 수 있다.
		//get방식의 요청을 통해 서버로부터 받은 JSON 데이터를 로드한다.
		//$.getJSON(url, [DATA], [통신 성공 여부])
		$
				.getJSON(
						"../breply/getList/" + bbno + '/' + pageNum,
						function(data) {
							console.log(data);

							let total = data.total; //총 댓글수
							console.log('총 댓글수: ' + total);
							let replyList = data.list; //댓글 리스트

							//페이지번호 * 데이터수보다 전체 게시글 개수보다 작으면 더보기 버튼을 없애자. 
							// if(total <= page * 10) {
							//    $('#moreList').css('display', 'none');
							// } else {
							//    $('#moreList').css('display', 'block');
							// }

							//insert, update, delete 작업 뒤에는 
							//댓글을 누적하고 있는 strAdd 변수를 초기화.
							if (reset === true) {
								strAdd = '';
							}

							//응답 데이터의 길이가 0보다 작으면 함수를 종료하자.
							if (replyList.length <= 0) {
								return; //함수 종료.
							}

							for (let i = 0; i < replyList.length; i++) {
								strAdd += "<div class='commentwrap clearfix'>"
								strAdd += "<div class='boast-img'>";
								strAdd += "<img src='../img/insta-profile.jpg' alt='프로필 사진'>";
								strAdd += "</div>";
								strAdd += "<div class='boast-id'>"
										+ replyList[i].replyId + "</div>";
								strAdd += "<div class='boast-dat'>"
										+ replyList[i].reply + "</div>"
								if (replyList[i].replyId == '${login.id}') {
									strAdd += "<a href='" + replyList[i].rno + "' class='boast-del-btn'>삭제</a>";

								}
								strAdd += "</div>";
							}
							$('.boast-comment').html(strAdd); //replyList영역에 문자열 형식으로 모든 댓글을 추가.
							//화면에 댓글을 표현할 때 reply-wrap을 display: none으로 선언하고,
							//jQuery fadeIn 함수로 서서히 드러나도록 처리.
							$('.commentwrap').fadeIn(500);

							//});
						}

				); //end getJSON

	} //end getList()

	//	               자세히 설명드리면
	//   댓글 삭제 처리 함수
	function replyDaleteAction(rno) {
		$.ajax({
			url : "<c:url value='/breply/delete' />"
			//  이부분이 JSON 타입으로 데이터를 보내는부분
			,
			headers : {
				"Content-Type" : "application/json"
			},
			type : "post",
			dataType : "text"
			//   이부분이 JSON 타입으로 데이터를 보내는부분
			//   서버에서는 json 타입으로 데이터를 받을수는 있는데 자바에는 json이라는 개념의 타입이 없습니다.
			//   [비슷한 개념으로 HashMap이 있는데 이걸쓰려면 json타입의 데이터가 문자열로 변환되어야합니다.]
			//   그래서 pom에 라이브러리를 추가하는것이고
			//   이렇게 데이터를 보내주면 bno라는 이름의 상자안에 bno의 값이 들어가는거랑 같다고 보시면됩니다.
			,
			data : JSON.stringify({
				rno : rno
			}),
			success : function(data) {
				if (data != "delSuccess")
					return false;
				alert("삭제가 완료 되었습니다.");
				getList(1, true);
			},
			error : function(error) {
				console.log(error);
			}
		})
	}

	//댓글 삭제 처리
	$('.boast-comment').on('click', '.boast-del-btn', function(e) {

		e.preventDefault();

		const rno = $(this).attr('href');
		console.log(rno);
		if (!confirm("삭제하시겠습니까?"))
			return;
		replyDaleteAction(rno);

	});

	//////////////////////좋아요 누르면 하트 색깔 칠해지는거//////////////
	$(".likearea").ready(function() {

		/*beforegood을 클릭했을 때 aftergood를 보여줌*/
		$("#beforegood").click(function() {
			$("#beforegood").hide();
			$("#aftergood").show();
			const bbno = $('#bbno').html();
			const id = $('#writer').html();
			const info = {
				"id" : id,
				"bbno" : bbno
			}

			$.ajax({
				type : "POST",
				url : "<c:url value='/boast/like'/>",
				data : JSON.stringify(info),
				headers : {
					"Content-type" : "application/json"
				},
				success : function(data) {
					$('#like_cnt').html(data);
				},
				error : function() {
					alert('서버에러 입니다. 관리자에게 문의하세요.');
				}
			});

		});

		/*aftergood를 클릭했을 때 beforegood을 보여줌*/
		$("#aftergood").click(function() {
			$("#beforegood").show();
			$("#aftergood").hide();
			const bbno = $('#bbno').html();
			const id = $('#writer').html();
			const info = {
				"id" : id,
				"bbno" : bbno
			}

			$.ajax({
				type : "POST",
				url : "<c:url value='/boast/like'/>",
				data : JSON.stringify(info),
				headers : {
					"Content-type" : "application/json"
				},
				success : function(data) {
					$('#like_cnt').html(data);
				},
				error : function() {
					alert('서버에러 입니다. 관리자에게 문의하세요.');
				}
			});
		});
	}); ////좋아요 누르면 하트 칠해지는거 끝

	//사진 옆으로 넘기기
	setTimeout(function() {
		$('.bosat-btn-l').click(function() {

			$('.boast-pic').children().each(function(i, item) {
				console.log($('.boast-pic').children().length);
				console.log($(item).css('display'));
				if ($(item).css('display') == 'block' && i == 0) {
					console.log('첫번째 if문');
					$('.boast-pic').children().last().css('display', 'block');
					$(item).css('display', 'none');
					return false;
				}
				if ($(item).css('display') == 'block') {
					console.log('두번째 if문');
					$(item).prev().css('display', 'block');
					$(item).css('display', 'none');
					return false;
				}
			});

		});

		$('.bosat-btn-r').click(function(e) {

			let imgCnt = $('.boast-pic').children().length;
			console.log('#이미지 개수 : ' + imgCnt);
			$('.boast-pic').children().each(function(i, item) {
				console.log($(item).css('display'));

				if ($(item).css('display') == 'block' && i == (imgCnt - 1)) {
					$('.boast-pic').children().first().css('display', 'block');
					$(item).css('display', 'none');
					return false;
				}

				if ($(item).css('display') == 'block') {
					console.log($(item).next());
					$(item).next().css('display', 'block');
					$(item).css('display', 'none');
					return false;
				}
			});
		});
	}, 300);
	//사진 옆으로 넘기기
</script>



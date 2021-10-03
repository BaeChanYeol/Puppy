<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
	.boast-del-btn {
		display: inline-block;
		float: right;
		color: #996633;
		font-size: 12px;
		padding:6px;
	}
	.boast-mod-btn {
		display: inline-block;
		float: right;
		color: #996633;
		font-size: 12px;
		padding:6px;
	
	}

</style>

<section>
	<article class="main-container">
		<div id="boast-products" class="wrap">
			<h2>멍스타그램</h2>
			<ul class="boasthover" id="boastlist">
				<c:forEach var="vo" items="${boastList}">
					<li>	
					<a href="${vo.bbno}" id="boast_detail">				
					<img class="boastimg"
						src="<c:url value='/boast/display?fileLoca=${vo.fileLoca}&fileName=${vo.fileRealName}' />"
						alt="-">					
                
					
						<div class="hover">
							<img class="hover-left" src="../img/heart.png" alt="좋아요"> 
							<span class="span-left">${vo.like_cnt}</span> 
								<img class="hover-right"  src="../img/commnet.png" alt="댓글"> 
								<span class="span-right">0</span>
						</div>
						

						<h4 class="align p-title">
							<p>${vo.title}</p>
						</h4> </a>

						<p class="align p-price">${vo.writer}</p>
						<div class="like">
							<span><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></span> <span>&middot;&nbsp;조회수 : ${vo.view_cnt}</span>
						</div></li>
				</c:forEach>
				

			</ul>

			<div class="wrap clearfix">
				<a href="<c:url value='/boast/boastboardWrite'/>"
					class="boast-write-btn">글쓰기</a>
			</div>


			<!-- 페이징 공간-->
			<form action="<c:url value='/boast/boastboard' />" name="boastPage">
				<div class="pagination" id="pagination">
					<c:if test="${pc.prev}">
						<button type="button" onclick="location.href='/puppy/boast/boastboard?pageNum=${pc.beginPage -1}&countPerPage=${pc.paging.countPerPage}'" data-pageNum="${pc.beginPage-1}">
							&#10094;</button>
					</c:if>

					<c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
						<a class="${pc.paging.pageNum == num ? 'active' : ''}"
							href="<c:url value='/boast/boastboard?pageNum=${num}&countPerPage=${pc.paging.countPerPage}' />"
							data-pageNum="${num}">${num}</a>
					</c:forEach>

					<c:if test="${pc.next}">
						<button type="button"  onclick="location.href='/puppy/boast/boastboard?pageNum=${pc.endPage +1}&countPerPage=${pc.paging.countPerPage}'" data-pageNum="${pc.endPage+1}">
							&#10095;</button>
					</c:if>

				</div>

				<!-- 페이지 관련 버튼을 클릭시 숨겨서 보낼 값 -->
				<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
				<input type="hidden" name="countPerPage" value="${pc.paging.countPerPage}"> 
				<input type="hidden" name="keyword" value="${pc.paging.keyword}"> 
				<input type="hidden" name="condition" value="${pc.paging.condition}">



			</form>

			<div class="freeboard-search">
				<form action="<c:url value='/boast/boastboard' />">
					<select name="condition">
						<option value="title"
							${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
						<option value="content"
							${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
						<option value="writer"
							${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
						<option value="titleContent"
							${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
					</select> <input type="text" name="keyword">

					<button type="submit" class="serch-btn">검색</button>

				</form>
			</div>


		</div>



	</article>


</section>
<!-- 여기부터 모달창  -->
<div class="boast-modal-wrap">
	<div class="boast-modal">
		<div class="boast-modal_close" id="boast-close">
			<a href="#"><img src="../img/close.png" alt="close"></a>
		</div>

		<!--사진칸 왼쪽-->
		
		<div class="boastimg-btn bosat-btn-l"> &#60;</div>		
		
		
		<div class="boastimg-btn bosat-btn-r">&#62;</div>		
		
		
			<div class="boast-pic"id="contentImg">
				
			</div> 
			

		
		<!-- 내용 및 댓글-->
		<div class="boast-content">

			<div class="form-group">
				<p class="form-control"  id="title"></p>
			</div>

			<div class="boast-text"
				style="word-break: break-all; overflow: scroll; overflow-x: hidden">
				<div class="text">
					<p id="content"></p>
				</div>
			</div>
			
			<div id="bbno" style="display:none"></div>
			
			<!-- 좋아요 기능 -->
			<div class="likearea">
			
				<img id="beforegood" src="../img/heart2.png" alt="좋아요버튼">
				
                <img id="aftergood" src="../img/heart3.png" alt="좋아요취소버튼">
                
				<p>
					좋아요 <span id="like_cnt"> </span>개
				</p>
				<p class="bright" id="writer"></p>
				<c:if test="${login != null}">
					<button class="boastdelBtn">삭제</button>
					<button class="boastmodBtn">수정</button>
				</c:if>
				<c:if test="${login == null}">
					<button class="boastdelBtn" style="display: none">삭제</button>
					<button class="boastmodBtn" style="display: none">수정</button>
				</c:if>
			</div>
			
			
			<!--댓글창-->

			<div class="boast-comment">
				<!-- <div class="commentwrap clearfix">
					<div class="boast-img">
						<img src="../img/insta-profile.jpg" alt="프로필 사진">
					</div>
					<div class="boast-id">동이아빠</div>
					<div class="boast-dat">너무 귀여워요~</div>
					<a hraf="#" class="boast-del-btn">수정</a>
					<a hraf="#" class="boast-mod-btn">삭제</a>
				</div> -->
			</div>
			<!--댓글달기-->
			<div class="boasr-commentadd clearfix">
				<form action="<c:url value="/boast/boastDetail" />" method="post"
					id="insert_data">
					<div class="boasr-comadd">
						<input type="text" id="boast-reply" name="boast-reply" placeholder="댓글을 남겨보세요">
					</div>
					<div class="boasr-comadd">
						<button class="boast-reply-Regist">게시</button>
					</div>
				</form>

			</div>
			<div class="link-inner">
				<a href="##"><i class="remove"></i></a>
			</div>
		</div>


	</div>
</div>


<%@ include file="../include/footer.jsp"%>

<script>
		if('${msg}' == 'boastRegistSuccess'){
			alert('멍스타그램 글등록이 완료 되었습니다.');
		}else if('${msg}' == 'boastRegistFail' ){
			alert('글등록에 실패하였습니다. 관리자에게 문의하세요.');
		}
	//////////////////////좋아요 누르면 하트 색깔 칠해지는거//////////////
		$(".likearea").ready(function(){
			/*
			$("#beforegood").show();
		    $("#aftergood").hide();
		    */
				
		
			
			/*beforegood을 클릭했을 때 aftergood를 보여줌*/
			$("#beforegood").click(function(){
			    $("#beforegood").hide();
			    $("#aftergood").show();	
			    const bbno = $('#bbno').html();
			    const id = $('#writer').html();
			    const info={
			    		"id" : id,
			    		"bbno" : bbno
			    }
			    
			    $.ajax({
					type: "POST",
					url: "<c:url value='/boast/like'/>",
					data: JSON.stringify(info),
					headers: {
						"Content-type" : "application/json"
					},
					success: function(data) {
						$('#like_cnt').html(data);
					},
					error: function() {
						alert('서버에러 입니다. 관리자에게 문의하세요.');
					}
				});	
			    
			    
			});
			
			/*aftergood를 클릭했을 때 beforegood을 보여줌*/
			$("#aftergood").click(function(){
			    $("#beforegood").show();
			    $("#aftergood").hide();
			    const bbno = $('#bbno').html();
			    const id = $('#writer').html();
			    const info={
			    		"id" : id,
			    		"bbno" : bbno
			    }
			    
			    $.ajax({
					type: "POST",
					url: "<c:url value='/boast/like'/>",
					data: JSON.stringify(info),
					headers: {
						"Content-type" : "application/json"
					},
					success: function(data) {
						$('#like_cnt').html(data);
					},
					error: function() {
						alert('서버에러 입니다. 관리자에게 문의하세요.');
					}
				});	
			});
		}); ////좋아요 누르면 하트 칠해지는거 끝
    
    //////////////////검색에서 조회 눌렀을 때////////////
    $('.boast-search').click(function() {
           location.href='<c:url value="/boast/boastboard-search-result" />';
     });
    
    
    ///////////////////게시물에 호버했을때///////////
        window.onload = function(){
            
            
            const $boastimg = $('.boastimg');
            const $hover = $('.hover');
    
            console.log($boastimg);
            
            /*
            $boastimg[1].addEventListener('mouseover', function () {
                $hover[1].style.display = 'block';
                $hover[1].addEventListener('mouseout', function () {
                    $hover[1].style.display = 'none';
                });
            });
            */
            /*
            for (let i=0; i<$boastimg.length; i++) {
                console.log($boastimg[i]);
                $boastimg[i].addEventListener('mouseover', function () {
                    $hover[i].style.display = 'block';
                    $hover[i].addEventListener('mouseout', function () {
                        $hover[i].style.display = 'none';
                    });
                });
                
            }
            */
            
            const $ul = document.querySelector('.boasthover');

            $ul.addEventListener('mouseover', function(e){
				e.preventDefault();
                if(!e.target.matches('img[class="boastimg"]')){
                    return;
                }
                e.target.nextElementSibling.style.display='block';
                e.target.addEventListener('mouseout', function(e){
	                e.target.nextElementSibling.style.display = 'none';
	            });

            });
          
	          $('#boastlist').on('click', '#boast_detail', function(e) {
	        	  console.log(e);
	        	  e.preventDefault();
	        	  
	        	  const bbno = $(this).attr('href');
	        	  $.getJSON("<c:url value='/boast/boastDetail?bbno=' />" + bbno,  
	        			function(data) {
							console.log(data);
							let num=9;
							for(let i=0; i<data.fileList.length; i++){
								const img = '"<c:url value="/boast/display?fileLoca=' + data.fileList[i].fileLoca + '&fileName=' + data.fileList[i].fileRealName + '" />"';
								let str = "";
									
								 	str += '<img src='+img+' alt="boast" id="boast-detail-img'+i+'" style="z-index:200'+num+' ">';
								
								$('.boast-pic').append(str);
								num--;
							}
							$('#bbno').html(data.boastContent.bbno);
							$('#title').html(data.boastContent.title);
							$('#content').html(data.boastContent.content);
							$('#like_cnt').html(data.boastContent.like_cnt);
							$('#writer').html(data.boastContent.writer);
							const bbno1 = $('#bbno').html();
						    const id = $('#writer').html();
						    const info={
						    		"id" : id,
						    		"bbno" : bbno1
						    }
						    
						    $.ajax({
								type: "POST",
								url: "<c:url value='/boast/likeCheck'/>",
								data: JSON.stringify(info),
								headers: {
									"Content-type" : "application/json"
								},
								success: function(data) {
									if(data == 1){
										$("#beforegood").hide();
									    $("#aftergood").show();
									
									}else{
										$("#beforegood").show();
									    $("#aftergood").hide();
										
									}
					
								},
								error: function() {
									alert('서버에러 입니다. 관리자에게 문의하세요.');
								}
							});	 
	        		  	});	
	        	  	
	        	  
	        	  	
				$(".boast-modal-wrap").show();
				
			
				console.log($("#boast-close"));
				$("#boast-close").click(function() {
					$('.boast-pic').children().remove();
					$(".boast-modal-wrap").hide();
				});
   
	          });
	         
				//사진 옆으로 넘기기			
	        	$('.bosat-btn-l').click(function() {
	        		
					let imgCnt= $('img[alt="boast"]').length;
					let index = 0;												
					for(let i=0; i<imgCnt; i++){
						if(i==0){
							index = $('#boast-detail-img'+i).css("z-index");
							
							index = parseInt(index) - 10;
							$('#boast-detail-img'+i).css("z-index", index);
						}else{
							let index = $('#boast-detail-img'+i).css("z-index");												
							index = parseInt(index) + 1;
							$('#boast-detail-img'+i).css("z-index", index);					
						}
					}
	        	});
           
    /*
    
    //////////////////////////게시글 클릭했을 때
    setInterval(function(){ $('#slide1>ul').delay(2500); 
    $('#slide1>ul').animate({marginLeft: "-1200px"}) 
    $('#slide1>ul').delay(250); 
    $('#slide1>ul').animate({marginLeft: "-2400px"}) 
    $('#slide1>ul').delay(250); 
    $('#slide1>ul').animate({marginLeft: "0px"}) });
    
    */
    
  //삭제 처리
	//삭제하기 링크를 클릭했을 때 이벤트를 발생 시켜서
	//비동기 방식으로 삭제를 진행해 주세요.
	//서버쪽에서 권한을 확인 해 주세요.(작성자와 로그인 중인 사용자의 id를 비교해서)
	//일치하지 않으면 문자열 "noAuth" 리턴, 성공하면 "Success" 리턴.
	
	//$('#boast-content').on('click', '.link-inner a', function(e) {
		//e.preventDefault();
		
		//const bno = $(this).attr('href');
		
		//$.ajax({
			//type: "post",
			//url: "<c:url value='/boast/delete' />/" + bno,
			//success: function(result) {
				//if(result === 'noAuth') {
					//alert('권한이 없습니다.');
				//} else if(result === 'fail') {
				//	alert('삭제에 실패했습니다. 관리자에게 문의하세요.');
				//} else {
				//	alert('게시물이 정상적으로 삭제되었습니다.');
				//	getList(true); //삭제가 반영된 글 목록을 새롭게 보여줘야 하기 때문에 str을 초기화.
				//}
			//},
			//error: function(status) {
			//	alert('삭제에 실패했습니다. 다시 시도하세요.' + status);
			//}
		//});

	//});
	
    }
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
           
         
         $.ajax({
            type: "post",
            url: "<c:url value='/breply/replyRegist' />",
            data: JSON.stringify(
               {
                  "bbno": bbno,
                  "reply": reply
               }      
            ),
            dataType: "text", //서버로부터 어떤 형식으로 받을지 (생략 가능)
            headers: {
               "Content-Type" : "application/json"
            },
            success: function(data) {
               console.log('통신 성공! ' + data);
               $('#boast-reply').val('');
               getList(1, true); //등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.
            },
            error: function() {
               alert('등록에 실패했습니다. 관리자에게 문의하세요.');
            }
         }); //댓글 등록 비동기 통신 끝.

      }); //댓글 등록 이벤트 끝

      //더보기 버튼 처리(클릭시 전역변수 페이지번호에 +1값을 전달)
      //$('#moreList').click(function() {
         //더보기잖아요. 누적해야 되지 않을까요?
         //1페이지의 댓글 내용 밑에다가 2페이지를 줘야지
         //1페이지를 없애고 2페이지를 보여주는 건 좀 그렇지 않나요?
    //     getList(++page, false);
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
         $.getJSON(
            "../breply/getList/" + $('#bbno').html() + '/' + pageNum,
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
               if(reset === true) {
                  strAdd = ''; 
               }
               
               //응답 데이터의 길이가 0보다 작으면 함수를 종료하자.
               if(replyList.length <= 0) { 
                  return; //함수 종료.
               }
               
               for(let i=0; i<replyList.length; i++) {
                        strAdd += "<div class='commentwrap clearfix'>"
                       strAdd += "<div class='boast-img'>";
                        strAdd += "<img src='../img/insta-profile.jpg' alt='프로필 사진'>";
                        strAdd += "</div>";
                        strAdd += "<div class='boast-id'>"+ replyList[i].replyId +"</div>"; 
                        strAdd += "<div class='boast-dat'>"+ replyList[i].reply +"</div>"    
                        strAdd += "<a href='" + replyList[i].rno + "' class='boast-mod-btn'>수정</a>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='boast-del-btn'>삭제</a>";
                        strAdd += "</div>";
               } 
               $('.boast-comment').html(strAdd); //replyList영역에 문자열 형식으로 모든 댓글을 추가.
               //화면에 댓글을 표현할 때 reply-wrap을 display: none으로 선언하고,
               //jQuery fadeIn 함수로 서서히 드러나도록 처리.
               $('.commentwrap').fadeIn(500); 
               
             
               
                 // $('#replyList').on('click', '.reply-group > .replyDelete', function(e) {
                    
                    $(".reply-delBtn").each(function(){
                       $(this).on("click", function(e){
                       e.preventDefault();
                       
                       const rno = $(this).attr('href');
                       console.log(rno);
                       if(!confirm("삭제하시겠습니까?")) return;
                       replyDaleteAction(rno);
                       });
                    });
                    
                 

            //});
            }
            
         ); //end getJSON
         
      } //end getList()
      

   
     //     자세히 설명드리면
      //   댓글 삭제 처리 함수
      function replyDaleteAction(rno){
         $.ajax({
            url:"<c:url value='/reply/delete' />"
            //  이부분이 JSON 타입으로 데이터를 보내는부분
            ,headers: {
                "Content-Type" : "application/json"
              }
            ,type:"post"
            ,dataType:"text"
            //   이부분이 JSON 타입으로 데이터를 보내는부분
            //   서버에서는 json 타입으로 데이터를 받을수는 있는데 자바에는 json이라는 개념의 타입이 없습니다.
            //   [비슷한 개념으로 HashMap이 있는데 이걸쓰려면 json타입의 데이터가 문자열로 변환되어야합니다.]
              //   그래서 pom에 라이브러리를 추가하는것이고
              //   이렇게 데이터를 보내주면 bno라는 이름의 상자안에 bno의 값이 들어가는거랑 같다고 보시면됩니다.
            ,data:JSON.stringify({
               rno:rno
            })
            ,success:function(data){
               if(data != "delSuccess") return false;
                  alert("삭제 되었습니다.");
                  location.reload();
            },error:function(error){
               console.log(error);
            }
         })
      }

    
    
    
    
    
	 </script>


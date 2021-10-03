<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ include file="../include/header.jsp" %>

    <section>
        <article class="main-container">
            <div class="wrap">   
                <h3 class="writetitle">자유게시판</h3>
            </div>
        </article>
        <article class="main-contaier">
        
            <div class="freetitle wrap">        
            	                         
                <h4>${article.title}</h4>
                <p>
                    <span class="writer">${article.writer}</span><br>
                    <span class="ragdate"><fmt:formatDate value="${article.regdate}" pattern="yyyy-MM-dd"/></span>
                    <span class="hit"> 조회:${article.viewCnt}회</span>
                </p>
            </div>
           
             <div class="wrap">
                <div class="freecontent">
                                <img src="<c:url value='/board/display?fileLoca=${article.fileLoca}&fileName=${article.fileRealName}' />" id="freeboardImg" style="width:400px" alt="사진">
                    <p class="content">${article.content}</p>
                </div>
			<form action="<c:url value='/board/freeDelete' />" name="updateForm" method="post">
				<input type="hidden" name="bno" value="${article.bno}">
                <div class="freebtn">
                	<c:if test="${article.writer == login.id }">
	                    <button type="button" class="freeBtn" onclick="location.href='<c:url value="/board/boardModify?bno=${article.bno}&writer=${article.writer}&pageNum=${p.pageNum}&countPerPage=${p.countPerPage}" />'">변경</button>
	                    <button type="submit" class="freeBtn" id="delBtn" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>              	
                	</c:if>
                    <button type="button" class="freeBtn" onclick="location.href='<c:url value="/board/freeboard?pageNum=${p.pageNum}&keyword=${p.keyword}&condition=${p.condition}" />'">목록</button>
                </div>
                </form>
                </div>
        </article>
        <article class="main-contaier">
            <div class="commentList wrap">
                <!--댓글 목록-->
                <div id="replyList">                  
			<!--  <div class="reply-item" >             
                        <form>
                        <div class='reply-group clearfix'>
                            <div class='reply-image'>
                                <img src="../resources/img/profile.png">
                            </div>
                            <strong class='reply-left'>1</strong>
                            <small class='reply-left'>일자표현</small>
                            <p>댓글 영역이 될 곳.댓글 영역</p>
                           
                             <a href='#' class='reply-right'><span class='reply-delBtn' id="">삭제</span></a>
                            <a href='#' class='reply-right'><span class='reply-modBtn'></span>수정</a>
                        
 						</div>
                        </form>
                    </div>
                     -->
                </div>
            </div>
        <div id="moreList" style="text-align: center; margin-bottom: 50px; ">더보기 ▽</div>
        </article>
        <article class="main-contaier">
                <!-- 댓글 입력창 -->   
                <div class="reply-content wrap clearfix">
                <input type="hidden" value="${article.bno}">
                    <textarea class="commentArea" name="reply" id="reply"></textarea>
                    <button type="button" class="registCom" id="replyRegist">등록하기</button>
                </div>
        </article>

    </section>
        
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    $(document).ready(function() {
    	if('${article.fileRealName}' == ''){
    		$('#freeboardImg').css('display', 'none');
    	}
    	
      $('#replyRegist').click(function() {
         
      
         const bno = '${article.bno}'; //컨트롤러에서 넘어온 게시글번호
         const reply = $('#reply').val(); //댓글 내용
         const replyId = $('#replyId').val(); //작성자
         
         
         
         
         $.ajax({
            type: "post",
            url: "<c:url value='/reply/replyRegist' />",
            data: JSON.stringify(
               {
                  "bno": bno,
                  "reply": reply
                  
               }      
            ),
            dataType: "text", //서버로부터 어떤 형식으로 받을지 (생략 가능)
            headers: {
               "Content-Type" : "application/json"
            },
            success: function(data) {
               console.log('통신 성공! ' + data);
               if(data == "regSuccess"){
	               $('#reply').val('');
	               //$('#replyId').val('');
	               getList(1, true); //등록 성공 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현.            	   
               }else{
            	   alert('로그인후 이용해주세요!');
            	   $('#login').click();
               }
            },
            error: function() {
               alert('등록에 실패했습니다. 관리자에게 문의하세요.');
            }
         }); //댓글 등록 비동기 통신 끝.

      }); //댓글 등록 이벤트 끝
     
      
      //더보기 버튼 처리(클릭시 전역변수 페이지번호에 +1값을 전달)
      $('#moreList').click(function() {
         //더보기잖아요. 누적해야 되지 않을까요?
         //1페이지의 댓글 내용 밑에다가 2페이지를 줘야지
         //1페이지를 없애고 2페이지를 보여주는 건 좀 그렇지 않나요?
         getList(++page, false);
      });
      
      
      //목록 요청
      let page = 1; //페이지 번호
      let strAdd = ''; //화면에 그려넣을 태그를 문자열의 형태로 추가할 변수.
      
      getList(1, true); //상세화면 처음 진입 시 리스트 목록을 가져옴.
      
      //화면을 리셋할 것인지의 여부를 bool타입의 reset변수로 받겠다.
      //(댓글이 계속 밑에 쌓여요... 페이지가 그대로 머무니까)
      function getList(pageNum, reset) { 
         
         const bno = '${article.bno}'; //게시글 번호
         
         //getJSON 함수를 통해 JSON형식의 파일을 읽어올 수 있다.
         //get방식의 요청을 통해 서버로부터 받은 JSON 데이터를 로드한다.
         //$.getJSON(url, [DATA], [통신 성공 여부])
         $.getJSON(
            "../reply/getList/" + bno + '/' + pageNum,
            function(data) {
               console.log(data);
               
               let total = data.total; //총 댓글수
               console.log('총 댓글수: ' + total);
               let replyList = data.list; //댓글 리스트
               
               //페이지번호 * 데이터수보다 전체 게시글 개수보다 작으면 더보기 버튼을 없애자. 
               if(total <= page * 5) {
                  $('#moreList').css('display', 'none');
               } else {
                  $('#moreList').css('display', 'block');
               }
               
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
            	   		strAdd += "<div class='reply-item reply-wrap' style='display: none'>"
                    	strAdd += "<div class='reply-group clearfix'>";
                        strAdd += "<div class='reply-image'>";
                        strAdd += "<img src='../resources/img/profile.png'>";
                        strAdd += "</div>";
                        strAdd += "<strong class='reply-left'>"+ replyList[i].replyId +"</strong>"; 
                  		strAdd += "<small class='reply-left'>"+ timeStamp(replyList[i].replyDate) +"</small>"
                        strAdd += "<p id='replycontent' >"+ replyList[i].reply +"</p>";
                        /* if(replyList[i].replyId = '${login.id}'){ */
                        strAdd += "<a href='" + replyList[i].rno + "' class='reply-right' onclick='return false;'><span class='reply-modBtn'>수정</span></a>";
                        strAdd += "<a href='" + replyList[i].rno + "' class='reply-right'><span class='reply-delBtn commentRemove'>삭제</span></a>";                        	
                        /* } */
                        strAdd += "</div>";
                        strAdd += "</div>";
               } 
               $('#replyList').html(strAdd); //replyList영역에 문자열 형식으로 모든 댓글을 추가.
               //화면에 댓글을 표현할 때 reply-wrap을 display: none으로 선언하고,
               //jQuery fadeIn 함수로 서서히 드러나도록 처리.
               $('.reply-wrap').fadeIn(500); 

			
            }
            
         ); //end getJSON
    	
      // 댓글쓴사람 안쓴사람 구별
      setTimeout(function() {
	      if($('strong[class="reply-left"]').html() != '${login.id}' ){
	    	  console.log('if문 발동!');
	    	  $('.reply-modBtn, .reply-delBtn').css('display', 'none');
	      }
		
		}, 100);
      
         
      } //end getList()
      
      
 

	  //  	자세히 설명드리면
      //	댓글 삭제 처리 함수
      function replyDaleteAction(rno){
    	  $.ajax({
    		  url:"<c:url value='/reply/delete' />"
				//  이부분이 JSON 타입으로 데이터를 보내는부분
    		  ,headers: {
                "Content-Type" : "application/json"
              }
    		  ,type:"post"
    		  ,dataType:"text"
    		  //	이부분이 JSON 타입으로 데이터를 보내는부분
    		  //	서버에서는 json 타입으로 데이터를 받을수는 있는데 자바에는 json이라는 개념의 타입이 없습니다.
    		  //	[비슷한 개념으로 HashMap이 있는데 이걸쓰려면 json타입의 데이터가 문자열로 변환되어야합니다.]
              //	그래서 pom에 라이브러리를 추가하는것이고
              //	이렇게 데이터를 보내주면 bno라는 이름의 상자안에 bno의 값이 들어가는거랑 같다고 보시면됩니다.
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
    	  });
      }
      //댓글 삭제 처리
  	$('#replyList').on('click', '.reply-delBtn', function(e) {
			
		e.preventDefault();
	
		const rno = $(this).parent().attr('href');
		console.log(rno);
		if(!confirm("삭제하시겠습니까?")) return;
		replyDaleteAction(rno);
		
	});
    
      
  	 function replyUpdateAction(rno, reply){
   	  $.ajax({
   		  url:"<c:url value='/reply/update' />"
				//  이부분이 JSON 타입으로 데이터를 보내는부분
   		  ,headers: {
               "Content-Type" : "application/json"
             }
   		  ,type:"post"
   		  ,dataType:"text"
   		  //	이부분이 JSON 타입으로 데이터를 보내는부분
   		  //	서버에서는 json 타입으로 데이터를 받을수는 있는데 자바에는 json이라는 개념의 타입이 없습니다.
   		  //	[비슷한 개념으로 HashMap이 있는데 이걸쓰려면 json타입의 데이터가 문자열로 변환되어야합니다.]
             //	그래서 pom에 라이브러리를 추가하는것이고
             //	이렇게 데이터를 보내주면 bno라는 이름의 상자안에 bno의 값이 들어가는거랑 같다고 보시면됩니다.
   		  ,data:JSON.stringify({
   			  rno:rno,
   			  reply:reply
   		  })
   		  ,success:function(data){
   			  if(data != "updateSuccess") return false;
   			  	alert("댓글이 수정 되었습니다.");
   			  	location.reload();
   		  },error:function(error){
   			  console.log(error);
   		  }
   	  });
     }
     
  	//수정버튼1
 	$('#replyList').on('click', '.reply-modBtn', function(e) {
		
		e.preventDefault();
		$(this).parent().prev().remove();
		$(this).parent().before($('<textarea type="text" name="reply" style="margin-left: 30px; width: 70%;height: 100px; padding: 5px; font-size:15px;" ></textarea>'));
		$('.reply-delBtn').css('display', 'none');
		$(this).attr('class', 'reply-updateBtn');	
		$(this).html('완료');
		
	});
	//수정버튼2
	$('#replyList').on('click', '.reply-updateBtn', function(e) {
		
		const rno = $(this).parent().attr('href');
		const reply = $(this).parent().prev().val();
		console.log(rno + reply);
		if(!confirm("수정하시겠습니까?")){
			return;
		}else{
			if(reply == ''){
				alert('빈칸을 채워주세여!');
				return;
			}
		}
		
		replyUpdateAction(rno,reply);
	});
      
      
      
      
      
      
      
      //날짜 처리 함수
      function timeStamp(millis) {
         
         const date = new Date(); //현재 날짜
         //현재 날짜를 밀리초로 변환 - 등록일 밀리초  -> 시간차
         const gap = date.getTime() - millis;
         
         let time; //리턴할 시간
         if(gap < 60 * 60 * 24 * 1000) { //1일 미만인 경우
            if(gap < 60 * 60 * 1000) { //1시간 미만일 경우
               time = '방금 전';
            } else { //1시간 이상일 경우
               time = parseInt(gap / (1000 * 60 * 60)) + '시간 전';
            }
         } else { //1일 이상일 경우
            const today = new Date(millis);
            const year = today.getFullYear(); //년
            const month = today.getMonth() + 1; //월
            const day = today.getDate(); //일
            const hour = today.getHours(); //시
            const minute = today.getMinutes(); //분
            
            time = year + '년 ' + month + '월 ' + day + '일 ' + hour + '시' + minute + '분';
         }
         
         return time;
         
      }
      
      
      
      
      
      
   }); //end jquery
   
   
    </script>
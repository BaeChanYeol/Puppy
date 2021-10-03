<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <section>
        <article class="main-container">
            <div class="wrap">   
                <h3 class="writetitle">글쓰기</h3>
            </div>
        </article>
        <article class="main-container">
            <div class="wrap">
                <form action="<c:url value='/boast/registForm'/>" name="registForm" method="post" class="boardWrite clearfix" enctype="multipart/form-data">
                    <!-- ***자유게시판이랑 뽐내기게시판이 어차피 달라서 옵션 없어도 될거같음
                    <select class="form-control">
                        <option>자유게시판</option>
                        <option>뽐내기 게시판</option>
                    </select>
                     -->
                    <input type="hidden" name="writer" value="${login.id}">
                    <input class="form-control" placeholder="멍스타그램 글쓰기" readonly>
                    <input class="form-control" name="title" placeholder="제목을 입력하세요">
                    <label for="file">사진첨부</label> 
                    <input type="file" class="photoBtn" name="file" id="file" multiple>
                    <div class="fileDiv" id="fileDiv"> <!-- 사진 미리보기로 최대 10장까지 볼 수 있는 곳 --> </div>
                    <textarea class="textArea" rows="15" style="margin-bottom: 10px;" name="content" placeholder="내용을 입력하세요"></textarea>    
                    <input type="reset" style="display:none">                    
                    <button type="button" class="listBtn">목록</button>
                    <button type="submit" id="res_btn" class="registBtn">등록</button>
                </form>
            </div>
        </article>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    
    const registBtn = document.getElementById('res_btn');
		registBtn.onclick = function(e) {
			e.preventDefault();
		//form태그는 document.폼 네임으로 바로 접근이 가능.
			if(document.registForm.title.value === '') {
				alert('제목은 필수 항목 입니다.');
				document.registForm.title.focus();
				return;
			} else if(document.registForm.content.value === '') {
				alert('내용은 필수 항목 입니다.');
				document.registForm.content.focus();
				return;
			} else if(document.registForm.file.value === '') {
				alert('사진은 필수 항목 입니다.');
				document.registForm.file.focus();
				return;
			} else {
				document.registForm.submit();
			}
		}
    
    $('.listBtn').click(function() {
        if(confirm('목록으로 돌아가시겠습니까?')) {
           location.href='<c:url value="/boast/boastboard" />';
        } else {
           return;
        }
     });
    
   
    
    
       //자바 스크립트 파일 미리보기 기능
   /*    function readURL(input) {
           if (input.files && input.files[0]) {
              
               var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
               //readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
              reader.readAsDataURL(input.files[0]); 
               //파일업로드시 화면에 숨겨져있는 클래스fileDiv를 보이게한다
               $(".fileDiv").css("display", "block");
               
               reader.onload = function(event) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
                   $('#fileImg').attr("src", event.target.result); 
                   console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
              }
           }
       }
      $("#file").change(function() {
           readURL(this); //this는 #file자신 태그를 의미
           
       }); */
       
       function readMultipleImage(input) {
    	    const multipleContainer = document.getElementById("fileDiv");
    	    
    	    
    	    // 인풋 태그에 파일들이 있는 경우
    	    if(input.files) {
    	        // 이미지 파일 검사 (생략)
    	        console.log(input.files);
    	        // 유사배열을 배열로 변환 (forEach문으로 처리하기 위해)
    	        const fileArr = Array.from(input.files)
    	        const $colDiv1 = document.createElement("div");
    	        $colDiv1.classList.add("column");
    	        fileArr.forEach((file, index) => {
    	            const reader = new FileReader();
    	            const $imgDiv = document.createElement("div");
    	            const $img = document.createElement("img");
    	            $img.classList.add("image");
    	            const $label = document.createElement("label");
    	            //$label.classList.add("image-label")
    	            $label.textContent = file.name;
    	            $imgDiv.appendChild($img);
    	            //$imgDiv.appendChild($label)
    	            reader.onload = e => {
    	                $img.src = e.target.result;
    	                
    	                $imgDiv.style.display = "inline-block";
    	                $imgDiv.style.paddingRight = '20px';
    	                $imgDiv.style.width = "150px";
    	                $imgDiv.style.height = "120px";
    	                $img.style.width = "120px";
    	                $img.style.height = "120px";
    	            }
    	            
    	            console.log(file.name);
    	           
    	            $colDiv1.appendChild($imgDiv);
    	            
    	            
    	            reader.readAsDataURL(file);
    	        });
    	        multipleContainer.appendChild($colDiv1);
    	    }
    	    
   	    	if($('img[class="image"]').length >10){
   	    		alert('사진추가 최대 갯수는 10장입니다.');
   	    		$('input[type="reset"]').click();
   	    		$('#fileDiv').children().remove();
   	    		return;  		
   	    	}
   		
    	};
      
       
    	const inputMultipleImage = document.getElementById("file")
    	inputMultipleImage.addEventListener("change", e => {
    		const $fileDiv = document.querySelector('.column');
    		if($fileDiv !== null) {
    			$fileDiv.remove();
    		}
    	    readMultipleImage(e.target)
    	});
       
    	
    
    </script>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
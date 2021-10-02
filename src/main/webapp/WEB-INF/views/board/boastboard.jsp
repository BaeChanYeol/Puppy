<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>


    <section>
        <article class="main-container">
            <div id="boast-products" class="wrap">
                <h2>뽐내기 게시판</h2>
                <ul class="boasthover">
                    <li>
                        <img class="boastimg" src="../img/boast1.jpg" alt="리트리버">
                        <div class="hover">
                            <img class="hover-left" src="../img/heart.png" alt="좋아요">
                            <span class="span-left">20</span>
                            <img class="hover-right" src="../img/commnet.png" alt="댓글">
                            <span class="span-right">20</span>
                        </div>
                        <a href="#">
                            <h4 class="align p-title">태어난지 100일째 저희 집 리트리버 </h4>
                        </a>
                        <p class="align p-price">콩이아빠</p>
                        <div class="like">
                            <span>2021.09.09</span>
                            <span>&middot;&nbsp;조회수 : 5</span>
                        </div>
                    </li>
                    <li>
                        <img class="boastimg" src="../img/boast2.jpg" alt="산타개">
                        <div class="hover">
                            <img class="hover-left" src="../img/heart.png" alt="좋아요">
                            <span class="span-left">20</span>
                            <img class="hover-right" src="../img/commnet.png" alt="댓글">
                            <span class="span-right">20</span>
                        </div>
                        <a href="#">
                            <h4 class="align p-title">산타옷입은 저희강아지 시츄산타네요</h4>
                        </a>
                        <p class="align p-price">시츄엄마</p>
                        <div class="like">
                            <span>2021.09.09</span>
                            <span>&middot;&nbsp;조회수 : 5</span>
                        </div>
                    </li>
                    <li>
                        <img class="boastimg" src="../img/boast3.jpg" alt="아기시바">
                        <div class="hover">
                            <img class="hover-left" src="../img/heart.png" alt="좋아요">
                            <span class="span-left">20</span>
                            <img class="hover-right" src="../img/commnet.png" alt="댓글">
                            <span class="span-right">20</span>
                        </div>
                        <a href="#">
                            <h4 class="align p-title">블랙탄시바를 입양했어요 이름은 킹콩이에요</h4>
                        </a>
                        <p class="align p-price">킹콩이</p>
                        <div class="like">
                            <span>2021.09.09</span>
                            <span>&middot;&nbsp;조회수 : 5</span>
                        </div>
                    </li>
                    <li>
                        <img class="boastimg" src="../img/boast4.jpg" alt="근육">
                        <div class="hover">
                            <img class="hover-left" src="../img/heart.png" alt="좋아요">
                            <span class="span-left">20</span>
                            <img class="hover-right" src="../img/commnet.png" alt="댓글">
                            <span class="span-right">20</span>
                        </div>
                        <a href="#">
                            <h4 class="align p-title">우리집 강아지 자바인데요 헬창이네요</h4>
                        </a>
                        <p class="align p-price">pt선생님</p>
                        <div class="like">
                            <span>2021.09.09</span>
                            <span>&middot;&nbsp;조회수 : 5</span>
                        </div>
                    </li>
                    <li>
                        <img class="boastimg" src="../img/boast5.jpg" alt="한복">
                        <div class="hover">
                            <img class="hover-left" src="../img/heart.png" alt="좋아요">
                            <span class="span-left">20</span>
                            <img class="hover-right" src="../img/commnet.png" alt="댓글">
                            <span class="span-right">20</span>
                        </div>
                        <a href="#">
                            <h4 class="align p-title">우리집 뽀리가 한복을 입었네요</h4>
                        </a>
                        <p class="align p-price">뽀리아빠</p>
                        <div class="like">
                            <span>2021.09.09</span>
                            <span>&middot;&nbsp;조회수 : 5</span>
                        </div>
                    </li>
                    <li>
                        <img class="boastimg" src="../img/boast6.jpg" alt="화장">
                        <div class="hover">
                            <img class="hover-left" src="../img/heart.png" alt="좋아요">
                            <span class="span-left">20</span>
                            <img class="hover-right" src="../img/commnet.png" alt="댓글">
                            <span class="span-right">20</span>
                        </div>
                        <a href="#">
                            <h4 class="align p-title">얼굴에 연지곤지찍으니 더이쁘고 귀엽네요</h4>
                        </a>
                        <p class="align p-price">댕댕이사랑</p>
                        <div class="like">
                            <span>2021.09.09</span>
                            <span>&middot;&nbsp;조회수 : 5</span>
                        </div>
                    </li>
                </ul>

                <div class="wrap clearfix">
                    <button class="boast-write-btn">글쓰기</button>
                </div>


                <!-- 페이징 공간-->
                <div class="boast-paging">

                    <button>이전</button>
                    <a href="#">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">6</a>
                    <a href="#">7</a>
                    <a href="#">8</a>
                    <a href="#">9</a>
                    <a href="#">10</a>
                    <button>다음</button>

                </div>
            </div>



        </article>


    </section>

<%@ include file="../include/footer.jsp" %>

    <script>
        window.onload = function(){
            
            
            const $boastimg = document.querySelectorAll('.boastimg');
            const $hover = document.querySelectorAll('.hover');
    
            console.log($boastimg);
            
            
            const $ul = document.querySelector('.boasthover');

            $ul.addEventListener('mouseover', function(e){

                if(!e.target.matches('img[class="boastimg"]')){
                    return;
                }
                e.target.nextElementSibling.style.display='block';

                e.target.addEventListener('mouseout', function(){
                    e.target.nextElementSibling.style.display = 'none';
                });
            });
          
            
           
        }
    </script>


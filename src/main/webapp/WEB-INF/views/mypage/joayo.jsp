<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>



    <div class="mypage clearfix">
        <aside class="side">
            <h2>마이페이지</h2>
            <ul class="mysidemenu">
                <li>
                    <a href="#"> 예약 내역</a>
                </li>
                <li>
                    <a href="#"> 회원정보 수정</a>
                </li>
                <li>
                    <a href="#"> 내가 쓴 글</a>
                </li>
                <li>
                    <a href="#" class="myhover"> <img src="../img/mylikelist.png" alt="구매내역">좋아요 누른글</a>
                </li>
                <li>
                    <a href="#"> 문의내역</a>
                </li>
                <li>
                    <a href="#"> 장바구니</a>
                </li>
                <li>
                    <a href="#"> 찜한 상품</a>
                </li>
                <li>
                    <a href="#"> 구매 내역</a>
                </li>
            </ul>
        </aside>
        <section class="side-content">
            <article class="main-container">
                <div class="mytitle">
                    <h2>
                        좋아요 누른 글
                    </h2>
                </div>
            </article>
            <article class="main-container">

                <div id="boast-products">
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

                    


                    <!-- 페이징 공간-->
                    <div class="pagination">
                
                        <button type="button" onclick="location.href='#'">&#10094;</button>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <button type="button" onclick="location.href='#'">&#10095;</button>
                        
                    </div>
                </div>



            </article>


        </section>
    </div>

	<%@ include file="../include/footer.jsp" %>
    <script>
        window.onload = function(){
            
            
            const $boastimg = document.querySelectorAll('.boastimg');
            const $hover = document.querySelectorAll('.hover');
    
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

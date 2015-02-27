<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>국내</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/domestic.css" />
    <!--[if lte IE 8]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/js/jquery-1.11.1.js"></script>

    <script>
        function imgOnload(img){
            img.style.opacity='1';
            img.style.marginLeft= -(img.width/2)+"px";
        }

        $(document).ready(function(){
            $(".category_btn").on("click",function(){
                if($(".category_con").hasClass("category_con_hide")){
                    $(this).html("CATEGORY ▲");
                    $(".category_con").removeClass("category_con_hide");
                }else{
                    $(this).html("CATEGORY ▼");
                    $(".category_con").addClass("category_con_hide");
                }
            });

            $(".category_con > ul > li").on("click",function(){
                $(".category_btn").html("CATEGORY ▼");
                $(".category_con").addClass("category_con_hide");
            });

            $(".category_field > .view_field > div").on("click",function(){
                if($(this).attr("class") == "list"){
                    $(".domestic_content").attr("class","domestic_content list_type");

                }else if($(this).attr("class") == "gallery"){
                    $(".domestic_content").attr("class","domestic_content gallery_type");

                }

                $(".category_field > .view_field > div").removeClass("active");
                $(this).addClass("active");
            });

            $(".favorite").hover(function(){
                $(this).children(".img").addClass("img_hover");
            },function(){
                $(this).children(".img").removeClass("img_hover");
            });

            $(".favorite").on("click",function(){
                if($(this).children(".img").hasClass("active")){
                    $(this).children(".img").removeClass("active");
                }else {
                    $(this).children(".img").addClass("active");
                }
            });

            $(".scrap_btn").on("click",function(){
                if($(this).children(".img").hasClass("active")){
                    $(this).children(".img").removeClass("active");
                }else {
                    $(this).children(".img").addClass("active");
                }
            });
        });

    </script>
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/include/header.jsp" flush="true">
		<jsp:param value="1" name="menu_key"/>
	</jsp:include>
</header>
<section>
    <article id="rank">
        <jsp:include page="/WEB-INF/views/include/nav.jsp" flush="true">
			<jsp:param value="1" name="menu_key"/>
		</jsp:include>
    </article>
    <article id="content">
        <div class="main_content domestic">
            <div class="page_content">
                <div class="domestic_title">Domestic</div>
                <!--<form method="get">-->
                    <!--<div class  ="domestic_search">-->
                        <!--<input class="domestic_search_box_btn" type="submit" value=""/>-->
                        <!--<input class="domestic_search_box" name="domesticSearch" type="text" autofocus required/>-->
                    <!--</div>-->
                    <!--<div class="domestic_array">-->
                        <!--<label><input checked="checked" type="radio" name="domestic_array" value="Show_Threads"/><span>Show Threads</span></label>-->
                        <!--<label><input type="radio" name="domestic_array" value="Advanced_Search" /><span>Advanced Search</span></label>-->
                        <!--<label><input type="radio" name="domestic_array" value="Show_Posts" /><span>Show Posts</span></label>-->
                    <!--</div>-->
                <!--</form>-->
                <div class="category_field">
                    <div class="category_btn">CATEGORY<span class="arrow"> ▼</span></div>
                    <div class="view_field">
                        <div class="list active"><div></div><div></div><div></div></div>
                        <div class="gallery"><div></div><div></div><div></div><div></div></div>
                    </div>
                    <div class="category_con category_con_hide">
                        <ul>
                            <li class="title">국내뉴스</li>
                            <li>- 산업</li>
                            <li>- 금융</li>
                            <li>- 생활경제</li>
                            <li>- 증권</li>
                            <li>- 부동산</li>
                            <li>- 사회</li>
                        </ul>
                    </div>
                </div>
                <div class="domestic_content list_type">
                    <div class="article">
                        <div class="list_img" style="background-image:url(http://media.gotraffic.net/images/ioF0ofk92ZvE/v18/1200x-1.jpg)"><div class="bak"></div></div>
                        <div class="content">
                            <div class="date">2015. 2. 26 15:33</div>
                            <div class="title">연말정산 논란, 13월의 세금폭탄!</div>
                            <div class="con">
                                ‘13월의 보너스’로 여겨졌던 연말정산에 대해 국민들의 불만이 속출하고 있는데요.
                                이는 바뀐 세법으로 대다수 소득공제 항목이 세액공제로 바뀌면서 환급액이 줄거나 돈을 토해내야 하는 경우가 생기고 있기 때문입니다.
                                정부는 당초 세액공제로 바뀌는 것이 저소득층의 부담은 줄고 고소득자에 대한 세금이 소폭 늘어날 거라고 주장했지만, 한국 납세자연맹이 세법을 적용해 시뮬레이션한 결과 연봉 2,360만 원~3,800만 원 미혼 직장인들과 자녀양육비 공제
                            </div>
                            <div class="data">
                                <div class="scrap_btn"><div class="img"></div><div class="text">스크랩&nbsp;</div></div>
                                <div class="view_field">
                                    <div class="favorite"><div class="img"></div><div class="text">241</div></div>
                                    <div class="view"><div><img src="/resources/img/eye.svg"></div><div class="text">1325</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="article">
                        <div class="list_img" style="background-image:url(http://media.gotraffic.net/images/ioF0ofk92ZvE/v18/1200x-1.jpg)"><div class="bak"></div></div>
                        <div class="content">
                            <div class="date">2015. 2. 26 15:33</div>
                            <div class="title">연말정산 논란, 13월의 세금폭탄!</div>
                            <div class="con">
                                ‘13월의 보너스’로 여겨졌던 연말정산에 대해 국민들의 불만이 속출하고 있는데요.
                                이는 바뀐 세법으로 대다수 소득공제 항목이 세액공제로 바뀌면서 환급액이 줄거나 돈을 토해내야 하는 경우가 생기고 있기 때문입니다.
                                정부는 당초 세액공제로 바뀌는 것이 저소득층의 부담은 줄고 고소득자에 대한 세금이 소폭 늘어날 거라고 주장했지만, 한국 납세자연맹이 세법을 적용해 시뮬레이션한 결과 연봉 2,360만 원~3,800만 원 미혼 직장인들과 자녀양육비 공제
                            </div>
                            <div class="data">
                                <div class="scrap_btn"><div class="img"></div><div class="text">스크랩&nbsp;</div></div>
                                <div class="view_field">
                                    <div class="favorite"><div class="img"></div><div class="text">241</div></div>
                                    <div class="view"><div><img src="/resources/img/eye.svg"></div><div class="text">1325</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="article">
                        <div class="list_img" style="background-image:url(http://media.gotraffic.net/images/ioF0ofk92ZvE/v18/1200x-1.jpg)"><div class="bak"></div></div>
                        <div class="content">
                            <div class="date">2015. 2. 26 15:33</div>
                            <div class="title">연말정산 논란, 13월의 세금폭탄!</div>
                            <div class="con">
                                ‘13월의 보너스’로 여겨졌던 연말정산에 대해 국민들의 불만이 속출하고 있는데요.
                                이는 바뀐 세법으로 대다수 소득공제 항목이 세액공제로 바뀌면서 환급액이 줄거나 돈을 토해내야 하는 경우가 생기고 있기 때문입니다.
                                정부는 당초 세액공제로 바뀌는 것이 저소득층의 부담은 줄고 고소득자에 대한 세금이 소폭 늘어날 거라고 주장했지만, 한국 납세자연맹이 세법을 적용해 시뮬레이션한 결과 연봉 2,360만 원~3,800만 원 미혼 직장인들과 자녀양육비 공제
                            </div>
                            <div class="data">
                                <div class="scrap_btn"><div class="img"></div><div class="text">스크랩&nbsp;</div></div>
                                <div class="view_field">
                                    <div class="favorite"><div class="img"></div><div class="text">241</div></div>
                                    <div class="view"><div><img src="/resources/img/eye.svg"></div><div class="text">1325</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="article">
                        <div class="list_img" style="background-image:url(http://media.gotraffic.net/images/ioF0ofk92ZvE/v18/1200x-1.jpg)"><div class="bak"></div></div>
                        <div class="content">
                            <div class="date">2015. 2. 26 15:33</div>
                            <div class="title">연말정산 논란, 13월의 세금폭탄!</div>
                            <div class="con">
                                ‘13월의 보너스’로 여겨졌던 연말정산에 대해 국민들의 불만이 속출하고 있는데요.
                                이는 바뀐 세법으로 대다수 소득공제 항목이 세액공제로 바뀌면서 환급액이 줄거나 돈을 토해내야 하는 경우가 생기고 있기 때문입니다.
                                정부는 당초 세액공제로 바뀌는 것이 저소득층의 부담은 줄고 고소득자에 대한 세금이 소폭 늘어날 거라고 주장했지만, 한국 납세자연맹이 세법을 적용해 시뮬레이션한 결과 연봉 2,360만 원~3,800만 원 미혼 직장인들과 자녀양육비 공제
                            </div>
                            <div class="data">
                                <div class="scrap_btn"><div class="img"></div><div class="text">스크랩&nbsp;</div></div>
                                <div class="view_field">
                                    <div class="favorite"><div class="img"></div><div class="text">241</div></div>
                                    <div class="view"><div><img src="/resources/img/eye.svg"></div><div class="text">1325</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="article">
                        <div class="list_img" style="background-image:url(http://media.gotraffic.net/images/ioF0ofk92ZvE/v18/1200x-1.jpg)"><div class="bak"></div></div>
                        <div class="content">
                            <div class="date">2015. 2. 26 15:33</div>
                            <div class="title">연말정산 논란, 13월의 세금폭탄!</div>
                            <div class="con">
                                ‘13월의 보너스’로 여겨졌던 연말정산에 대해 국민들의 불만이 속출하고 있는데요.
                                이는 바뀐 세법으로 대다수 소득공제 항목이 세액공제로 바뀌면서 환급액이 줄거나 돈을 토해내야 하는 경우가 생기고 있기 때문입니다.
                                정부는 당초 세액공제로 바뀌는 것이 저소득층의 부담은 줄고 고소득자에 대한 세금이 소폭 늘어날 거라고 주장했지만, 한국 납세자연맹이 세법을 적용해 시뮬레이션한 결과 연봉 2,360만 원~3,800만 원 미혼 직장인들과 자녀양육비 공제
                            </div>
                            <div class="data">
                                <div class="scrap_btn"><div class="img"></div><div class="text">스크랩&nbsp;</div></div>
                                <div class="view_field">
                                    <div class="favorite"><div class="img"></div><div class="text">241</div></div>
                                    <div class="view"><div><img src="/resources/img/eye.svg"></div><div class="text">1325</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="article">
                        <div class="list_img" style="background-image:url(http://postfiles2.naver.net/20120430_81/sheis0_1335752959471niEjD_GIF/slide.gif?type=w2)"><div class="bak"></div></div>
                        <div class="content">
                            <div class="date">2015. 2. 26 15:33</div>
                            <div class="title">연말정산 논란, 13월의 세금폭탄!</div>
                            <div class="con">
                                ‘13월의 보너스’로 여겨졌던 연말정산에 대해 국민들의 불만이 속출하고 있는데요.
                                이는 바뀐 세법으로 대다수 소득공제 항목이 세액공제로 바뀌면서 환급액이 줄거나 돈을 토해내야 하는 경우가 생기고 있기 때문입니다.
                                정부는 당초 세액공제로 바뀌는 것이 저소득층의 부담은 줄고 고소득자에 대한 세금이 소폭 늘어날 거라고 주장했지만, 한국 납세자연맹이 세법을 적용해 시뮬레이션한 결과 연봉 2,360만 원~3,800만 원 미혼 직장인들과 자녀양육비 공제
                            </div>
                            <div class="data">
                                <div class="scrap_btn"><div class="img"></div><div class="text">스크랩&nbsp;</div></div>
                                <div class="view_field">
                                    <div class="favorite"><div class="img"></div><div class="text">241</div></div>
                                    <div class="view"><div><img src="/resources/img/eye.svg"></div><div class="text">1325</div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="paging">
                    <div><<</div>
                    <div><</div>
                    <div class="active">1</div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                    <div>5</div>
                    <div>></div>
                    <div>>></div>
                </div>
            </div>
        </div>
    </article>
    <article id="banner">
        <jsp:include page="/WEB-INF/views/include/aside.jsp" flush="true">
			<jsp:param value="1" name="menu_key"/>
		</jsp:include>
    </article>
</section>
<footer>
    test
</footer>
</body>
</html>

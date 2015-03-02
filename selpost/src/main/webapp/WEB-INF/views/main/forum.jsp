<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포럼페이지</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/forum.css" />
    <!--[if lte IE 8]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/js/jquery-1.11.1.js"></script>
    <script>
        function showKoreaData(select){
            if(select.hasClass("rotate")){
                select.removeClass("rotate");
                select.html("▷");
                select.siblings(".category_btn").removeClass("category_btn_click");
                select.parent(".opinion_category").siblings(".table_content_wrap").removeClass("hide");
                select.parent().parent().siblings(".depth02").removeClass("show");

                select.parent(".opinion_category").siblings(".table_content_wrap").find(".title_action").removeClass("right_sliding01");
                select.parent(".opinion_category").siblings(".table_content_wrap").find(".writer_action").removeClass("right_sliding02");

                select.parent().parent().siblings(".depth02").find(".title_action").addClass("right_sliding01");
                select.parent().parent().siblings(".depth02").find(".writer_action").addClass("right_sliding02");

            }else {
                select.addClass("rotate");
                select.html("▶");
                select.siblings(".category_btn").addClass("category_btn_click");
                select.parent(".opinion_category").siblings(".table_content_wrap").addClass("hide");
                select.parent().parent().siblings(".depth02").addClass("show");

                select.parent(".opinion_category").siblings(".table_content_wrap").find(".title_action").addClass("right_sliding01");
                select.parent(".opinion_category").siblings(".table_content_wrap").find(".writer_action").addClass("right_sliding02");

                select.parent().parent().siblings(".depth02").find(".title_action").removeClass("right_sliding01");
                select.parent().parent().siblings(".depth02").find(".writer_action").removeClass("right_sliding02");

            }
        };
        function showGlobalData(select){
            select.parent().parent().siblings(".category_btn").children(".title").html(select.html());

            select.parent().parent().siblings(".round").removeClass("rotate2");
            $(".opinion_category > .global_category").removeClass("global_category_show");

            select.parent().parent().siblings(".round").addClass("rotate");
            select.parent().parent().siblings(".round").html("▶");
            select.parent().parent().siblings(".category_btn").addClass("category_btn_click");

            select.parent().parent().parent().siblings(".table_content_wrap").addClass("hide");
            select.parent().parent().parent().parent().siblings(".depth02").addClass("show");
            select.parent().parent().parent().siblings(".table_content_wrap").find(".title_action").addClass("right_sliding01");
            select.parent().parent().parent().siblings(".table_content_wrap").find(".writer_action").addClass("right_sliding02");
            select.parent().parent().parent().parent().siblings(".depth02").find(".title_action").removeClass("right_sliding01");
            select.parent().parent().parent().parent().siblings(".depth02").find(".writer_action").removeClass("right_sliding02");

        };

        $(document).ready(function(){
            $(".round").hover(function(){
                $(this).html("▶");
//                $(this).addClass("");
            },function(){
                if(!$(this).hasClass("rotate")){
                    $(this).html("▷");
                }
//                $(this).removeClass("");
            });
            $(".opinion_category > .global_category > ul > li").on("click",function(){
                showGlobalData($(this));
            });

            $(".round").on("click",function(){
                if($(this).hasClass("global") && !$(this).hasClass("rotate")){
                    if($(".opinion_category > .global_category").hasClass("global_category_show")){
                        $(this).removeClass("rotate2");
                        $(".opinion_category > .global_category").removeClass("global_category_show");

                    }else {
//                        $(".opinion_category > .global_category").focus();
                        $(this).addClass("rotate2");
                        $(".opinion_category > .global_category").addClass("global_category_show");
                    }
                    return;
                } else if ($(this).hasClass("global") && $(this).hasClass("rotate")){
                    $(this).siblings(".category_btn").children(".title").html("해외이슈");
                }
                showKoreaData($(this));
            });
        });
    </script>
</head>
<body>
<header>
    <jsp:include page="/WEB-INF/views/include/header.jsp" flush="false">
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
        <div class="main_content forum">
            <div class="page_content">
                <div class="forum_title">Forum</div>
                <form method="post">
                    <div class  ="forum_search">
                        <input class="forum_search_box_btn" type="submit" value=""/>
                        <input class="forum_search_box" name="forumSearch" type="text" autofocus required/>
                    </div>
                    <div class="forum_array">
                        <label><input checked="checked" type="radio" name="forum_array" value="Show_Threads"/><span>Show Threads</span></label>
                        <label><input type="radio" name="forum_array" value="Advanced_Search" /><span>Advanced Search</span></label>
                        <label><input type="radio" name="forum_array" value="Show_Posts" /><span>Show Posts</span></label>
                    </div>
                </form>
                <div class="forum_content">
                    <div class="about_us">
                        <div class="bar">
                            <img class="back_img" src="/resources/img/about_us.svg" />
                            <div class="first"><a href="/forum/list">About us</a></div>
                            <div class="last">Last Post</div>
                        </div>
                        <table class="content">
                            <tr>
                                <td class="explain">
                                    <div class="category_array">Rules</div>
                                    <div>Forum Rules are in here.<br>
                                    Read these before you post!</div>
                                </td>
                                <td class="title">
                                    <div class="title_con"><a href="#">SelPost Rules</a></div>
                                    <div class="date">February 2ND, 2015</div>
                                </td>
                                <td class="writer">
                                    <div>by <span class="id">Raonomics</span></div>
                                    <div>1 weeks ago</div>
                                </td>
                            </tr>
                            <tr>
                                <td class="explain">
                                    <div class="category_array">News</div>
                                    <div>Check latest updates and notices!</div>
                                </td>
                                <td class="title">
                                    <div class="title_con"><a href="#">Collaborating with Bithub.com</a></div>
                                    <div class="date">January 13TH, 2015</div>
                                </td>
                                <td class="writer">
                                    <div>by <span class="id">Raonomics</span></div>
                                    <div>2 weeks ago</div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="opinions">
                        <div class="bar">
                            <img class="back_img" src="/resources/img/opinions.svg" />
                            <div class="first"><a href="/forum/list">Opinions</a></div>
                            <div class="last">Last Post</div>
                        </div>
                        <article>
                            <div class="article">
                                <div class="opinion_category">
                                    <div class="round">▷</div>
                                    <div class="category_btn">
                                        <div class="title">국내이슈</div>
                                    </div>
                                </div>
                                <div class="table_content_wrap">
                                    <table class="content">
                                        <tr>
                                            <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                    <!--<div class="title">Korean Issues</div>-->
                                                    <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                            <!--</td>-->
                                            <td class="title">
                                                <div class="article title_action">
                                                    <div class="title_con"><a href="#">10 reasons why Abe must resign</a></div>
                                                    <!--<div class="date">February 2ND, 2015</div>-->
                                                </div>
                                            </td>
                                            <td class="writer">
                                                <div class="article writer_action">
                                                    <div>by <span class="id">netcop0207</span></div>
                                                    <div>1 weeks ago</div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                <div class="article title_action">
                                                    <div class="title_con"><a href="#">N. Korea relies more on America than on S. Korea</a></div>
                                                    <!--<div class="date">February 2ND, 2015</div>-->
                                                </div>
                                            </td>
                                            <td class="writer">
                                                <div class="article writer_action">
                                                    <div>by <span class="id">netcop0207</span></div>
                                                    <div>1 weeks ago</div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                <div class="article title_action">
                                                    <div class="title_con"><a href="#">People you wish to talk FTF</a></div>
                                                    <!--<div class="date">February 2ND, 2015</div>-->
                                                </div>
                                            </td>
                                            <td class="writer">
                                                <div class="article writer_action">
                                                    <div>by <span class="id">netcop0207</span></div>
                                                    <div>1 weeks ago</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="depth02">
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/policy.svg"></div><div>정책</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/industry.svg"></div><div>산업</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/life.svg"></div><div>생활경제</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/stock.svg"></div><div>증권</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/property.svg"></div><div>부동산</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/medal.svg"></div>
                                                <div>금융</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/etc.svg"></div><div>기타</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>


                            </div>
                        </article>
                        <article>
                            <div class="article">
                                <div class="opinion_category">
                                    <div class="round global">▷</div>
                                    <div class="category_btn">
                                        <div class="title">해외이슈</div>
                                    </div>
                                    <div class="global_category">
                                        <ul>
                                            <li class="01">유럽</li>
                                            <li class="02">중국</li>
                                            <li class="03">일본</li>
                                            <li class="04">미국</li>
                                            <li class="05">신흥국</li>
                                            <li class="06">기타</li>
                                            <!--<li class="07">South America</li>-->
                                        </ul>
                                    </div>
                                </div>
                                <div class="table_content_wrap">
                                    <table class="content">
                                        <tr>
                                            <!--<td class="explain" rowspan="3">-->
                                            <!--<div class="round">▷</div>-->
                                            <!--<div class="category_btn">-->
                                            <!--<div class="title">Korean Issues</div>-->
                                            <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                            <!--</div>-->
                                            <!--</td>-->
                                            <td class="title">
                                                <div class="article title_action">
                                                    <div class="title_con"><a href="#">10 reasons why Abe must resign</a></div>
                                                    <!--<div class="date">February 2ND, 2015</div>-->
                                                </div>
                                            </td>
                                            <td class="writer">
                                                <div class="article writer_action">
                                                    <div>by <span class="id">netcop0207</span></div>
                                                    <div>1 weeks ago</div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                <div class="article title_action">
                                                    <div class="title_con"><a href="#">N. Korea relies more on America than on S. Korea</a></div>
                                                    <!--<div class="date">February 2ND, 2015</div>-->
                                                </div>
                                            </td>
                                            <td class="writer">
                                                <div class="article writer_action">
                                                    <div>by <span class="id">netcop0207</span></div>
                                                    <div>1 weeks ago</div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="title">
                                                <div class="article title_action">
                                                    <div class="title_con"><a href="#">People you wish to talk FTF</a></div>
                                                    <!--<div class="date">February 2ND, 2015</div>-->
                                                </div>
                                            </td>
                                            <td class="writer">
                                                <div class="article writer_action">
                                                    <div>by <span class="id">netcop0207</span></div>
                                                    <div>1 weeks ago</div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="depth02">
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/policy.svg"></div><div>정책</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/industry.svg"></div><div>산업</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/life.svg"></div><div>생활경제</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/stock.svg"></div><div>증권</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/property.svg"></div><div>부동산</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/medal.svg"></div>
                                                <div>금융</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="article">
                                    <div class="opinion_category">
                                        <div class="category_btn">
                                            <div class="title"><div><img src="/resources/img/category_btn/etc.svg"></div><div>기타</div></div>
                                        </div>
                                    </div>
                                    <div class="table_content_wrap">
                                        <table class="content">
                                            <tr>
                                                <!--<td class="explain" rowspan="3">-->
                                                <!--<div class="round">▷</div>-->
                                                <!--<div class="category_btn">-->
                                                <!--<div class="title">Korean Issues</div>-->
                                                <!--&lt;!&ndash;<div class="explain">Talk about Korean economy in here.</div>&ndash;&gt;-->
                                                <!--</div>-->
                                                <!--</td>-->
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Possible scenarios if Russia collapses - economicwise.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Isn't free trading beneficial for Korea?</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="title">
                                                    <div class="article title_action right_sliding01">
                                                        <div class="title_con"><a href="#">Majority of Korean have complaints with the gov.</a></div>
                                                        <!--<div class="date">February 2ND, 2015</div>-->
                                                    </div>
                                                </td>
                                                <td class="writer">
                                                    <div class="article writer_action right_sliding02">
                                                        <div>by <span class="id">netcop0207</span></div>
                                                        <div>1 weeks ago</div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>


                            </div>
                        </article>
                    </div>

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
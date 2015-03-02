<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반갑다 친구들아2</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/forum.css" />
    <!--[if lte IE 8]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/js/jquery-1.11.1.js"></script>
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
                <form method="get">
                    <div class  ="forum_search">
                        <input class="forum_search_box_btn" type="submit" value=""/>
                        <input class="forum_search_box" name="forumSearch" type="text" autofocus required/>
                    </div>
                    <div class="forum_array">
                        <label><input checked="checked" type="radio" name="forum_array" value="Show_Threads"/><span>Show Threads</span></label>
                        <label><input type="radio" name="forum_array" value="Advanced_Search" /><span>Advanced Search</span></label>
                        <label><input type="radio" name="forum_array" value="Show_Posts" /><span>Show Posts</span></label>

                        <div class="thread">+ Post New Thread&nbsp;</div>
                    </div>
                </form>
                <div class="forum_content">
                    <table class="list">
                        <tr>
                            <th class="title">Title/Thread Starter</th>
                            <th class="replies">Replies/Views</th>
                            <th>Last Post By</th>
                        </tr>
                        <tr class="first">
                            <td class="title">
                                <div class="title_con">
                                    <div><a href="#">Majority of Korean have complaints with the gov.</a></div><div class="hot_con">HOT</div>
                                </div>
                                <div class="writer">Started by <span class="id">netcop0207</span>, (2015 02 04 16:06)</div>
                            </td>
                            <td class="replies">
                                <div class="replies_con">Replies: 1,224</div>
                                <div class="view">Views: 70,283</div>
                            </td>
                            <td class="last">
                                <div class="last_post">Ivyn</div>
                                <div class="last_date">2 weeks ago</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="title">
                                <div class="title_con"><div><a href="#">Isn't free trading beneficial for Korea?</a></div></div>
                                <div class="writer">Started by <span class="id">FurryEquinox</span>, (2015 02 04 16:06)</div>
                            </td>
                            <td class="replies">
                                <div class="replies_con">Replies: 994</div>
                                <div class="view">Views: 57,921</div>
                            </td>
                            <td class="last">
                                <div class="last_post">Shinoi</div>
                                <div class="last_date">1 day ago</div>
                            </td>
                        </tr>
                    </table>

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
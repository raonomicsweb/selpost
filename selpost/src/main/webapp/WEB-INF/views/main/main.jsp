<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>반갑다 친구들아</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/header.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css" />
    <!--[if lte IE 8]>
    	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/resources/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="/resources/js/masonry.pkgd.min.js"></script>
    <script type="text/javascript" src="/resources/js/imagesloaded.pkgd.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){

        
        });
    </script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
        google.load('visualization', '1.1', {packages: ['corechart']});
        google.setOnLoadCallback(drawExample3);

        function drawExample3() {
            var options = {
                width: 1000,
                height: 500,
                backgroundColor: 'none',
//                vAxis: {minValue:0, maxValue:100},
                animation: {
                    duration: 1000,
                    easing: 'in',
                    startup: true
                },
//                legend: { position: 'none' },
                chartArea:{left:50,top:0,width:'100%',height:'90%'}
            };

            var chart = new google.visualization.LineChart(
                    document.getElementById('example3-visualization'));
            var data = new google.visualization.DataTable();
            data.addColumn('number', 'x');
            data.addColumn('number', 'KOSPI');
            data.addRows([
                [5, 1902.62], [6, 1918.31], [7, 1921.23], [8, 1920.82], [9, 1936.09], [10, 1936.09], [11, 1936.09],
                [12, 1920.95], [13, 1917.14], [14, 1913.66], [15, 1914.14], [16, 1888.13], [17, 1936.09], [18, 1936.09],
                [19, 1902.62], [20, 1918.31], [21, 1921.23], [22, 1920.82], [23, 1936.09], [24, 1936.09], [25, 1936.09],
                [26, 1935.68], [27, 1952.4], [28, 1961.58], [29, 1951.02], [30, 1949.26], [31, 1951.02]
            ]);
//            data.addRow(['100', 123]);
//            data.addRow(['700', 17]);

            var button = document.getElementById('example3-b1');
            function drawChart() {
                // Disabling the button while the chart is drawing.
                button.disabled = true;
                google.visualization.events.addListener(chart, 'ready',
                        function() {
                            button.disabled = false;
                        });
                chart.draw(data, options);
            }

            button.onclick = function() {
                if (data.getNumberOfRows() > 5) {
                    data.removeRow(Math.floor(Math.random() * data.getNumberOfRows()));
                }
                // Generating a random x, y pair and inserting it so rows are sorted.
                var x = Math.floor(Math.random() * 1000);
                var y = Math.floor(Math.random() * 100);
                var where = 0;
                while (where < data.getNumberOfRows() && parseInt(data.getValue(where, 0)) < x) {
                    where++;
                }
                data.insertRows(where, [[x, y]]);
                drawChart();
            }
            drawChart();
        }

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
        <div class="main_content domestic">
            <div class="page_content">
                <div class="slide left_slide">
                    <div class="item slide1"></div>
                    <div class="item slide1"></div>
                </div>
                <div class="slide right_slide">
                    <div class="item slide2"></div>
                    <div class="item slide2"></div>
                    <div class="nav_title"><span class="domestic">Domestic</span></div>
                </div>
            </div>
        </div>
        <div class="main_content foreign">
            <div class="page_content">
                <div class="slide left_slide">
                    <div class="item slide2"></div>
                    <div class="item slide2"></div>
                    <div class="nav_title"><span class="foreign">Foreign</span></div>
                </div>
                <div class="slide right_slide">
                    <div class="item slide1"></div>
                    <div class="item slide1"></div>
                </div>
            </div>
        </div>
        <div class="main_content stock_market">
            <div class="page_content">
                <form><input id="example3-b1" type="button" value="Add and/or remove rows"></form>
                <div id="example3-visualization"></div>
                <!--<div class="item">-->
                    <!--<div class="thumbs_img"></div>-->
                    <!--<div class="title">1 week</div>-->
                <!--</div>-->
                <!--<div class="item">-->
                    <!--<div class="thumbs_img"></div>-->
                    <!--<div class="title">1 week</div>-->
                <!--</div>-->
                <!--<div class="item">-->
                    <!--<div class="thumbs_img"></div>-->
                    <!--<div class="title">1 week</div>-->
                <!--</div>-->
                <!--<div class="item">-->
                    <!--<div class="thumbs_img"></div>-->
                    <!--<div class="title">1 week</div>-->
                <!--</div>-->
            </div>
            <div class="nav_title"><span class="stock_market">Stock Market</span></div>
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
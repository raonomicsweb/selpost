<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.3/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.3/jquery-ui.js"></script>

<!-- date form -->
<!-- <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.4.4.js"></script> -->
<!-- <script src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.5/jquery-ui.js"></script> -->
<!-- <script src="http://cachedcommons.org/cache/modernizr/1.5.0/javascripts/modernizr.js"></script> -->
 
<!-- <link href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.5/themes/redmond/jquery-ui.css" -->
<!--     rel="stylesheet" type="text/css" /> -->
<style type="text/css">
	.secondCategory {
		display : none;
	}
</style>
<script>
	$(document).ready(function(){
		tagList();
	});
	
	//태그 생성
	function tagCreate(){
		console.log("tagCreate 커몬");
		var tagName = $("[name=tag]").val();
		 $.ajax({
			url:"/admin/tagcreate",
			data:{t_name:tagName},
			type:"POST",
			success:function(){
				tagList();
			}
		 });
	}
  $(function() {
    $( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker("option", "dateFormat", "yy-mm-dd");
    $( "#format" ).change(function() {
      $( "#datepicker" ).datepicker( "option", "dateFormat", $( this ).val() );
    });
  });
  function firstSelect(){
  	var group_codeID = $(".firstCategory option:selected").val();
  	$.ajax({
		url: "/admin/category",
		data: {"group_codeID":group_codeID},
		method: "POST",
		success: function(data){
			var content = "<option class='secondOptions'>2차 선택</option>";
			if(data != "default"){
				$(".secondCategory").css("display", "inline");
			}
			$.each(data, function(idx, val){
				content += "<option class='secondOptions' data-tagCodeID='"+val.tag_codeID+"' value='"+val.codeID+"'>"+val.group_codeName+"</option>";
			});
			$(".secondCategory").html(content);
		}
	});
  };
  	function secondSelect(){
  		var tagCodeID = $(".secondCategory option:selected").attr("data-tagCodeID");
//   		$("[name=tag_codeID]").val(tagCodeID);
  	}
  	function tagList(){
  		var contents = "";
  		$.ajax({
  			url:"/admin/taglist",
  			type:"GET",
  			success:function(data){
  				$.each(data, function(idx, val){
  					console.log("each");
					contents +=""+val.t_name+"<input type='checkbox' name='n_tag' value='"+val.t_no+"'>"; 								
  				});
  				$(".tagList").html(contents);
  			}
  		});
  	}
  </script>
</head>
<body>
	<div>
		<form id="newsform">
			<div>
				카테고리 <select class="firstCategory" onchange="javascript:firstSelect()">
					<option value="default">1차 선택</option>
					<c:forEach var="category" items="${category}">
						<option value="${category.codeID }">${category.group_codeName}</option>
					</c:forEach>
				</select> <select class="secondCategory" name="n_category" onchange="javascript:secondSelect()">
				</select>
			</div>
			<div>
				제목 <input type="text" name="n_title">
			</div>
			<div>
				글쓴이 <input type="text" name ="n_writer">
			</div>
			<div>
				<p>
					날짜 <input type="text" name="n_regDate" id="datepicker"">
				</p>
			</div>
			대표이미지 <input type="file" id="testImg"  multiple='multiple'>
							<input type="hidden" name="n_thumImg" value="">
			<div>
				내용
				<textarea name="smarteditor" id="smarteditor" rows="10" cols="100"
					style="width: 766px; height: 412px;"></textarea>
				<input type="hidden" name="n_content"  value="">
			</div>
			<div>
			 	태그 생성
			 	<input type="text" name="tag">
			 	<input type="hidden" name="tag_codeID">
				<input type="button"  class="tagBtn" value="생성" onclick="tagCreate()">
			</div>
			<div class="tagList">
				태그 <input type="checkbox" name="n_tag" value="태그">
			</div>
			<div>
				요약
				<textarea name="n_summary" rows="10" cols="50"></textarea>
			</div>
			<input type="button" id="savebutton" value="등록" />
		</form>
	</div>
	<script>
		$(function() {
			//전역변수선언
			var editor_object = [];

			nhn.husky.EZCreator.createInIFrame({
				oAppRef : editor_object,
				elPlaceHolder : "smarteditor",
				sSkinURI : "/resources/smarteditor/SmartEditor2Skin.html",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,
				}
			});
			
			//전송버튼 클릭이벤트
			$("#savebutton").click(
					function() {
						//id가 smarteditor인 textarea에 에디터에서 대입
						editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
						var ob = editor_object.getById["smarteditor"];
// 						console.log(editor_object[0].getIR());
						var mainPath = $("#testImg").val().replace(/\\/gi,"/");
						$.ajax({
							url:"/admin/s3upload",
							type:"POST",
							data:{file:mainPath},
							success:function(data){
								$("[name=n_thumImg]").val(data);
								
								//editor img s3 upload
								var imgTag = editor_object[0].getSelection()._document.querySelectorAll("img");
								for(var i =0; i<imgTag.length;i++){
									var imgEle = imgTag[i];
									var imgPath = imgTag[i].src.replace("file://","");
									$.ajax({
										url:"/admin/s3upload",
										type:"POST",
										data:{file : imgPath},
										success:function(data){
											$(imgEle).attr("src", data);
											editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", [])
											$("[name=n_content]").val(editor_object[0].getIR());
											
											//폼 submit
											var $newsform = $("#newsform");
											$newsform.attr("action", "/admin/edit/insert");
											$newsform.attr("method", "post");
											$newsform.submit();
										}
									});
								}
							}
						});
						//console.log("centent : " + editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []));
						// 이부분에 에디터 validation 검증
					})
		})
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.java.user.*" %>
<%@ page import="com.java.location.*" %>
<%@ page import="com.java.hall.*" %>
<%@ page import="com.java.wedding.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	Wedding wedding = (Wedding)request.getAttribute("wedding"); 
	int wedding_number = wedding.getWedding_number();
	int location_number = wedding.getLocation_number();
			
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/js/jQueryRotate_v_2_3.js"></script>
<title>Insert title here</title>
<script>
var currentCalendar = new Date();
//var currentYear = currentCalendar.getFullYear();
//var currentMonth = currentCalendar.getMonth()+1;
//var currentDate = currentCalendar.getDate();

$(document).ready(function(){
	init();
});
function init(){
	macChecker();
	setIframeHeight();
	
	setFocus();
}

function macChecker(){
	if(/(iPhone|iPod|iPad)/i.test(navigator.userAgent)) { 
	    if(/OS [2-4]_\d(_\d)? like Mac OS X/i.test(navigator.userAgent)) {  
	        // iOS 2-4 so Do Something   
	    } else if(/CPU like Mac OS X/i.test(navigator.userAgent)) {
	        // iOS 1 so Do Something 
	    } else {
	        // iOS 5 or Newer so Do Nothing
	    }
	    $('body').css("font-size","30pt");
	}else{
		//alert('android');
	}
}

function setIframeHeight(height){
	var iframe = $('#calendarIframe');
	iframe.css("height",height+"px")
	//alert($(window).height());
	//iframe.css("height",$(window).height()+"px");
	//alert(iframe.css("height"));
}

function sendWeddingChat(event){
	var target = $(event.target);
	//weddingChatControll
	//document.locationChatControllForm.target = 'weddingChatControll';
    //document.locationChatControllForm.action = '/CalendarWorkDateChangeServer';
	$('#locationChatControllForm').submit();
    //document.locationChatControllForm.submit();
    //alert("sendWeddingChat");
}

</script>
<script>
function refreshPage(){
	location.reload();
}

</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
img{
	vertical-align:bottom;
}
body{
	font-family: 'Nanum Gothic';
	margin:0px;
	width:100%;
	height:98%;
	font-size:40pt;
	background-color:white;
}
.ibody{
	padding:1%;
	width:98%;
}
.wrapper{
	padding:1%;
	width:98%;
}

.ihead{
	width:100%;
}

.fixed{
	position:fixed;
	width:100%;
	height:auto;
	z-index:99;
}
</style>
<style>
.backIcon{
	padding:2%;
}
.weddingTitle{
	font-size:25pt;
	padding:2%;
}
.weddingChatDiv{
	margin-top:2%;
	margin-bottom:2%;
	padding:2%;
	padding-top:3%;
	padding-bottom:3%;
	border:3px solid #eeeeee;
}
.weddingChatTitle{
	padding-top:10px;
	padding-bottom:20px;
}
#weddingChatControll{
	display:none;
}
#locationChatControllForm input{
	margin-left:1%;
	width:80%;
	font-size:35px;
	background-color:white;
	padding:10px;
	border:0px solid black;
	border-bottom:3px solid #abcdef;
	outline:0px solid black;
		
}
.locationChatFormDiv{
	margin-top:20px;
	padding-top:20px;
	padding-bottom:20px;
	border-top:3px dashed #e2e2e2;
}
.weddingChatEach{
	padding:5px;
}

.locationPhoto{
	margin-top:2%;
	margin-bottom:2%;
	padding:2%;
	padding-top:3%;
	padding-bottom:3%;
	border:3px solid #eeeeee;
}

.locationPhotoTitle{
	padding-top:10px;
	padding-bottom:20px;
}

.locationPhotoFormDiv{
	border-top:3px dashed #e2e2e2;
	padding:1%;
	padding-top:2%;
}
.locationPhotoForm div{
	margin-top:10px;
	margin-bottom:10px;
	
	padding-top:10px;
	padding-bottom:10px;
}
.locationPhotoFile{
	font-size:30pt;
	background-color:white;
}
.locationPhotoSubmit{
	width:99%;
	font-size:30pt;
	background-color:#abcdef;
	border:3px solid #e2e2e2;
}

.weddingPhotoUserDiv{
	text-align:center;
	font-size:20pt;
}
.weddingPhotoImgDiv{
	margin-top:20px;
	margin-bottom:20px;
	
}
.weddingPhotoImg{
	width:100%;
	border-radius:50px;
}
</style>

</head>
<body>
	<div class="wrapper">
		<div class="ihead">
			<div class="backIcon"  onclick="parent.closeClendarWeddingDetail()">
				<img src="/img/reply-arrow.png"> 돌아가기
			</div>
			<div class="weddingTitle">
				<%=wedding.getHall().getNickname()%>&nbsp&nbsp
				<%=wedding.getWork_date().substring(8,10) %>:<%=wedding.getWork_date().substring(10,12) %>&nbsp&nbsp
				신랑 : <%=wedding.getTitle().split("/")[0] %>&nbsp&nbsp 신부 :<%=wedding.getTitle().split("/")[1] %>
			</div>
			<div>
				
			</div>			
		</div>
		<iframe id="weddingChatControll">
		</iframe>
		<div class="ibody">
			<div class="weddingChatDiv">
				<div class="weddingChatTitle">
					<img src="/img/group (1).png">&nbsp&nbsp Message				
				</div>
				<%for(WeddingChat weddingChat : wedding.getWeddingChats()) {
					%>
						<div class="weddingChatEach">
							<%=weddingChat.getUser().getName() %> : <%=weddingChat.getText() %>
						</div>
					<%
				}%>
				<div class="locationChatFormDiv">
					<form id="locationChatControllForm" action="/ControllWeddingChat" method="post">
						<input style="display:none;" type="text" name="wedding_number" value="<%=wedding_number%>">
						<input style="display:none;" type="text" name="method" value="add">
						
						<input type="text" name="weddingChatText">
						<img src="/img/paper-plane.png" onclick="sendWeddingChat(event)">
					</form>
				</div>
			</div>
			
			<div class="locationPhoto">
				<div class="locationPhotoTitle">
					<img src="/img/photo-camera.png">&nbsp&nbsp Photo 
				</div>
				<%for(WeddingPhoto weddingPhoto : wedding.getWeddingPhotos()){
					%>
						<div class="weddingPhotoImgDiv">
							<div class="weddingPhotoUserDiv">
								올린이 : <%=weddingPhoto.getUser().getName() %>
							</div>
							<img class="weddingPhotoImg" alt="이미지 확인중 ..." src="<%=new String(weddingPhoto.getImgUrl().getBytes(),"UTF-8") %>">
						</div>
					<%
				} %>
				<div class="locationPhotoFormDiv">
				<!-- 
				| photo_number   | int(11)      | NO   | PRI | NULL    | auto_increment |
				| wedding_number | int(11)      | NO   |     | NULL    |                |
				| title          | varchar(50)  | NO   |     | NULL    |                |
				| imgUrl         | varchar(500) | NO   |     | NULL    |                |
				| user_id 
				 -->
				 	<form action="/ControllWeddingPhoto" method="post" 
				 		id="locationPhotoForm" class="locationPhotoForm" enctype="multipart/form-data"> 

				 		<input style="display:none;" type="text" name="wedding_number" value="<%=wedding_number%>">
						<input style="display:none;" type="text" name="method" value="add">
						
						<div>
							<input class="locationPhotoFile" type="file" name="file">
						</div>
						<div>
							<input class="locationPhotoSubmit"type="submit" value="올리기">
						</div> 						
				 	</form>
				</div>
			</div>
		</div>
		<div class="ifooter">
		</div>
	</div>
</body>
</html>

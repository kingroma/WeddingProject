<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.java.user.*" %>
<%@ page import="com.java.location.*" %>
<%@ page import="com.java.hall.*" %>
<%@ page import="com.java.util.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String user_id = (String)request.getSession().getAttribute("user_id");
	User user = (User)request.getAttribute("user");
	ArrayList<UserLocation> userLocations = (ArrayList<UserLocation>)request.getAttribute("userLocations");
	Location location = (Location)request.getAttribute("location");
	ArrayList<String> thisWeek = (ArrayList<String>)request.getAttribute("thisWeek");
	
	boolean isAdmin = (boolean)request.getAttribute("isAdmin");
	int location_number = location.getLocation_number();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/js/jQueryRotate_v_2_3.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function(){
	init();
});
function init(){
	//menuDivInit();
	menuInit();
}
function menuInit(){
	$("#locationListTr").css("display","none");
	
}
function menuDivInit(){
	var menuDiv = $('.menuDiv');
	$(menuDiv).rotate({
	      angle: 0,
	      center: ["0%", "0%"],
	      animateTo:-90
	      });
}
</script>
<script>
var isAnimateMenu = false;
function clickMenuBtn(){
	var icon = $('#menuBtn');
	var menuDiv = $('.menuDiv');
	var menuBtn = $('#menuBtn');
	
	if(!isAnimateMenu){
		isAnimateMenu = true;
		if(menuDiv.css("opacity")==0.0){
			menuDiv.css("opacity",0.5);
			/*
			menuDiv.rotate({
			      angle: -90,
			      center: ["0%", "0%"],
			      animateTo:0
			      });
			*/
			menuDiv.animate({"top":"0%"},"slow");
			menuDiv.animate({"opacity":1.0},"slow");
			
			menuBtn.rotate({
			      angle: 0,
			      center: ["50%", "50%"],
			      animateTo:90
			      });
			$('.bannerIcon').css("position","fixed");
			setTimeout(function(){isAnimateMenu = false;},2000);
			
		}else{
			isAnimateMenu = true;
			menuDiv.css("opacity",0.9);
			/*
			menuDiv.rotate({
			      angle: 0,
			      center: ["0%", "0%"],
			      animateTo:-90
			      });
			*/
			menuDiv.animate({"top":"-200%"},"slow");
			menuDiv.animate({"opacity":0.0},"slow");
			
			menuBtn.rotate({
			      angle: 90,
			      center: ["50%", "50%"],
			      animateTo:0
			      });
			$('.bannerIcon').css("position","absolute");
			setTimeout(function(){isAnimateMenu = false;},2000);
		}
	}
}


function clickShowLocationMenu(){
	var locationList = $("#locationListTr");
	var showClickLocationArrow = $('#showClickLocationArrow');
	
	if(locationList.css("display")=="none"){
		locationList.fadeIn("slow");
		showClickLocationArrow.rotate({
		      duration:1000,
		      angle: 0,
		      animateTo:180
		      })
		
	}else{
		locationList.fadeOut("slow");
		showClickLocationArrow.rotate({
		      duration:1000,
		      angle: 180,
		      animateTo:360
		      })
	}
}
</script>
<style>
/*init*/
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
html{
	font-family: 'Nanum Gothic'; 
	font-size:3em;
	padding:0px;
	margin:0px;
	width:100%;	
}
body{
	padding:0px;
	margin:0px;
	width:100%;
}
.wrapper{
	padding:0px;
	margin:0px;
	width:100%;
}
.ihead{
	padding:0%;
	margin:0px;
	width:100%;
	border-bottom:3px solid #abcdef;
}
.ibody{
	padding:1%;
	margin:0px;
}
.ifooter{
	
	margin:0px;
}

/*init*/
</style>
<style>
/* top banner */
.topBanner{
	padding:3%;
}
.topBannerTable{
	width:100%;
}
#menuBtn{
	width:80px;
	height:80px;
	padding:0px;
	margin:0px;
}
.bannerIcon{
	position:absolute;
	z-index:99;
	width:80px;
	height:80px;
}
.mainLogo{
	padding-left:80px;
	text-align:center;
	height:80px;
	
}
.calendarIcon{
	width:80px;
	height:80px;
}
/* top banner */

/* menu */
.menuDiv{
	position:fixed;
	width:100%;
	background-color:#e2e2e2;
	top:-200%;
	height:100%;
	opacity:0.0;
	z-index:99;
}
.menu{
	padding:4%;
}
.menuHeader{
	
}
.menuHeaderUserInfo{
	float:left;
	padding-left:15%;
}
.menuHeaderUserInfoBtn{
	float:right;
}
.menuBody{
	margin-top:100px;
}

.menuBodyMainTable{
	width:100%;
}

.menuBodyMainTable td{
	padding-top:30px;
	padding-bottom:30px;
}
.tableBodyMainTableText{
	padding-left:20px;
	text-align:left;
}
.tableBodyMainTableImg{
	width:100px;
	text-align:center;
}
.locationListDiv{
	padding-left:100px;
	padding-top:30px;
	padding-bottom:30px;
}
/* menu */

/* main notice*/
.thisWeekNoticeCaption{
	position:absolute;
	border:3px solid #abcdef;
	background-color:white;
	border-radius:20px;
}
.locationIssueListDiv{
	margin:20px;
	padding-top:50px;
	border:3px solid black;
	border-radius:20px;
}
.locationIssueObj{
	margin:20px;
	border:2px solid #eeeeee;
	border-radius:20px;
}
.locationIssueName{
	font-size:30pt;
	text-align:right;
	padding:10px;
	padding-right:50px;
}
.locationIssueListTitle{
	text-align:center;
	border-bottom:2px dashed #eeeeee;
	padding:5px;
}
.locationIssueListText{
	padding:20px;
}

/* main notice*/
/* location position */
.locationPositionDetailDiv{
	padding-top:40px;
	padding-bottom:40px;
}
.locationPositionTable{
	width:100%;
	padding:20px;
	font-size:30pt;
}
.locationPositionTable td{
	border:1px solid #abcdef;
}

.locationPositionTableHead td{
	border-bottom:5px solid #abcdef;
	
}
/* location position */
</style>

<style>
/* celendar */
iframe{
	padding:0px;
	margin:0px;
	border:0px solid black;
	width:100%;
	height:80vh;
	outline:0px solid white;
}
.weddingIframeDiv{
	display:none;
	z-index:97;
	position:absolute;

}

.selectCalendarDay{
	position:absolute;
	display:none;
	background-color:white;
	border:5px solid #eeeeee;
	padding:20px;
	margin:0px;
}
.selectCalendarDay select{
	font-size:40pt;
	margin-left:20px;
	margin-right:20px;
	background-color:white;
	border:0px solid white;
}
#subCalendarSearch{
	width:60px;
	height:60px;
	padding:0px;
	margin:0px;
	margin-left:10px;
	vertical-align:bottom;
}
.rightParentIcon{
	text-align:right;
}
.rightParentIcon img{
	width:70px;
	height:70px;
}
.addWeddingDiv{
	padding:10px;
	position:absolute;
	left:0px;
	top:120px;
	width:80%;
	margin-left:7%;
	background-color:white;
	border:5px solid #e2e2e2;
	display:none;	
	z-index:97;
}

.addWeddingDiv select{
	font-size:40pt;
	margin-left:20px;
	margin-right:20px;
	background-color:white;
	border:0px solid white;
}
.addWeddingDiv div{
	padding:20px;
}
.addWeddingDiv input{
	width:90%;
	font-size:40pt;
	margin-left:20px;
	margin-right:20px;
	background-color:white;
	border:3px solid #abcdef;
}
.addWeddingSubmit{
	width:90%;
	height:70px;
	border:0px solid #abcdef;
	margin-left:20px;
	margin-right:20px;
	background-image: url(/img/couple.png);
}

.weddingIframeDiv{
	display:none;
	z-index:97;
	position:absolute;

}
#weddingIframe{
	margin:1%;
	width:97vw;
	height:90vh;
	border:2px solid #e2e2e2;
}
</style>
<script>
var currentCalendar = new Date();
$(document).ready(function(){
	setIframeHeight();
	setCalendarIframe(currentCalendar);
});

function setIframeHeight(height){
	var iframe = $('#calendarIframe');
	iframe.css("height",height+"px")
}

function setCalendarIframe(calendar){
	var iframe = $('#calendarIframe');
	var year = calendar.getFullYear();
	var month = calendar.getMonth()+1;
	var date = calendar.getDate();
	var parameterCal = year+"_"+month+"_"+date;
	
	iframe.attr("src","/Calendar?year="+year+"&month="+month+"&location_number=<%=location_number%>");
}

function closeWeddingRedirect(){
	var iframeDiv = $('.weddingIframeDiv');
	var iframe = $('#weddingIframe');
	
	if(iframeDiv.css("display")=="block"){
		iframeDiv.fadeOut(300);
		
		setTimeout(function(){
			iframe.attr("src","");			
		},350);
	}
}
function clickWeddingRedirect(location_number,year,month,day){
	year = "20"+year.substring(1,3);
	//alert(location_number + " _ " + year + " _ " + month + " _ " + day);

	if(month.length == 1){
		month = "0"+month;
	}
	if(day.length == 1){
		day = "0"+day;
	}

	var sendDate = year+month+day;
	
	var iframeDiv = $('.weddingIframeDiv');
	var iframe = $('#weddingIframe');
	var url = "/CalendarWedding?location_number="+location_number+"&work_date="+sendDate;
	if(iframeDiv.css("display")=="none"){
		iframeDiv.fadeIn(200);
		iframe.attr("src",url);
	}
}

function changeCalendar(way,event){
	var target = $(event.target);
	target.animate({"opacity":0.1},200);
	target.animate({"opacity":1.0},200);
	
	var iframe = $('#calendarIframe');
	//iframe.animate({"opacity":0.0},100);
	//iframe.animate({"opacity":1.0},300);
	if(way=='left'){
		currentCalendar.setDate(0);
		setCalendarIframe(currentCalendar);
	}else if(way=='right'){
		var month = currentCalendar.getMonth();
		
		while(currentCalendar.getMonth()==month){
			currentCalendar.setDate(currentCalendar.getDate()+1);
		}
		setCalendarIframe(currentCalendar);
	}
	
	setTimeout(function(){
	},500);
}

function calendarRefresh(event){
	var target = $(event.target);
	var iframe = $('#calendarIframe');
	target.rotate({
	      duration:1000,
	      angle: 0,
	      animateTo: 360
	});
	//iframe.animate({"opacity":0.0},100);
	//iframe.animate({"opacity":1.0},300);
	var iframe = $('#calendarIframe');
	//var year = calendar.getFullYear();
	//var month = calendar.getMonth()+1;
	//var date = calendar.getDate();
	//var parameterCal = year+"_"+month+"_"+date;
	iframe.attr("src",iframe.attr("src"));
	//iframe.attr("src","/Calendar?year="+year+"&month="+month+"&location_number=<%=location_number%>");
	
}

function searchSubCalendar(event){
	var target = $(event.target);
	var iframe = $('#calendarIframe');
	
	target.animate({"opacity":0.0},200);
	target.animate({"opacity":1.0},200);
	
	var subCalendarYear = $('#subCalendarYear').val();
	var subCalendarMonth = $('#subCalendarMonth').val();
	
	currentCalendar = new Date(subCalendarYear+"/"+subCalendarMonth+"/"+"1");
	
	setTimeout(function(){
		iframe.attr("src","/Calendar?year="+subCalendarYear+"&month="+subCalendarMonth+"&location_number=<%=location_number%>");
		var subCalendar = $('#selectCalendarDay');
		subCalendar.fadeOut(400);
	},400);
}

function clickCalendarIcon(event){
	var target = $(event.target);
	//alert(target.offset().left+" / "+target.offset().top);
	var x = target.offset().left-300;
	var y = target.offset().top+70;
	
	target.animate({"opacity":0.0},200);
	target.animate({"opacity":1.0},200);
	
	setTimeout(function(){
		var subCalendar = $('#selectCalendarDay');
		var subCalendarWidth = subCalendar.css("width");
		//alert(subCalendarWidth);
		if(subCalendar.css("display")=="block"){
			subCalendar.fadeOut(200);
			//subCalendar.css("left",x);
			//subCalendar.css("top",y);
		}else{
			subCalendar.fadeIn(300);
			subCalendar.css("right",30);
			subCalendar.css("top",y);	
		}
	},400);
}

function clickAddIcon(event){
	var target = $(event.target);
	var addWeddingDiv = $('#addWeddingDiv');
	var ibody = $('.ibody');
	target.animate({"opacity":0.0},200);
	target.animate({"opacity":1.0},200);
	
	
	setTimeout(function(){
		if(addWeddingDiv.css("display")=="block"){
			addWeddingDiv.fadeOut(200);
			ibody.animate({"opacity":1.0},200);
		}else{
			addWeddingDiv.fadeIn(200);
			ibody.animate({"opacity":0.3},200);
		}
	},400);
}

function calendarCheck(event){
	
	var target = $(event.target);
	target.animate({"opacity":0.3},200);
	target.animate({"opacity":1.0},200);
	
	$('#calendarIframe').get(0).contentWindow.checkWorkDate();
	
	//$('#calendarIframe')[0].contentWindow.checkWorkDate();
}

</script>
</head>
<body>
	<div>
		<%if(isAdmin){
				%>
				<div id="addWeddingDiv" class="addWeddingDiv">
					<form action="/AddWedding" method="post">
						<div style="display:none;">
							<input type="text" name="location_number" value="<%=location_number %>">
						</div>
						<div>
							<select class="selectHall" name="hall_number">
								<%for(Hall hall : location.getHalls()){
									%>
										<option value="<%=hall.getHall_number()%>"><%=hall.getName() %></option>
									<%
								} %>
							</select>
						</div>
						<div>
							<select name="year" >
								<%
								Date todayDate = new Date();
								int todayYear = todayDate.getYear()+1900;
								int todayMonth = todayDate.getMonth()+1;
								for(int i = 2017 ; i < 2020 ; i ++){
									String selected = "";
									if(todayYear==i){
										selected = "selected";
									}%>
										<option value="<%=i%>" <%=selected %>><%=i%></option>		
									<%
								} %>
							</select>
							<select name="month" >
								<%for(int i = 1 ; i < 13 ; i ++){
									String selected = "";
									if(todayMonth==i){
										selected = "selected";
									}%>
									<option value="<%=i%>" <%=selected %>><%=i %></option>
									<%
								}%>
							</select>
							<select name="day" >
								<%for(int i = 1 ; i < 31 ; i ++){
									%>
									<option value="<%=i%>"><%=i %></option>
									<%
								}%>
							</select>
							<select name="time" >
								<%for(int i = 10 ; i < 22 ; i ++){
									%>
									<option value="<%=i%>00"><%=i %>:00</option>
									<option value="<%=i%>30"><%=i %>:30</option>
									<%
								}%>
							</select>
						</div>
						<div>
							<input type="text" name="boy" placeholder="신랑이름">
						</div>
						<div>
							<input type="text" name="girl" placeholder="신부이름">
						</div>
						<div>
							<input class="addWeddingSubmit" type="submit" value="">
						</div>
					</form>
				</div>
				<%	
			} %>
	</div>
	<div id="selectCalendarDay" class="selectCalendarDay">
		<select id="subCalendarYear">
			<%
				Date todayDate = new Date();
				int todayYear = todayDate.getYear() + 1900;
				int todayMonth = todayDate.getMonth() + 1;
				for (int i = 2017; i < 2020; i++) {
					String selected = "";
					if (todayYear == i) {
						selected = "selected";
					}
			%>
			<option value="<%=i%>" <%=selected%>><%=i%></option>
			<%
				}
			%>
		</select> <select id="subCalendarMonth">
			<%
				for (int i = 1; i < 13; i++) {
					String selected = "";
					if (todayMonth == i) {
						selected = "selected";
					}
			%>
			<option value="<%=i%>" <%=selected%>><%=i%></option>
			<%
				}
			%>
		</select> 
		<img onclick="searchSubCalendar(event)" id="subCalendarSearch"
			src="/img/search.png">	</div>
	<div class="menuDiv">
		<div class="menu">
			<div class="menuHeader">
				<div class="menuHeaderUserInfo">
							<%=user.getName()%> 님
				</div>
				<div class="menuHeaderUserInfoBtn">
					<img src="/img/settings.png">
				</div>
				<div class="menuHeaderUserInfoBtn"style="width:50px;">&nbsp <!-- gab --> </div>
				<div class="menuHeaderUserInfoBtn">
					<a href="/Main"><img src="/img/home.png"></a>
				</div>
				
				<div style="clear:both;"></div>
			</div>
			<div class="menuBody">
				<div>
					<table class="menuBodyMainTable"cellspacing=0>
						<tr>
							<td class="tableBodyMainTableImg">
								<img src="/img/circle.png">			
							</td>
							<td class="tableBodyMainTableText">
								공지사항
							</td>
						</tr>
						
						<tr>
							<td class="tableBodyMainTableImg">
								<img src="/img/circle.png">			
							</td>
							<td onclick="clickShowLocationMenu()" class="tableBodyMainTableText">
								<div style="float:left">
									예식조회
								</div>
								<div style="float:right">
									<img id="showClickLocationArrow" src="/img/down-arrow.png">	
								</div>
								<div style="clear:both;">
								</div>
							</td>
						</tr>
						<tr id="locationListTr">
							<td style="padding-top:0px;padding-bottom:0px;margin-top:0px;margin-bottom:0px;">
							</td>
							<td style="padding-top:0px;padding-bottom:0px;margin-top:0px;margin-bottom:0px;">
								<%for(UserLocation userLocation : userLocations){
									%>
										<div class="locationListDiv">
											<%=userLocation.getLocation().getName() %>
										</div>
									<%
								} %>
							</td>
						</tr>
						<tr>
							<td class="tableBodyMainTableImg">
								<img src="/img/circle.png">			
							</td>
							<td class="tableBodyMainTableText">
								나의급여 
							</td>
						</tr>
						
						<tr>
							<td class="tableBodyMainTableImg">
								<img src="/img/circle.png">			
							</td>
							<td class="tableBodyMainTableText">
								건의사항
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="menuFooter">
			</div>
		</div>
		
	</div>
	<div class="wrapper">
		<div class="ihead">
			<div class="topBanner">
				<table class="topBannerTable">
					<tr>
						<td class="bannerIcon">
							 <img id="menuBtn" src="/img/menu-button.png" onclick="clickMenuBtn()">
						</td>
						<td class="mainLogo">
							<%=location.getName() %>
						</td>
						<%if(isAdmin){
							%>
							<td class="rightParentIcon">
								<img  id="addIcon" src="/img/add.png" onclick="clickAddIcon(event)">
							</td>
							<%	
						} %>
						<td class="rightParentIcon">
							<img src="/img/calendar_check.png" id="" class="" onclick="calendarCheck(event)">
						</td>
						<td class="rightParentIcon">
							<img src="/img/refresh-button.png" id="calendarRefresh" class="calendarRefresh" onclick="calendarRefresh(event)">
						</td>
						<td class="rightParentIcon">
							<img src="/img/magnifier.png" id="calendarIcon" class="calendarIcon" onclick="clickCalendarIcon(event)">
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="weddingIframeDiv">
			<iframe id="weddingIframe">
					
			</iframe>
		</div>
		<div class="ibody">
			<div class="selectorBody">
			</div>
			
			<div class="iframeDiv">
				<iframe id="calendarIframe">
					
				</iframe>
			</div>
		</div>
		
		<div class="ifooter">
		</div>
		
	</div>
</body>
</html>
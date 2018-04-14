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
	ArrayList<Location> locations = (ArrayList<Location>)request.getAttribute("locations");
	ArrayList<String> thisWeek = (ArrayList<String>)request.getAttribute("thisWeek");
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
	padding:5%;
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
	z-index:90;
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
.positionTitleMessage{
	font-size:25pt;
}
/* location position */
</style>
</head>
<body>
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
							Another  Day
						</td>
						<td class="calendarIcon">
							<a href="/CalendarParent"><img src="/img/calendar.png"></a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="ibody">
			<div class="thisWeekNoticeCaption">This Week Notice</div>
			<div class="locationIssueListDiv">
				<%for(Location location : locations){
					for(LocationIssue locationIssue : location.getLocationIssues()) {
						%>
							<div class="locationIssueName">
								<%=location.getName() %>
							</div>
							<div class="locationIssueObj">
								<div class="locationIssueListTitle">
									<%=locationIssue.getTitle() %>
								</div>
								<div class="locationIssueListText">
									<%=locationIssue.getText() %>
								</div>
							</div>
						<%
					}
				} %>
			</div>

			<div class="locationPositionDiv">
				<%for(Location location : locations){
						for(String currentDate : thisWeek){
							ArrayList<LocationPosition> currentDateLocationPosition = new ArrayList<LocationPosition>(); 
							for(LocationPosition locationPosition :location.getLocationPositions()){
								if(location.getLocation_number() == locationPosition.getLocation_number() &&
										locationPosition.getWork_date().equals(currentDate+"0000")){
									
									currentDateLocationPosition.add(locationPosition);
								}
							}
							
							if(currentDateLocationPosition.size()>0){
								%>
								<div class="locationPositionDetailDiv">
									<div class="positionTitleMessage">
										<%
											Date currentMyDate = MyDate.changeStringToDate(currentDate+"0000");
										%>
										<%=location.getName() %>
										<%=currentDate.substring(0,4) %> /
										<%=currentDate.substring(4,6) %> /
										<%=currentDate.substring(6,8) %> 
										<%
										String currentDay = "";
										switch(currentMyDate.getDay()){
										case 1:
											currentDay ="(일)";
											break;
										case 2:
											currentDay ="(월)";
											break;
										case 3:
											currentDay ="(화)";
											break;
										case 4:
											currentDay ="(수)";
											break;
										case 5:
											currentDay ="(목)";
											break;
										case 6:
											currentDay ="(금)";
											break;
										case 0:
											currentDay ="(토)";
											break;
										}
										%>
										<%=currentDay %>
									</div>
									<div>
									<%
									//for(LocationPosition locationPosition : currentDateLocationPosition){
										%>
											<table class="locationPositionTable" cellspacing=0>
												<thead class="locationPositionTableHead">
													<tr>
														<td style="width:14%;border-left:0px solid white;">
															
														</td>
														<%
														
														int hall_name_td = 85/location.getHalls().size();
														int index = 1;
														for(Hall hall : location.getHalls()){
															String border = "";
															if(index==location.getHalls().size()){
																border="border-right:0px solid white;";
															}
															%>
																<td style="<%=border%>text-align:center;width:<%=hall_name_td%>%">
																	<%=hall.getName() %>
																</td>
															<%
															index++;
														} %>
													</tr>
												</thead>
												<tbody>
													<%
														ArrayList<String> positionTitleList = new ArrayList<String>();
														positionTitleList.add("진행");
														positionTitleList.add("스캔");
														positionTitleList.add("예도");
														positionTitleList.add("2부");
														positionTitleList.add("안내");
														
													%>
													<%for(String positionTitle : positionTitleList){
														%>
														<tr>
															<td style="text-align:center;border-left:0px solid white;">
																<%=positionTitle %>
															</td>
															<%
															int hallIndex = 0;
															for(Hall hall : location.getHalls()){
																hallIndex++;
																String border = "";
																if(hallIndex==location.getHalls().size()){
																	border="border-right:0px solid white;";
																}
																%>
																	<td style="<%=border%>text-align:center;;width:<%=hall_name_td%>%">
																	<% for(LocationPosition locationPosition : currentDateLocationPosition){%>
																		<%if(locationPosition.getHall_number()==hall.getHall_number() && 
																				locationPosition.getTitle().equals(positionTitle)){
																			%>
																				<div>
																					<%=locationPosition.getUser().getName() %>
																				</div>
																			<%																			
																			} 
																		
																		}%>
																	</td>
																<%
															} %>
														</tr>
														<%
													} %>
													
												</tbody>
											</table>
											
										<%
									//}
									%>
									</div>
								<div>	
								<%
							}
							%>
								
							<%
						}
				} %>
			</div>
		</div>
		
		<div class="ifooter">
		</div>
		
	</div>
</body>
</html>
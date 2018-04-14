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
	ArrayList<UserLocation> userLocations = (ArrayList<UserLocation>)request.getAttribute("userLocations");
	User user = (User)request.getAttribute("user");
	String user_id = (String)request.getSession().getAttribute("user_id");
	String work_date = (String)request.getAttribute("work_date");
	Location location = (Location)request.getAttribute("location");
	ArrayList<Hall> halls = location.getHalls();
	int location_number = location.getLocation_number();
	boolean isAdmin = (boolean)request.getAttribute("isAdmin");
	ArrayList<Wedding> weddings = (ArrayList<Wedding>)request.getAttribute("weddings");
	
	String focus = (String)request.getAttribute("focus");
	
	Map<String,Wedding> weddingMap = new HashMap<String,Wedding>();
	for(Wedding wedding : weddings){
		weddingMap.put(wedding.getHall_number()+"_"+wedding.getWork_date(),wedding);
	}
	
	//3개 
	ArrayList<String> colors = new ArrayList<String>();
	
	colors.add("#d99694");
	colors.add("#c3d69b");
	colors.add("#b3a2c7");
	
	//Position
	ArrayList<LocationPosition> locationPositions = (ArrayList<LocationPosition>)request.getAttribute("locationPositions");
	ArrayList<UserWorkDate> userWorkDates = (ArrayList<UserWorkDate>)request.getAttribute("userWorkDates");
	
	//LocationCheck , confirm
	ArrayList<LocationCheck> locationChecks = (ArrayList<LocationCheck>)request.getAttribute("locationChecks");
	ArrayList<LocationCheckConfirm> locationCheckConfirms = (ArrayList<LocationCheckConfirm>)request.getAttribute("locationCheckConfirms");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/js/jQueryRotate_v_2_3.js"></script>
<title>Insert title here</title>
<script>
var user_id = '<%=user_id%>';
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

function setFocus(){
	<%if(focus!=null){
		%>
		focusMenu(<%=focus%>);
		<%
	}%>
	
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


</script>
<script>
function refreshPage(){
	location.reload();
}

function focusMenu(number){
	var issue = $('.issue');
	var position = $('.position');
	var wedding = $('.wedding');
	var chat = $('.chat');
	var check = $('.check');
	var selectorDiv = $('.selectorDiv');
	
	
	
	selectorDiv.css("background-color","white");
	
	
	issue.fadeOut(200);
	position.fadeOut(200);
	wedding.fadeOut(200);
	chat.fadeOut(200);
	check.fadeOut(200);
	
	var chatIconDiv = $('#chatIconDiv');
	var positionIconDiv = $('#positionIconDiv');
	var weddingIconDiv = $('#weddingIconDiv');
	var issueIconDiv = $('#issueIconDiv'); 
	var checkIconDiv = $('#checkIconDiv');
	
	setTimeout(function(){
		switch(number){
		case 1 :
			issueIconDiv.css("background-color","#eeeeee");
			issue.fadeIn(200);
			break;
		case 2:
			weddingIconDiv.css("background-color","#eeeeee");
			wedding.fadeIn(200);
			break;
		case 3:
			positionIconDiv.css("background-color","#eeeeee");
			position.fadeIn(200);
			break;
		case 4:
			chatIconDiv.css("background-color","#eeeeee");
			chat.fadeIn(200);
			break;
		case 5:
			checkIconDiv.css("background-color","#eeeeee");
			check.fadeIn(200);
			break;
		}
	},250);
}


function clickSelectIcon(number,event){
	var target = $(event.target);
	if(target.attr("class")=="selectorIcon"){
		target = target.parent();
	}
	var issue = $('.issue');
	var position = $('.position');
	var wedding = $('.wedding');
	var chat = $('.chat');
	var check = $('.check')
	var selectorDiv = $('.selectorDiv');
	
	selectorDiv.css("background-color","white");
	
	target.animate({opacity:0.3},200);
	target.animate({opacity:1.0},400);
	target.css("background-color","#eeeeee");
	
	issue.fadeOut(200);
	position.fadeOut(200);
	wedding.fadeOut(200);
	chat.fadeOut(200);
	check.fadeOut(200);
	
	setTimeout(function(){
		switch(number){
		case 1 :
			issue.fadeIn(200);
			break;
		case 2:
			wedding.fadeIn(200);
			break;
		case 3:
			position.fadeIn(200);
			break;
		case 4:
			chat.fadeIn(200);
			break;
		case 5:
			check.fadeIn(200);
			break;
		}
	},250);
}

function closeIframe(){
	parent.closeWeddingRedirect();
}

var clickUserWorkDateTarget = null;

function clickUserWorkDateDelete(event){
	var target=$(event.target);
	var iframe = $('#positionAddOrDeleteIframe');
	var src = "/ControllLocationPosition?";
	
	if(clickUserWorkDateTarget == null){
		var isDelete = confirm("are u sure delete?");
		if(isDelete) {
			target.remove();
			
			var name = target.attr("name");
			var user_id = target.attr("user_id");
			var title = target.attr("title");
			var work_date = "<%=work_date%>";
			var hall_number = target.attr("hall_number");
			
			src = src+"user_id="+user_id+"&work_date="+work_date+"&title="+title+"&method=delete&location_number=<%=location_number%>&hall_number="+hall_number;			
			iframe.attr("src",src);
		}
	}
	
}

function clickUserWorkDateIn(event){
	var target = $(event.target);
	var currentClassName = target.attr("class");
	var iframe = $('#positionAddOrDeleteIframe');
	var src = "/ControllLocationPosition?";
	
	//alert(target);
	if(currentClassName == "workDateNameListTd"){
		
	}else{
		target = target.parent();
	}
		
	if(clickUserWorkDateTarget!=null){
		//+" "+"<div>"+$(clickUserWorkDateTarget).attr("name")+"</div>"
		//title="clickUserWorkDateTarget" user_id="clickUserWorkDateTarget">
		var name = clickUserWorkDateTarget.attr("name");
		var user_id = clickUserWorkDateTarget.attr("user_id");
		var title = target.attr("title");
		var work_date = "<%=work_date%>";
		var hall_number = target.attr("hall_number");
		
		target.append("<div hall_number='"+hall_number+"' name='"+name+"' user_id='"+user_id+"' title='"+title+"' onclick='clickUserWorkDateDelete(event)' class='userWorkDateNameDivInline'>"+clickUserWorkDateTarget.attr("name")+"</div>");
		src = src+"user_id="+user_id+"&work_date="+work_date+"&title="+title+"&method=add&location_number=<%=location_number%>"+"&hall_number="+hall_number;
		iframe.attr("src",src)
	}
}

function clickUserWorkDateList(event){
	var target = $(event.target);
	
	if(clickUserWorkDateTarget == null){
		clickUserWorkDateTarget = target;
		
		target.css("color","#abcdef");
		target.css("font-weight","bold");	
	}else{
		if(target.attr("user_id") == clickUserWorkDateTarget.attr("user_id")){
			clickUserWorkDateTarget.css("color","black");
			clickUserWorkDateTarget.css("font-weight","normal");
			clickUserWorkDateTarget = null;
		}
		else{
			clickUserWorkDateTarget.css("color","black");
			clickUserWorkDateTarget.css("font-weight","normal");
			
			clickUserWorkDateTarget = target;
			target.css("color","#abcdef");
			target.css("font-weight","bold");
		}
	}
}

function deleteLocationIssue(event , issue_number){
	
	var src="/ControllerLocationIssue";
	var controllLocationIssueForm = $('#controllLocationIssueForm');
	var controllLocationIssueIssueNumber = $('#controllLocationIssueIssueNumber');
	
	controllLocationIssueIssueNumber.val(issue_number);
	controllLocationIssueForm.submit();
}

function closeClendarWeddingDetail(){
	var iframe = $('#weddingDetailIframe');
	if(iframe.css("display")=="none"){
	}else{
		iframe.fadeOut(400);
		iframe.attr("src","");
	}
}

function clickCalendarWeddingDetail(event,wedding_number){
	var target = $(event.target);
	var targetClass = target.attr("class");
	if(targetClass == "weddingTitleSpan"){
		target = target.parent();
	}
	
	var iframe = $('#weddingDetailIframe');
	if(iframe.css("display")=="none"){
		iframe.fadeIn(400);
		iframe.attr("src","/CalendarWeddingDetail?wedding_number="+wedding_number);
	}else{
		iframe.fadeOut(400);
		iframe.attr("src","");
	}
	
}


function clickLocationCheckBtn(check_number){
	var form = $('#controllLocationCheck');
	var inputCheck = $('#controllLocationCheckNumber');
	
	inputCheck.val(check_number);
	form.submit();
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
	width:100%;
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
.currentDate{
	text-align:center;
	padding:1%;
}
.absolutePosition{
	position:absolute;
}
.weddingCloseBtn{
}
/*selector*/
.selector{
	padding:1%;
	margin:1%;
}
.selectorDiv{
	padding:1%;
	margin-left:2%;
	margin-right:2%;
	padding-left:4%;
	padding-right:4%;
	border-radius:100px;
}
.selectorIcon {
	width:100px;
	height:auto;
	padding-left:2%;
	padding-right:2%;
	text-align:center;
}

.issue{

}

.wedding{
	display:none;
}

.position{
	display:none;
}
.chat{
	display:none;
}
.check{
	display:none;
}
/*selector*/

/* issue */
.issueHeader{
	text-align:center;
	color:white;
	background-color:#abcdef;
}
.issueTitle{
	text-align:center;
	
}
.issueText{
	padding:5%;
	font-size:25pt;
}
.issueEach{
	border:2px dashed #e2e2e2;
	margin:10px;
}
.issueFotter{
	border:2px solid #e2e2e2;
	padding:10px;
	margin:10px;
}
.issueAddTitle{
	text-align:center;
}

#addIssueInputTitle{
	width:90%;
	font-size:40pt;
	margin:2%;
	margin-left:5%;
	margin-right:5%;
	border:2px solid #abcdef;
	outline:0px solid white;
}
#addIssueInputText{
	font-size:30pt;
	width:90%;
	height:400px;
	margin:2%;
	margin-left:5%;
	margin-right:5%;
	border:2px solid #abcdef;
	outline:0px solid white;
}
#addIssueInputSubmit{
	font-size:40pt;
	width:96%;
	font-size:30pt;
	margin:2%;
	background-color:#abcdef;
	border:0px solid black;
}
/* issue */

/* wedding */
.weddingLeftSide{
	font-size:25pt;
	padding-right:30px;
	margin-top:40px;
	text-align:center;
}
.weddingRightSide{
	margin-top:55px;
	margin-left:20px;
}
.weddingTime{
	height:70px;
	margin-top:30px;
	border-top:1px solid white;
}
.weddingInfoDiv{
	border-top:1px solid black;
	width:100%;
	height:100px;
	font-size:22pt;
}
.weddingHallName{
	margin:1%;
	text-align:center;
	width:30%;
	float:left;
	height:55px;
	background-color:#eeeeee;
	border-radius:100px;
}
.weddingHallNameDiv{
	margin:1%;
	margin-left:20%;
	width:78%;
}
.weddingDetailDiv{
	margin-top:5px;
	margin-left:1%;
	margin-right:2%;
	width:30%;
	height:65px;
	float:left;
	text-align:center;
	border-radius:100px;
	vertical-align:text-bottom;
	padding-top:25px;
}
.weddingTitleSpan{
	vertical-align:text-bottom;
	
}
#weddingDetailIframe{
	display:none;
	width:98%;
	height:80vh;
	position:absolute;
	background-color:white;
	border:2px solid black;
}
/* wedding */

/* chat */
.chat{
	width:99%;
}
.chatInput{
	position:absolute;
	height:100px;
}
.chatDiv{
	padding-top:100px;
}
.chatMessage{
	width:75%;
	padding:5px;
	font-size:40pt;
	border:2px solid #eeeeee;
	
}
.chatSubmit{
	font-size:40pt;
	background-color:white;
	border:2px solid #eeeeee;
}
/* chat */

/* location position */
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
.workUserListDiv{
	font-soze:25pt;
	padding:3%;
}
.workUserListTitle{
	margin-left:20px;
	padding-left:20px;
	padding-right:20px;
	background-color:white;
	font-size:30pt;
	position:absolute;
}
.workUserListTable{
	padding:20px;
	width:100%;
	margin-top:30px;
	padding-top:20px;
	border:3px solid #eeeeee;
}
.workUserListTable td{
	text-align:center;
}
.userWorkDateNameDivInline{
	display: inline-block;
	padding-left:1%;
	padding-right:1%;
	width:45%;
}

/* location position */

/* check */
.check{
	width:99%;
}
.hallCheckListTitle{
	font-size:35pt;
	padding:10px;
}

.checkIcon{
	width:70px;
	text-align:cetner;
}

.locationCheckTable{
	width:100%;
	padding-top:10px;
	padding-bottom:10px;
}
.locationCheckTable td{
	padding-top:10px;
	padding-bottom:10px;
}
/* check */
</style>

</head>
<body>
	<div class="wrapper">
		<div class="absolutePosition">
			<img class="weddingCloseBtn" onclick="closeIframe()" src="/img/close.png">
		</div>
		<div class="ihead">
			<div class="currentDate">
				<%=Integer.parseInt(work_date.substring(0,4)) %> .
				<%=Integer.parseInt(work_date.substring(4,6)) %> .
				<%=Integer.parseInt(work_date.substring(6,8)) %>
			</div>
			<div class="selector">
				<div id="issueIconDiv" onclick="clickSelectIcon(1,event)" class="selectorDiv" style="float:left;background-color:#eeeeee;">
					<img class="selectorIcon" src="/img/warning.png">
				</div>
				<div id="weddingIconDiv" onclick="clickSelectIcon(2,event)"  class="selectorDiv" style="float:left;">
					<img class="selectorIcon" src="/img/parents.png">
				</div>
				<div id="positionIconDiv" onclick="clickSelectIcon(3,event)" class="selectorDiv" style="float:left;">
					<img class="selectorIcon" src="/img/teamwork.png">
				</div>
				<!-- 
				<div id="chatIconDiv" onclick="clickSelectIcon(4,event)" class="selectorDiv" style="float:left;">
					<img class="selectorIcon" src="/img/support.png">
				</div>
				 -->
				<div id="checkIconDiv" onclick="clickSelectIcon(5,event)" class="selectorDiv" style="float:left;">
					<img class="selectorIcon" src="/img/clipboards (1).png">
				</div>
				<div style="clear:both;"></div>
			</div> 
		</div>
		
		<div class="ibody">
		
			<!-- issue -->
			<div class="issue">
				<div class="issueHeader">
					대표님 말씀
				</div>
				<div class="issueBody">
					<form id="controllLocationIssueForm" action="/ControllerLocationIssue" method="post" style="display:none;">
						<input type="text" value="<%=work_date %>" style="display:none" name="work_date">
						<input type="text" value="<%=location_number %>" style="display:none" name="location_number">
						<input type="text" value="delete" name="method" style="display:none">
						<input type="text" id="controllLocationIssueIssueNumber" name="issue_number">
					</form>
					<%for(LocationIssue locationIssue : location.getLocationIssues()){
						%>
							<div class="issueEach">
								<%
								if(isAdmin){
									%>
										<img src="/img/delete.png" style="position:absolute;" onclick="deleteLocationIssue(event,<%=locationIssue.getIssue_number()%>)">
									<%
								}
								%>
								<div class="issueTitle">
									<%=locationIssue.getTitle() %>
								</div>
								<div class="issueText">
									<%=locationIssue.getText() %>
								</div>
							</div>
						<%						
					} %>
				</div>
				<%if(isAdmin){
					%>
						<div class="issueFotter">
							<div class="issueAddTitle">
								추가하기
							</div>
							<div>
								<form action="/ControllerLocationIssue" method="post">
									<input type="text" name="method" value="add" style="display:none">
									<input type="text" name="location_number" style="display:none;" value="<%=location_number%>">
									<input type="text" name="work_date" style="display:none;" value="<%=work_date%>">
									<div>
										<input id="addIssueInputTitle" type="text" name="title" placeholder="제목을 입력해주세요" >
									</div>
									<div>
										<textarea id="addIssueInputText" name="text" placeholder="내용을 입력해주세요 "></textarea>
									</div>
									<div>
										<input id="addIssueInputSubmit" type="submit" value="올리기">
									</div>
								</form>
							</div>
						</div>
					<%	
				} %>
				
			</div>
			<!-- issue -->
			
			<!-- wedding -->
			<div class="wedding">
				<iframe id="weddingDetailIframe">
				</iframe>
				<div class="weddingHallNameDiv">
					<%
					int hallIndex = 0;
					for(Hall hall :halls){
							%>
								<div style="background-color:<%=colors.get(hallIndex) %>" class="weddingHallName">
									<%=hall.getNickname() %>
								</div>
							<%
							hallIndex++;
					} %>
					<div style="clear:both;"></div>
				</div>
				<div style="float:left;width:20%;">
					<div class="weddingLeftSide">
						<%for(int i = 10; i < 23 ; i ++){
							%>
								<div class="weddingTime"><%=i %>:00</div>
								<div class="weddingTime"><%=i %>:30</div>
							<%
						} %>
					</div>
				</div>
				<div style="float:left;width:75%;">
					<div class="weddingRightSide">
						<%String work_year_minth_day = work_date.substring(0,8); %>
						<%for(int i = 10; i < 23 ; i ++){
							String currentDateTime = work_year_minth_day+i;
							%>
								<div class="weddingInfoDiv">
								<%
									hallIndex = 0;
									%>
									<%for(Hall hall : halls){
										%>
												<%
												Wedding getWeddingMap = weddingMap.get(hall.getHall_number()+"_"+currentDateTime+"00");
												if(getWeddingMap!=null){
													
													%>
														<div onclick="clickCalendarWeddingDetail(event,<%=getWeddingMap.getWedding_number() %>)" style="background-color:<%=colors.get(hallIndex) %>" class="weddingDetailDiv">
															<span class="weddingTitleSpan" disabled><%=getWeddingMap.getTitle() %></span>
													<%	
												}else{
													%>
														<div class="weddingDetailDiv"> 
													<%
												}
												%>
											</div>
										<%
										hallIndex++;
									} %>
									<div style="clear:both;"></div>
								</div>
								<div class="weddingInfoDiv">
									<%
									hallIndex = 0;
									%>
									<%for(Hall hall : halls){
										%>
											
												<%
												Wedding getWeddingMap = weddingMap.get(hall.getHall_number()+"_"+currentDateTime+"30");
												if(getWeddingMap!=null){
													
													%>
														<div onclick="clickCalendarWeddingDetail(event,<%=getWeddingMap.getWedding_number() %>)" style="background-color:<%=colors.get(hallIndex) %>" class="weddingDetailDiv">
															<span  class="weddingTitleSpan" disabled><%=getWeddingMap.getTitle() %></span>
													<%	
												}else{
													%>
														<div class="weddingDetailDiv"> 
													<%
												}
												%>
											</div>
										<%
										hallIndex++;
									} %>
									<div style="clear:both;"></div>
								</div>
							<%
						} %>
					</div>
				</div>
				<div style="clear:both;"></div>
			</div>
			<!-- wedding -->

			<div class="position">
				<iframe id="positionAddOrDeleteIframe" style="display:none">
				
				</iframe>
				<table class="locationPositionTable" cellspacing=0>
					<thead class="locationPositionTableHead">
						<tr>
							<td style="width: 14%; border-left: 0px solid white;"></td>
								<%
									int hall_name_td = 85 / location.getHalls().size();
									int index = 1;
									for (Hall hall : location.getHalls()) {
										String border = "";
										if (index == location.getHalls().size()) {
											border = "border-right:0px solid white;";
										}
								%>
								<td	style="<%=border%>text-align:center;width:<%=hall_name_td%>%">
									<%=hall.getName()%>
								</td>
								<%
									index++;
								}
							%>
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
						<%
							for (String positionTitle : positionTitleList) {
						%>
							<tr>
								<td style="padding:5px;text-align: center; border-left: 0px solid white;">
									<%=positionTitle%>
								</td>
								<%
									hallIndex = 0;
										for (Hall hall : location.getHalls()) {
											hallIndex++;
											String border = "";
											if (hallIndex == location.getHalls().size()) {
												border = "border-right:0px solid white;";
											}
								%>
								<td
									class="workDateNameListTd" 
									onclick="clickUserWorkDateIn(event)"
									title="<%=positionTitle %>" hall_number="<%=hall.getHall_number() %>" location_number="<%=location_number %>"
									style="<%=border%>text-align:center;;width:<%=hall_name_td%>%">
									<%
										for(LocationPosition locationPosition : locationPositions){
											
										
										if (locationPosition.getHall_number() == hall.getHall_number()
											&& locationPosition.getTitle().equals(positionTitle)) {
											%>
											<!-- 
											target.append
											("<div hall_number='"+hall_number+"' 
											name='"+name+"' 
											user_id='"+user_id+"' 
											title='"+title+"' 
											onclick='clickUserWorkDateDelete(event)'
											 class='userWorkDateNameDivInline'>"+clickUserWorkDateTarget.attr("name")+"</div>");
											 -->
											<div
											class="userWorkDateNameDivInline" 
											onclick='clickUserWorkDateDelete(event)'
											name="<%=locationPosition.getUser().getName() %>"
											hall_number="<%=locationPosition.getHall_number() %>"
											title="<%=positionTitle%>" user_id="<%=locationPosition.getUser_id()%>">
												<%=
													locationPosition.getUser().getName()
												%>
											</div> 
											<%
											}
										}
								 	}
								 %>
								</td>
								<%
									//}
								%>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<%
					if(isAdmin){
						%>
							<div>
								<div class="workUserListDiv">
									<div class="workUserListTitle" style="color:#abcdef">
										출근 가능하신분
									</div> 
									
									<table class="workUserListTable">
									<%
									int indexUserWork = 0;
									for(UserWorkDate userWorkDate : userWorkDates){
										if(userWorkDate.getStatus()==1){
											String trEnd = "";
											if(indexUserWork%4==0){
												trEnd="</tr>";
												%>
												<tr>
												<%
											}
											%>
												<td onclick="clickUserWorkDateList(event)" user_id="<%=userWorkDate.getUser_id()%>" name="<%=userWorkDate.getUser().getName() %>">
													<%=userWorkDate.getUser().getName() %>
												</td>
												<%=trEnd %>
											<%
										}
										indexUserWork++;
									} %>
									</table>
								</div>
								<div class="workUserListDiv">
									<div class="workUserListTitle" style="color:yellow">
										물음표
									</div>
									
									<%
									ArrayList<User> idontknowUser = new ArrayList<User>();
									
									for(UserLocation userLocation : location.getUserLocations()){
										boolean isInUser = true;
										for(UserWorkDate userWorkDate : userWorkDates){
											if(userLocation.getUser_id().equals(userWorkDate.getUser_id())){
												isInUser = false;
											}
										}
										if(isInUser){
											idontknowUser.add(userLocation.getUser());
										}
									}
									
									
									%>
									<table class="workUserListTable">
										<tr>
									<%
									indexUserWork = 0;
									for(User dontKnowUser :idontknowUser){
										String trEnd = "";
										if(indexUserWork%4 == 0){
											%>
											</tr>
											<tr>
											<%
										}
										%>
										<td onclick="clickUserWorkDateList(event)" user_id="<%=dontKnowUser.getUser_id()%>" name="<%=dontKnowUser.getName() %>">
											<%=dontKnowUser.getName() %>
										</td>
										<%
										indexUserWork++;
									}
									%>
										</tr>
									</table>
								</div>
								<div class="workUserListDiv">
									<div class="workUserListTitle" style="color:red;">
										출근 불가
									</div>
									
									<table class="workUserListTable">
									<%
									indexUserWork = 0;
									for(UserWorkDate userWorkDate : userWorkDates){
										if(userWorkDate.getStatus()==-1){
											String trEnd = "";
											if(indexUserWork%4==0){
												trEnd="</tr>";
												%>
												<tr>
												<%
											}
											%>
												<td onclick="clickUserWorkDateList(event)" user_id="<%=userWorkDate.getUser_id()%>" name="<%=userWorkDate.getUser().getName() %>">
													<%=userWorkDate.getUser().getName() %>
												</td>
												<%=trEnd %>
											<%
										}
										indexUserWork++;
									} %>
									</table>
								</div>
							</div>
						<%
					}
					%>
				</div>
				
				<div class="chat">
					<div class="chatInput">
						<form method="post" action="/Main2AddLocationChat">
							<input style="display:none" type="text" name="location_number" value="<%=location_number%>">
							<input style="display:none" type="text" name="work_date" value="<%=work_date%>">
							
							<input type="text" placeholder="input" class="chatMessage" name="message">
							<input type="submit" class="chatSubmit" value="보내기">
						</form>
					</div>
					<div class="chatDiv">
					<%
						for(LocationChat chat : location.getLocationChats()){
							%>
								<div class="chatDetail">
									<%=chat.getUser().getName()%> : <%=chat.getText() %>	
								</div>
							<%
						}
					%>
					</div>
				</div>
				<div class="check">
					<form action="/ControllLocationCheck" method="post" id="controllLocationCheck" style="display:none;">
						<input style="display:none;" type="text" name="location_number" value="<%=location_number%>">
						<input style="display:none;" type="text" name="work_date" value="<%=work_date%>">
						<input style="display:none;" type="text" name="method" value="change">
						<input style="display:none;" name="check_number" id="controllLocationCheckNumber">
					</form>
					
					<div class="checkTitle">
						체크 리스트
					</div>
					<div>
						<%for(Hall hall : halls){
							%>
								<div class="hallCheckListTitle">
									[ <%=hall.getName() %> 체크리스트 ]
								</div>
								<table class="locationCheckTable">
									<%for(LocationCheck locationCheck : locationChecks){
										if(locationCheck.getHall_number() == hall.getHall_number()){
											boolean isCheck = false;
											User cnofirmUser = null;
											
											for(LocationCheckConfirm locationCheckConfirm : locationCheckConfirms){
												if(locationCheck.getCheck_number() == locationCheckConfirm.getCheck_number()){
													isCheck = true;
													cnofirmUser = locationCheckConfirm.getUser();
													break;
												}
											}
											
											if(isCheck){
												%>
													<tr>
														<td class="checkIcon">
															<img src="/img/checked.png">
														</td>
														<td>
															<div>
																<%=locationCheck.getText() %> - <%=cnofirmUser.getName() %>
															</div>
														</td>
													</tr>
												<%
											}else{
												%>
													<tr>
														<td class="checkIcon">
															<img src="/img/check-box-empty.png" onclick="clickLocationCheckBtn('<%=locationCheck.getCheck_number()%>')">
														</td>
														<td>
															<div>
																<%=locationCheck.getText() %>
															</div>
														</td>
													</tr>
												<%
											}
											%>
										<%
										}
									} %>
									
								</table>
							<%
						} %>
					</div>
				</div>
			</div>
		</div>
		<div class="ifooter">
		</div>
	</div>
</body>
</html>

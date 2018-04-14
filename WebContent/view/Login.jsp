<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
//init
$(document).ready(function(){
	init();
});
function init(){
	
}
//init
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
	padding:5%;
	margin:0px;
	width:90%;
}
.ibody{
	padding:5%;
	margin:0px;
	width:90%;
}
.ifooter{
	padding:5%;
	margin:0px;
	width:90%;
}

/*init*/
</style>
<style>
input{
	outline:0px solid white;
	border: 0px solid white;
}

.formTable{
	padding:5%;
	padding-left:10%;
	padding-right:10%;
	width:100%;
}
.formTableTd{
	width:70%;
}


.formTableChild1{
	width:100%;
}
.inputTitle{
	width:15%;
	text-align:right;
	border-bottom:3px solid #abcdef;
	
}
.inputText{
	padding:30px;
	padding-bottom:10px;
	border-bottom:3px solid #abcdef;
}
.inputText input{
	width:90%;
	height:70px;
	padding:10px;
	font-size:1em;
}
.inputSubmit{
	margin-left:18%;
	width:80%;
	height:270px;
	background-color:#abcdef;
	font-size:1em;
}



.otherTable{
	width:100%;
	padding:5%;
	padding-left:10%;
	padding-right:10%;
}
.otherTable td{
	border-bottom:3px solid #abcdef;
	padding:10px;
	padding-top:3%;
	padding-bottom:3%;
	text-align:center;
}
.submitDiv{
	text-align:center;
	padding:5%;
	padding-left:10%;
	padding-right:10%;
}
.submitDiv input{
	width:100%;
	height:70px;
	font-size:1em;
	border:3px solid #e2e2e2;
	background-color:white;
}



.ibodyHeader{
	text-align:center;
}
.ibodyHeader img{
	width:50%;
	border:3px solid #e2e2e2;
	border-radius:500px;
}

.Msg{
	color:red;
	font-size:20pt;
	padding-left:15%;
	padding-right:10%;
	
}
</style>
</head>
<body >
	<div class="wrapper" style="-moz-user-select: none;">
		<div class="ihead">
			<div class="iheadLogo">
				img-2
			</div>
		</div>
		<div class="ibody">
			<div class="ibodyHeader">
				<img src="/img/mainLogo.png">
			</div>
			<div class="ibodyBody" >
				
				<form action="/Login" method="post">
					<table class="formTable">
						<tr>
							<td class="formTableTd" >
								<table cellspacing=0 class="formTableChild1">
									<tr>	
										<td class="inputTitle">
											ID
										</td>
										<td class="inputText">
											<input type="text" name="user_id" required>
										</td>
									</tr>
									<tr>
										<td style="font-size:35pt;" class="inputTitle">
											PW
										</td>
										<td class="inputText">
											<input type="password" name="user_pw" required>
										</td>
									</tr>
								</table>
							</td>
							<td class="formTableTd">
								<input class="inputSubmit" type="submit" value="login">
							</td>
						</tr>
					</table>
				</form>
				
				<div class="Msg">
					${msg }	
				</div>
				<table class="otherTable" >
					<tr>
						<td>
							회원가입
						</td>
						<td style="width:50px;border:0px solid white;"><!-- gab --></td>
						<td>
							채용정보
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="ifooter">
			<div>
			
			</div>
		</div>
	</div>
</body>
</html>
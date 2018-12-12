<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body
{
background-image:url(/Multi_Party/resources/images/login.jpg); 
background-size:100%;
}
.profile_pic img
{
width:100px;
height:100px;
border:8px solid white;
border-radius:3px;
position:absolute;
top:125px;
left:525px;
}
input[type=text]
{
position:absolute;
top:220px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
background-color:lavender;
}
input[type=email]
{
position:absolute;
top:260px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
background-color:lavender;
}
input[type=file]
{
position:absolute;
top:380px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
background-color:lavender;
color:blue;
}
#p1
{
position:absolute;
top:300px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
background-color:lavender;
}
#p2
{
position:absolute;
top:340px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
background-color:lavender;
}
.bu
{
position:absolute;
top:420px;
left:460px;
width:250px;
height:25px;
border:2px solid skyblue;
border-radius:2px;
background:linear-gradient(blue,skyblue);
color:white;
}
.buu
{
position:absolute;
top:460px;
left:460px;
width:250px;
height:25px;
border:2px solid skyblue;
border-radius:2px;
background:linear-gradient(blue,skyblue);
color:white;
}
h3
{
color:white;
position:absolute;
top:70px;
left:450px;
font-size:50px;
text-shadow:1px 1px 1px black,2px 2px 2px black,3px 3px 3px black,4px 4px 4px black;
}
</style>
</head>
<body>
<div class="profile_pic">
<!-- <img alt="" src="/Multi_Party/resources/images/bac.jpg"> -->
</div>
<h3>Registration</h3>
<form action="User_Register.htm" method="post" enctype="multipart/form-data">
<input type="text" name="name" placeholder="username" required="required">
<input type="email" name="email" placeholder="mail" required="required">
<input id="p1" type="password" name="password" placeholder="password" required="required">
<input id="p2" type="password" name="cpass" placeholder="confirm password" required="required">
<input type="file" name="file">
<input class="bu"  type="submit" value="Register">
</form>
<a href="User_Login_Controller"><button class="buu">Login</button></a>
</body>
</html>
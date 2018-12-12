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
top:185px;
left:525px;
}
input[type=email]
{
position:absolute;
top:320px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
}
.bu
{
position:absolute;
top:356px;
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
top:386px;
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
position:absolute;
top:400px;
left:500px;
}
</style>
</head>
<body>
<div class="profile_pic">
<img alt="" src="/Multi_Party/resources/images/sig.png">
</div>
<form action="User_Login_email.htm" method="post">
<input type="email" name="email" placeholder="enter your email" required="required">
<input class="bu"  type="submit" value="next">
</form>
<a href="User_Register.jsp"><button class="buu">Register</button></a>
<h3 style="color:white">${result}</h3>
</body>
</html>
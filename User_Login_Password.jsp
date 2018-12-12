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
input[type=password]
{
position:absolute;
top:345px;
left:460px;
width:250px;
height:23px;
border:2px solid skyblue;
border-radius:2px;
}
.bu
{
position:absolute;
top:381px;
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
top:411px;
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
top:290px;
left:527px;
text-shadow:1px 1px 1px black,2px 2px 2px black,3px 3px 3px black,4px 4px 4px black;
}
h4
{
position:absolute;
top:425px;
left:520px;
}
</style>
</head>
<body>
<div class="profile_pic">
<img alt="" src="/Multi_Party/resources/Profile_Picture/<%=session.getAttribute("pic")%>">
<h3 style="color:white">${user}</h3>
</div>
<form action="User_Password_check?user=${user}" method="post">
<input type="password" name="password" placeholder="enter your password" required="required">
<input class="bu"  type="submit" value="Login">
</form>
<a href="User_Register.jsp"><button class="buu">Register</button></a>
<%if(session.getAttribute("inc") !=null) {%>
<h4 style="color:white"><%=session.getAttribute("inc") %></h4>
<%}%>
</body>
</html>
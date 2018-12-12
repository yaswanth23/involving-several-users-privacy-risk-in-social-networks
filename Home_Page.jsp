<%@page import="pojo.User_About_Bean"%>
<%@page import="controller.Controller"%>
<%@page import="pojo.*"%>
<%@page import="dao.Controller_DAO"%>
<%@page import="java.sql.Connection" %>  
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %>  
<%@page import="java.sql.Connection" %>  
<%@page import="java.sql.DriverManager" %>    
<%@page import="java.util.*"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="images/icon/Aha-Soft-3d-Social-Online-writing.ico">
<title>Home_Page</title>
<style type="text/css">
body
{
/*  background-image:url('images/bg-image/bac.jpg');  */
background-size:1600px 1400px;
padding:380px;
background-color:lightgrey;
}
.menu_bar
{
background:-webkit-linear-gradient(white,slateblue);
background:-moz-linear-gradient(white,slateblue);
background:-o-linear-gradient(white,slateblue);
padding:15px;
border-radius:5px;
position:absolute;
top:25px;
left:10px;
width:96.5%;
}
.menu_bar a
{
text-decoration:none;
font-size:23px;
padding:30px;
color:white;
}
.menu_bar a:hover
{
text-decoration:none;
font-size:23px;
padding:-30px;
color:blue;
}
.profile_picture
{
position:absolute;
top:110px;
left:80px;
width:200px;
height:200px;
border-radius:250px;
border:3px solid white;
}
.profile_upload1
{
position:absolute;
width:198px;
top:330px;
left:80px;
border:2px solid white;
color:white;
}
.profile_upload2
{
position:absolute;
top:370px;
left:80px;
width:200px;
border:2px solid white;
border-radius:3px;
background:linear-gradient(grey,white);
}
.cover_picture
{
border-radius:3px;
position:absolute;
top:5px;
left:5px;
width:99.3%;
height:350px;
}
.cover_form
{
background-color:white;
padding:20px;
position:absolute;
top:360px;
left:5px;
width:95.5%;
}
.cover1
{
position:relative;
left:750px;
}
.cover2
{
position:relative;
left:760px;
}
.Set_Cover_Pic
{
font-size:20px;
position:absolute;
top:-10px;
left:400px;
}
.about_tag
{
background-color:Slateblue;
font-size:20px;
padding:3px;
color:white;
position:absolute;
top:463px;
left:10px;
width:48%;
border-radius:5px;
}
.group_tag
{
background-color:Slateblue;
font-size:20px;
padding:3px;
color:white;
position:absolute;
top:463px;
left:760px;
width:48%;
border-radius:5px;
}
.about_body
{
background-color:lavender;
border-radius:5px;
padding:50px;
position:absolute;
top:532px;
left:10px;
width:624px;
height:180px;
color:Indigo;
font-size:22px;
}
.group_body
{
background-color:lavender;
border-radius:5px;
padding:50px;
position:absolute;
top:72px;
width:624px;
height:180px;
color:blue;
font-size:22px;
}
.up
{
position:absolute;
top:23px;
left:200px;
text-decoration:none;
color:white;
}
.group_body a
{
text-decoration:none;
padding:30px;
}
.left
{
width:300px; 
height:710px;
background-color:white;
position:absolute;
top:430px;
left:5px;
border-radius:3px;
}
.center
{
width:603px; 
height:500px;
background-color:white;
position:absolute;
top:640px;
left:310px;
border-radius:3px;
}
.right
{
width:300px; 
height:710px;
background-color:white;
position:absolute;
top:430px;
left:918px;
border-radius:3px;
}
.center_up
{
position:absolute;
top:430px;
left:310px;
background-color:white;
width:603px;
height:100px;
}
.center_up textarea
{
position:absolute;
top:5px;
left:3px;
height:63px;
width:590px;
border-radius:3px;
}
.center_up input
{
position:absolute;
top:77px;
left:550px;
border-radius:3px;
background:linear-gradient(grey,white);
}
.center_down 
{
position:absolute;
top:535px;
left:310px;
background-color:white;
width:603px;
height:100px;
}
.center_down h3
{
font-family:inherit;
}
.center_down input[type=file]
{
position:relative;
left:3px;
border-radius:3px;
border:2px solid grey;
width:545px;
}
.center_down input[type=submit]
{
position:relative;
left:3px;
border-radius:3px;
background:linear-gradient(grey,white);
}
.center img
{
border-radius:3px;
}
.left a
{
text-decoration:none;
position:absolute;
top:24px;
left:100px;
color:white;
}
.cover_form
{
background:linear-gradient(black,grey);
border-radius:5px;
}
.cover_form a
{
position:relative;
left:500px;
padding:50px;
text-decoration:none;
color:white;
}
.cover_form a:hover
{
position:relative;
left:500px;
padding:50px;
text-decoration:none;
color:yellow;
font-size:15px;
}
</style>
</head>
<body>
<%
String name=session.getAttribute("user").toString();
session.setAttribute("user",name);
session.setAttribute("Sender",name);
Controller_DAO dao=Controller.connect();
List list=dao.user_post_all(name);
String profile=dao.User_Profile(name);
List about=dao.about_user_select(name);
Iterator post_it=list.iterator();
Iterator about_it=about.iterator();
List sell=dao.select_all_user_from_register(name);
Iterator sell_all=sell.iterator();
%>

<img class="cover_picture" alt="" src="/Multi_Party/resources/images/login.jpg">

<div class="cover_form">
<a href="Request_Image.jsp?user=<%=name%>">Image Requests</a>
<a href="Response_Image.jsp?user=<%=name%>">Image Inbox</a>
<a href="Logout">Logout</a>
</div>


<%if(profile==null) {%>
<img class="profile_picture" alt="" src="/Multi_Party/resources/images/sig.png">
<%} 
else{%>
<img class="profile_picture" alt="" src="/Multi_Party/resources/images/sig.png">
<img class="profile_picture" alt="" src="/Multi_Party/resources/Profile_Picture/<%=profile%>">
<%} %>

<form action="Profile_pic_Upload" method="post" enctype="multipart/form-data">
<input class="profile_upload1" type="file" name="profile" required="required">
<input class="profile_upload2" type="submit" value="Upload">
</form>


<div class="left">
<div style="color:white;background-color:grey;padding:2px;border-radius:3px;">
<h4>ABOUT</h4>
<a href="Update_Profile.jsp?user=<%=name%>">Update My Profile</a>
</div>
<table>
<%while(about_it.hasNext()){ %>
<%User_About_Bean bean=(User_About_Bean)about_it.next();%>
<%if(bean.getLive()!=null){ %>
<tr>
<td>
<img alt="" src="/Multi_Party/resources/about/home.png">&nbsp;&nbsp;&nbsp;Lives in <%=bean.getLive() %>
<hr style="width:293px;">
</td>
</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td>
<img alt="" src="/Multi_Party/resources/about/study.png">&nbsp;&nbsp;&nbsp;Graduate from <%=bean.getStudy() %>
<hr style="width:293px;">
</td>
</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td>
<img alt="" src="/Multi_Party/resources/about/work.png">&nbsp;&nbsp;&nbsp;Working in <%=bean.getWorking() %>
<hr style="width:293px;">
</td>
</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td>
<img alt="" src="/Multi_Party/resources/about/location.png">&nbsp;&nbsp;&nbsp;From <%=bean.getUser_from() %>
<hr style="width:293px;">
</td>
</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr>
<td>
<img alt="" src="/Multi_Party/resources/about/rel.png">&nbsp;&nbsp;&nbsp;Relationship <%=bean.getRel() %>
<hr style="width:293px;">
</td>
</tr>
<tr>

</tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<tr></tr>
<%} }%>
</table>
<td>
</td>
</div>
<%session.setAttribute("user",name);%>
<div class="center_up">
<form action="User_Post_Text" method="post">
<%-- <input type="hidden" name="user" value="<%=name%>"> --%>
<textarea rows="" cols="" name="content" placeholder="What's on your mind?" required="required"></textarea>
<input type="submit" value="Post">
</form>
</div>

<div class="center_down">
<h3>Post on your Timeline:</h3>
<form action="User_Post_Image" method="post" enctype="multipart/form-data">
<input type="file" name="file" required="required">
<input type="submit" value="Post">
</form>
</div>


<div  class="center" style="overflow-y:scroll;">
<%while(post_it.hasNext())
{%>
<%User_Post_Text_Bean d=(User_Post_Text_Bean)post_it.next(); %>	
<span style="color:brown;"><%=d.getDate()%></span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:brown"><%=d.getTime()%></sapn>
<%if(d.getContent().endsWith(".jpg")||d.getContent().endsWith(".png")||d.getContent().endsWith(".gif")) {%>
<br>
<span style="color:green"><%=d.getUser()%> posted on TimeLine :
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<img style="width:500px;height:300px;" alt="" src="/Multi_Party/resources/images/<%=d.getContent()%>">
<%}else{ %>
<br>
<span style="color:green"><%=d.getUser()%></sapn>:&nbsp;&nbsp;<span style="color:green"><%=d.getContent()%></sapn>
<%} %>
<br>
<hr>
<%}%>
</div>


<div class="right">
<table style="color:green" style="overflow-y:scroll;">
<%while(sell_all.hasNext()){ %>
<%User_Register_Bean bean=(User_Register_Bean)sell_all.next(); %>
<tr>
<td>
<img style="border-radius:250px;width:50px;height:50px;" alt="" src="/Multi_Party/resources/Profile_Picture/<%="enc.png"%>">
</td>
<td>
<a href="Home_Page_none.jsp?name=<%=bean.getName()%>"><%=bean.getEmail()%></a>
</td>
</tr>
<%} %>
</table>
</div>

</body>
</html>
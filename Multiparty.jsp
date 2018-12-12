<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
h1
{
color:white;
font-size:50px;
font-style:italic;
font-family:serif;
text-shadow:1px 1px 1px black,2px 2px 2px black,3px 3px 3px black,4px 4px 4px black,5px 5px 5px black,6px 6px 6px black;
}
h3
{
color:white;
font-size:30px;
font-style:italic;
font-family:serif;
text-shadow:1px 1px 1px black,2px 2px 2px black,3px 3px 3px black,4px 4px 4px black,5px 5px 5px black,6px 6px 6px black;
}
body
{
background-image:url(/Multi_Party/resources/images/bac.jpg);
background-size:100%;
}
.title h1
{
position:absolute;
top:170px;
left:80px;
}
.title h3
{
position:absolute;
top:250px;
left:280px;
}
.button
{
position:absolute;
top:360px;
left:220px;
background-color:#e65c00;
width:150px;
height:40px;
border:3px solid white;
border-radius:25px;
color:white;
}
.button:hover
{
font-size:12px;
position:absolute;
top:360px;
left:220px;
background-color:green;
width:150px;
height:40px;
border:3px solid white;
border-radius:25px;
color:white;
}
.button2
{
position:absolute;
top:360px;
left:380px;
background-color:#e65c00;
width:150px;
height:40px;
border:3px solid white;
border-radius:25px;
color:white;
}
.button2:hover
{
font-size:12px;
position:absolute;
top:360px;
left:380px;
background-color:red;
width:150px;
height:40px;
border:3px solid white;
border-radius:25px;
color:white;
}
</style>
<script type="text/javascript">
function logout()
{
window.close();
}
</script>
<title>Multi_Party</title>
</head>
<body>
<div class="title">
<h1>Resolving Multi-party Privacy</h1>
<h3>Conflicts in Social Media</h3>
</div>
<a href="Main_Page.htm"><button class="button">continue</button></a>
<a href=""><button onclick="logout()" class="button2">exit</button></a>
</body>
</html>
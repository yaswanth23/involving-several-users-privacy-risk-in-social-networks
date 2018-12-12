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
background:linear-gradient(orange,grey);
width:800px;
height:550px;
}
.tab
{
position:absolute;
top:180px;
left:430px;
}
h4
{
position:absolute;
top:100px;
left:470px;
}
</style>
</head>
<body>
<%session.setAttribute("hello",request.getParameter("user")); %>
<h4 style="color:white">Update Your Profile</h4>
<form action="Update_My_Profile" method="post">
<table class="tab">
<tr>
<td>
<label>Working</label>
</td>
<td>
<input type="text" name="working">
</td>
</tr>
<tr>
<td>
<label>Graduate</label>
</td>
<td>
<input type="text" name="study">
</td>
</tr>
<tr>
<td>
<label>From</label>
</td>
<td>
<input type="text" name="from">
</td>
</tr>
<tr>
<td>
<label>Living</label>
</td>
<td>
<input type="text" name="live">
</td>
</tr>
<tr>
<td>
<label>Relationship</label>
</td>
<td>
<input type="text" name="rel">
</td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" value="Update">
</td>
</tr>
</table>
</form>
</body>
</html>
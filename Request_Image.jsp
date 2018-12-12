<%@page import="pojo.User_About_Bean"%>
<%@page import="controller.Controller"%>
<%@page import="pojo.*"%>
<%@page import="dao.Controller_DAO"%>
<%@page import="java.sql.Connection" %>  
<%@page import="java.sql.PreparedStatement" %> 
<%@page import="java.sql.ResultSet" %>  
<%@page import="java.sql.Connection" %>  
<%@page import="java.sql.DriverManager" %>    
<%@page import="java.util.*" %>   
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
background:linear-gradient(limegreen,grey);
height:580px;
background-attachment:fixed;
}
.tab
{
position:relative;
top:10px;
left:430px;
}
</style>
</head>
<body>
<%Controller_DAO dao=Controller.connect();%>
<%
String name=request.getParameter("user");
List list=dao.select_request(name);
Iterator it =list.iterator();
%>

<%while(it.hasNext()){%>
<%User_Image_Request bean=(User_Image_Request)it.next();%>

<table class="tab">
<tr>
<td>
<img style="border-radius:250px;;width:100px;height:100px;"  alt="" src="/Multi_Party/resources/images/<%=bean.getImage()%>">
</td>
<td>
<%=bean.getSender() %>
</td>
<td>
<a style="text-decoration:none" href="Response_Image?key=<%=bean.getKey()%>&sender=<%=bean.getSender()%>&receiver=<%=bean.getReceiver()%>&image=<%=bean.getImage()%>&id=<%=bean.getId()%>"><button>send</button></a>
</td>
</tr>
</table>
<%} %>
</body>
</html>
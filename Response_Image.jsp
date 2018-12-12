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
List list=dao.select_response(name);
Iterator it =list.iterator();
%>

<%while(it.hasNext()){%>
<%User_Response_Bean bean=(User_Response_Bean)it.next();%>

<table class="tab" style="overflow-y:scroll">
<tr>
<td>
<span style="color:white">Response From :<%=bean.getReceiver()%></span>
</td>
</tr>
<tr>
<td>
<img style="border-radius:3px;width:250px;height:200px;"  alt="" src="/Multi_Party/resources/images/<%=bean.getImage()%>" readonly>
</td>
<td>
<%-- <p style="color:white;background:linear-gradient(red,grey);"><%=bean.getKey() %></p> --%>
<%-- <a style="text-decoration:none" href="Response_Image?key=<%=bean.getKey()%>&sender=<%=bean.getSender()%>&receiver=<%=bean.getReceiver()%>&image=<%=bean.getImage()%>&id=<%=bean.getId()%>"><button>send</button></a> --%>
</td>
</tr>
</table>
<%} %>
</body>
</html>
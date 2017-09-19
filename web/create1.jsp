<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.awt.*" %>
<%@page import="query1.*" %>
<%
    
try
        
 {   
if (request.getParameter("submit") != null)
       {
String user_id=request.getParameter("uid");
//String uid1=request.getParameter("uid");
String pwd=request.getParameter("psw");
session.setAttribute("user_id",user_id);
session.setAttribute("pwd",pwd);


boolean status=false;
NewClass q=new NewClass();
ResultSet rs=q.get_data("select user_id,pwd from login where user_id='"+ user_id+"' and pwd='"+pwd+"'");
status=rs.next();
char ch = user_id.charAt(0);
if(status&&(ch=='h'))
    response.sendRedirect("hod_pg.jsp");
else if(status&&(ch=='b'))
{
    %>
    <html>
    <head>
        <title>Registered page</title>
    </head> 
    <body style='background: linear-gradient(to right,bisque,teal)'>
        <form name="myform" method="post" action="logindemo.jsp">
        <h1><b>Welcome <% out.println(user_id); %>!!! You have logged in successfully</b></h1>
        <p>Now you can fill the Leave Application Form </p>
        <p>To fill the Leave Form: </p>
        <input type="hidden" value="<%=user_id%>" name="uid4">
        <input type="submit" value="click" name="click"/>
        </form>
    </body>
    </html>
    <%
}
   // response.sendRedirect("wlcmp.jsp");
else if(status&&(ch=='w'))
    response.sendRedirect("warden.jsp");                   
else if(status&&(ch=='v'))
    response.sendRedirect("vof.jsp");
    else
    response.sendRedirect("wlcmp.jsp");

 }
       }
catch(Exception e)
{e.printStackTrace();
}


%>


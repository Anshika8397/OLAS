<%-- 
    Document   : logout
    Created on : Mar 26, 2017, 10:21:54 PM
    Author     : we
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>

     <body style='background: linear-gradient(to right,lightcyan,white)'>
        <%
             session.invalidate();
         %>
         <h1> YOU ARE SUCESSFULLY LOGGED OUT......
         </h1>
         <a href="login.jsp">Again Login</a><br>
         <a href="homepage.jsp">Home Page</a>
    </body>   
</html>

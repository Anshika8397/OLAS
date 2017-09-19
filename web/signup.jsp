<jsp:include page="header.jsp" ></jsp:include>
    <%@page import="query1.NewClass"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
    <head>
      
        <title>Online Leave Application System</title>

    </head>
   <body style='background: linear-gradient(to right,lightcyan,white)'>
         <a href="homepage.jsp">Home Page</a>
        <form name="myform" method="get" action="create2.jsp" >
        <h1 align="center"><b>SIGN UP</b></h1>
        <center>
        <table>
            <tr>
                <th>Full Name</th>
                <td><input type="text" name="fname" value="" size="30%" /></td>
                </tr>
                 <tr>
                <th>Contact no</th>
                <td><input type="text" name="mob no" value="" size="30%" /></td>
                 </tr>
                 <tr>
                <th>Email Id</th>
                <td><input type="email" name="email id" value="" size="30%" /></td>
                </tr>
                 <tr>
                <th>User Id</th>
                <td><input type="text" name="uid" value="" size="30%" /></td>
                </tr>
                 <tr>
                <th>Password</th>
                <td><input type="password" name="pwd" value="" size="30%" /></td>
                </tr>
                 <tr>
                <th>Re-enter Password</th>
                <td><input type="password" name="re_pwd" value="" size="30%" /></td>
                </tr>
                <tr>
                <th colspan="2"><input type="submit" value="OK" name="btnok" /></th>
                </tr>         
        </table>
        </center>
    </body>
</html>

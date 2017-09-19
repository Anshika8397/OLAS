<%-- 
    Document   : flaghod
    Created on : Mar 1, 2017, 12:57:54 PM
    Author     : we
--%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="query1.*" %>
<%
    try        
 {  
     if (request.getParameter("submit") != null)
       {
     NewClass q=new NewClass();      
String str= request.getParameter("idno");
String str1= request.getParameter("roll2");
String str2= request.getParameter("days");
//ResultSet rs=q.get_data("select sid,sname from appform where sid='"+str+"' and flags =0");
//while(rs.next())
//{
    String q1="Update appform Set flags=2,d_to='"+str1+"',no_of_days="+str2+" where sid='"+str+"' and flags=1"; 
int s=q.delete_data(q1);
out.println(s);
if(s>0)
{
  //  out.println("success");
    response.sendRedirect("hodgrant.jsp");
      }
else
{
    response.sendRedirect("invalid_id.jsp");
}
       }
       }
     catch(Exception e)
{e.printStackTrace();
}
    %>
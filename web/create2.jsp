<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="query1.*" %>
<%
    try
{
    if (request.getParameter("btnok") != null)
       {
           String user_id=request.getParameter("uid");
            String pwd=request.getParameter("pwd");
     String repwd=request.getParameter("re_pwd");
NewClass q=new NewClass();
char ch = user_id.charAt(0);

if((ch=='h') &&(  pwd.equals(repwd)) )
{
       String query="insert into login(user_id, pwd) values('"+user_id+"','"+pwd+"')";
int s=q.insert_data(query);

if(s>0)
{
    out.println("success");
   response.sendRedirect("registered.jsp");
      }
else

    response.sendRedirect("pwdinvalid.jsp");
}
else if((ch=='b')&&( pwd.equals(repwd)))
{
       String query="insert into login(user_id, pwd) values('"+user_id+"','"+pwd+"')";
int s=q.insert_data(query);

if(s>0)
{
    out.println("success");
    response.sendRedirect("registered.jsp");
      }
else

    response.sendRedirect("pwdinvalid.jsp");
}
else if((ch=='w') &&( pwd.equals(repwd)))
{
   String query="insert into login (user_id, pwd) values('"+user_id+"','"+pwd+"')";
int s=q.insert_data(query);

if(s>0)
{
    out.println("success");
    response.sendRedirect("registered.jsp");
      }
else

    response.sendRedirect("pwdinvalid.jsp");
}
else if((ch=='v') &&(  pwd.equals(repwd)))
{
       String query="insert into login (user_id, pwd) values('"+user_id+"','"+pwd+"')";
int s=q.insert_data(query);

if(s>0)
{
    out.println("success");
    response.sendRedirect("registered.jsp");
      }
else

    response.sendRedirect("pwdinvalid.jsp");

  }
else

    response.sendRedirect("signup.jsp");

}
}
catch(Exception e)
{
    e.printStackTrace();
 }
        
        %>   
    
    



<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%@page import="java.sql.*" %>
<%@page import="query1.*" %>
<jsp:include page="header.jsp" ></jsp:include>
    
<%if(session.getAttribute("pwd")!=null)
{
%>
<html>
    <head>
        <title>Online Leave Application System</title>
    <script type="text/javascript">
            
            function popup(mylink, windowname)
            {
                if(!window.focus)
                {
                    return true;
                }
                var href;
                if(typeof(mylink)=='string')
                    href=mylink;
                else
                    href=mylink.href;
                window.open(href, windowname, 'width=400, height=200, scrollbars=no');
                return false;
            }
            </script>
    </head>
    <body style='background: linear-gradient(to right,lightcyan,white)'> 
        
       <form name="myform" method="post" action="vof.jsp">
           <center>
             <h1 ><b>VERIFYING OFFICER</b></h1><br>
             <a href="logout.jsp">Logout</a>
              <h5 ><a href="homepage.jsp">Home Page</a></h5>
              </center>
            <br><br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    
<input type="text" placeholder="Student_ID" name="search_id" />
<input type="text" placeholder="Date From" name="d1" />
<input type="text" placeholder="Date To" name="d2" />
<input type="submit"  value="Leave Verified" name="btn12"/> 
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit"  value="Notification" name="noti"/><br><br><br> 
 &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="text" placeholder="Student_ID" name="search_id1" /> 
<input type="text" placeholder="Date From" name="d11" />
<input type="text" placeholder="Date To" name="d12" />             
<input type="submit"  value="Special Case" name="btn2"/>
      
         &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
     <input type="text" placeholder="stud_id" name="search_id4" />      
     <input type="submit"  value="Get Mail" name="mail1"/>
         &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
      &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="vofmail.jsp" onclick="return popup(this,'hello')">Send mail</a> <br><br><hr><br><br>
      
      <center>
<%
     try        
 {  
     if (request.getParameter("btn12") != null)
       {
     NewClass q=new NewClass();      
String str= request.getParameter("search_id");
String date_frm=request.getParameter("d1");
String date_to=request.getParameter("d2");

    
    String q1="Update appform Set flags=1 where sid='"+str+"' and d_frm='"+date_frm+"'"; 
int s=q.delete_data(q1);
 String qur="insert into leave_desc(user_id,d_frm,d_to_p) values('"+str+"','"+date_frm+"','"+date_to+"')";
     int s1=q.insert_data(qur);
     //out.println(date_frm);
//out.println(s1);
if(s>0)
{
    out.println("success");
    response.sendRedirect("vof.jsp");
}
else
{
    response.sendRedirect("invalid_id.jsp");
}
}
    else if (request.getParameter("btn2") != null)
       {
     NewClass q=new NewClass();      

String date_frm=request.getParameter("d11");
String date_to=request.getParameter("d12");
String str1= request.getParameter("search_id1");
//ResultSet rs=q.get_data("select sid,sname from appform where sid='"+str+"' and flags =0");
//while(rs.next())
//{
    String q1="Update appform Set flags=7 where sid='"+str1+"' and d_frm='"+date_frm+"'"; 
int s=q.delete_data(q1);
 String qur="insert into leave_desc(user_id,d_frm,d_to_p) values('"+str1+"','"+date_frm+"','"+date_to+"')";
     int s1=q.insert_data(qur);
//out.println(s);
if(s>0)
{
  //  out.println("success");
    response.sendRedirect("vof.jsp");
      }
else
{
    response.sendRedirect("invalid_id.jsp");
}

}
    else if(request.getParameter("noti") != null)    
 {   
//boolean status=false;
NewClass q=new NewClass();
int flag=0;
ResultSet rs=q.get_data("select * from appform where flags ="+flag+"");
out.println("<html><body>");
    out.print("<table border='1'>");
    out.println("<tr><th colspan='4'>Notification Table</th></tr>");
    out.println("<tr><th>Student Id</th><th>Student Name</th><th>Date From</th><th>Date To</th></tr>");
while(rs.next())
{
    
   out.println("<tr><td>"+rs.getString(1)+"</td>");
   out.println("\t"+"<td>"+rs.getString(2)+"</td>");
   out.println("\t"+"<td>"+rs.getString(7)+"</td>");
      out.print("\t"+"<td>"+rs.getString(8)+"</td></tr>");
  
}
 out.println("</table></body> </html>");    
    }
    
     else if(request.getParameter("mail1") != null)
{
    Connection conn=null;
        Statement stat=null;
        ResultSet rs=null; 
          Class.forName("com.mysql.jdbc.Driver");    //driver for MySQL
	 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/olas","root","root");

       stat=conn.createStatement();
        
String str=request.getParameter("search_id4");
       //String str="BTBTI12342";
String q="select * from master_stud where user_id='"+str+"'";
        rs=stat.executeQuery(q);
     //out.println(str);
	while(rs.next())
	{
out.println("<html><body>");
    out.print("<table border='1'>");
    out.println("<tr><th>Mail Table</th></tr>"); 
   out.println("<tr><td>"+rs.getString(9)+"</td></tr>");
}  
     rs.close();
     stat.close();
        conn.close(); 
 }
    
 }
catch(Exception e)
{e.printStackTrace();
}
%>
</center>
       </body>
       
       </html>
       
<%}
%>
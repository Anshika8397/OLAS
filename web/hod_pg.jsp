<%@page import="javax.mail.Transport"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="query1.*" %>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<%if(session.getAttribute("user_id")!=null)
{%>
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
         <form name="myform" method="post" action="hod_pg.jsp" >
  <%--  <body style='background: linear-gradient(to right,bisque,teal)'> --%>
        
    <center>
        <table border="0">      
         <h1 style="alignment-center"><b>Head Of Department</b></h1><br>
         <a href="logout.jsp">Log Out</a> <br><br>
              <h5 style="alignment-left"><a href="homepage.jsp">Home Page</a></h5>
            <br><br> 
           </center>
           
            
           <input type="submit"  value="Notification" name="noti"/> 
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     <input type="submit"  value="Special Case" name="btnspl"/>
           
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input type="text" placeholder="Student_ID" name="search_id3" /> 
        
<input type="submit"  value="Grant Leave" name="btnn"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="text" placeholder="Student_ID" name="search_id12" />  
 <input type="text" placeholder="Date From" name="d11" />

<input type="submit"  value="Discard Leave" name="btnn1"/><br><br><br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     
    <input type="text" placeholder="stud_id" name="search_id4" />      
 <input type="submit"  value="Get Mail" name="mail1"/> 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <a href="mail.jsp" onclick="return popup(this,'hello')">send mail</a>      <hr>
     <br><br><br>    
      </table>
     <%  
try
        
 {   
if (request.getParameter("noti") != null)
{
 NewClass q=new NewClass();   

int flag=1;
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
 
}
else if (request.getParameter("btnn1") != null)
       {
     NewClass q=new NewClass();      
String date_frm=request.getParameter("d11");

String str1= request.getParameter("search_id12");
//ResultSet rs=q.get_data("select sid,sname from appform where sid='"+str+"' and flags =0");
//while(rs.next())
//{
    String q1="Update appform Set flags=9 where sid='"+str1+"' and d_frm='"+date_frm+"'"; 
int s=q.delete_data(q1);
//out.println(s);
if(s>0)
{
  //  out.println("success");
    response.sendRedirect("hod_pg.jsp");
      }
else
{
    response.sendRedirect("invalid_id.jsp");
}

}
else if(request.getParameter("btnn") != null)
{
   
    Connection conn=null;
        Statement stat=null;
        ResultSet rs=null; 
          Class.forName("com.mysql.jdbc.Driver");    //driver for MySQL
	 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/olas","root","root");

       stat=conn.createStatement();
       // String date_frm=request.getParameter("d11");
String str=request.getParameter("search_id3");
       //String str="BTBTI12342";
String q="select * from appform where sid='"+str+"' and flags=1";
        rs=stat.executeQuery(q);
     //out.println(str);
	while(rs.next())
	{
            %>
	    <form name="myform" method="post" action="flaghod.jsp">
         <table border="0" height="100%" width="100%">
   <tr>
       <th align="center" colspan="7"><b>LEAVE APPLICATION FORM</b></th>
   </tr>
   <tr>
       <td><b>Roll no</b></td>
       <td colspan="3"><input type="text" name="roll"  size="20%" value="<%=rs.getInt(3)%>"/> </td>
       <td><b>Id no</b></td>
       <td colspan="3"> <input type="text" name="idno"  size="20%" value="<%=rs.getString(1)%>"/></td>
   </tr>
   <tr>
       <td colspan="2"><b>Student's Name</b></td>
       <td colspan="5"><input type="text" name="stuname"  size="60%" value="<%=rs.getString(2)%>"/></td>
       </tr>
       <tr>
         <td><b>Class</b></td>  
         <td colspan="3"> <input type="text" name="class"  size="40%" value="<%=rs.getString(4)%>"/></td>
         <td><b>Hostel Name</b></td>
         <td colspan="3"><input type="text" name="class"  size="40%" value="<%=rs.getString(5)%>"/></td>
       </tr>
       <tr>
           <td colspan="2"><b>Father's/Guardian's Name</b></td>
           <td colspan="5"><input type="text" name="fthrs"  size="50%" value="<%=rs.getString(6)%>"/></td>
           </tr>
           <tr>
               <td colspan="2"><b>Reason of Applying for Leave</b></td>
             <td colspan="6"><textarea name="reason" rows="1" cols="60"  ><%=rs.getString(11)%>
                   </textarea></td>
               </tr>
               <tr>
               <td colspan="2"><b>Date of going on Leave: (yyyy-mm-dd)</b></td>
               <td><b>From</b></td>
               <td><input type="date" name="roll1"  size="20%" value="<%=rs.getString(7)%>"/>
                         </td>
                
               <td><b>To</b></td>
               <td><input type="date" name="roll2"  size="20%" value="<%=rs.getString(8)%>"/></td>
                
               <td><b>Days</b></td>
               <td><input type="text" name="days"  size="20%" value="<%=rs.getString(9)%>"/></td>
               </tr>
               <tr>
                   <td colspan="2"><b>Whether the student is permitted to go alone</b></td>
                   <td><b>&nbsp Yes</b>&nbsp&nbsp<input type="radio" name="yes" value="<%=rs.getString(12)%>"/></td>
                   <td><b>&nbsp No</b>&nbsp&nbsp<input type="radio" name="yes" value="<%=rs.getString(12)%>"/></td>
                   </tr>
                   <tr>
                    <td colspan="3"><b>if no, the details of accompanying person</b></td>
                    <td> </td>
                   </tr>
                   <tr>
                       <td><b>1.Name</b></td>
                       <td colspan="3"><input type="text" name="acm_name"  size="30%" value="<%=rs.getString(13)%>"/></td>
                       <td><b>2.Relation with Student</b></td>
                     <td colspan="3"><input type="text" name="relation" size="30%" value="<%=rs.getString(14)%>"/></td>
                       </tr>
                       <tr>
                           <td><b>3.Address</b></td>
                      <td colspan="3"><input type="text" name="address2"  size="30%" value="<%=rs.getString(10)%>"/></td>
                           <td><b>Phone no</b></td>
                     <td colspan="3"><input type="text" name="mob_no"  size="30%" value="<%=rs.getString(15)%>"/></td>
                      </tr> 
                      <tr>
                    <td colspan="6" align="right">
                        
                        <input type="submit"  value="submit" name="submit"/>     
                    </td>
                </tr>
 </table>
     </form>   
<%
        }
     rs.close();
     stat.close();
        conn.close();  
} 

        else if (request.getParameter("submit") != null)
       {
     NewClass q3=new NewClass();      
String str3= request.getParameter("idno");
String str1= request.getParameter("roll2");
String str2= request.getParameter("days");
//ResultSet rs=q.get_data("select sid,sname from appform where sid='"+str+"' and flags =0");
//while(rs.next())
//{
    String q1="Update appform Set flags=2,d_to='"+str1+"',no_of_days="+str2+" where sid='"+str3+"'"; 
int s=q3.delete_data(q1);
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
   out.println("</table></body> </html>");
}  
     rs.close();
     stat.close();
        conn.close(); 
 }
else if(request.getParameter("btnspl") != null)
{
    NewClass q=new NewClass();
int flag=7;
ResultSet rs=q.get_data("select * from appform where flags ="+flag+"");
 out.println("<html><body>");
    out.print("<table border='1'>");
    out.println("<tr><th colspan='3'>Notification Table</th></tr>");
    out.println("<tr><th>Student Id</th><th>Student Name</th><th>Date From</th></tr>");
while(rs.next())
{
   
   out.println("<tr><td>"+rs.getString(1)+"</td>");
   out.println("\t"+"<td>"+rs.getString(2)+"</td>");
    out.print("\t"+"<td>"+rs.getString(7)+"</td></tr>");
   out.println("</table></body> </html>");
}
}

 }
catch(Exception e)
{e.printStackTrace();
}
 
%>
     
</form>

        </body>
</html>
 <% }%>
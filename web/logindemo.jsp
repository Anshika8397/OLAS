<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.awt.*" %>
<%@page import="query1.*" %>
<%
    
try
        
 {   
if (request.getParameter("click") != null)
       {
String user_id=request.getParameter("uid4");
//String uid1=request.getParameter("uid");

    %>
   
<html>
<head>
     <title>Online Leave Application System</title>
     </head>
 <body  style='background: linear-gradient(to right,turquoise,mistyrose)'>
      <a href="homepage.jsp">Home Page</a>
      
      <form name="myform" method="post" action="createform.jsp">
  <%
     
   
        Connection conn1=null;
        Statement stat1=null;
        ResultSet rs1=null; 
          Class.forName("com.mysql.jdbc.Driver");    //driver for MySQL
	 conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/olas","root","root");

       stat1=conn1.createStatement();
         String q1="select * from master_stud where user_id='"+ user_id+"'";

//String str=request.getParameter("search_id3");
       //String str="BTBTI12342";
//String q="select * from appform where sid='"+str+"'";
        rs1=stat1.executeQuery(q1);
     //out.println(str);
	while(rs1.next())
	{
            %>
	
         <table border="0" height="100%" width="100%">
   <tr>
       <th align="center" colspan="7"><b>LEAVE APPLICATION FORM</b></th>
   </tr>
   <tr>
       <td><b>Roll no</b></td>
       <td colspan="3"><input type="text" name="roll"  size="20%"/> </td>
       <td><b>Id no</b></td>
       <td colspan="3"> <input type="text" name="idno"  size="20%" value="<%=rs1.getString(3)%>"/></td>
   </tr>
   <tr>
       <td colspan="2"><b>Student's Name</b></td>
       <td colspan="5"><input type="text" name="stuname"  size="60%" value="<%=rs1.getString(2)%>"/></td>
       </tr>
       <tr>
         <td><b>Class</b></td>  
         <td colspan="3"> <input type="text" name="class"  size="40%" value="<%=rs1.getString(4)%>"/></td>
         <td><b>Hostel Name</b></td>
         <td colspan="3"><select name="hostel">
                 <option>Shri Shanta Puri</option>
                 <option>Shri Shanta Gram</option>
                 <option>Shri Shanta Vatika</option>
                 <option>Shri Shanta Vasti</option>
                 <option>Shri Shanta Vasam</option>
                 <option>Shri Shanta Nishantam</option>
             </select></td>
       </tr>
       <tr>
           <td colspan="2"><b>Father's/Guardian's Name</b></td>
           <td colspan="5"><input type="text" name="fthrs"  size="50%" value="<%=rs1.getString(6)%>"/></td>
           </tr>
           <tr>
               <td colspan="2"><b>Reason of Applying for Leave</b></td>
             <td colspan="6"><textarea name="reason" rows="1" cols="60"  ></textarea></td>
               </tr>
               <tr>
               <td colspan="2"><b>Date of going on Leave: (yyyy-mm-dd)</b></td>
               <td><b>From</b></td>
               <td><input type="date" name="roll1"  size="20%"/>
                         </td>
                
               <td><b>To</b></td>
               <td><input type="date" name="roll2"  size="20%" /></td>
                
               <td><b>Days</b></td>
               <td><input type="text" name="days"  size="20%" /></td>
               </tr>
               <tr>
                   <td colspan="2"><b>Whether the student is permitted to go alone</b></td>
                   <td><b>&nbsp Yes</b>&nbsp&nbsp<input type="radio" name="yes" /></td>
                   <td><b>&nbsp No</b>&nbsp&nbsp<input type="radio" name="yes" /></td>
                   </tr>
                   <tr>
                    <td colspan="3"><b>if no, the details of accompanying person</b></td>
                    <td> </td>
                   </tr>
                   <tr>
                       <td><b>1.Name</b></td>
                       <td colspan="3"><input type="text" name="acm_name"  size="30%" /></td>
                       <td><b>2.Relation with Student</b></td>
                     <td colspan="3"><input type="text" name="relation" size="30%" /></td>
                       </tr>
                       <tr>
                           <td><b>3.Address</b></td>
                      <td colspan="3"><input type="text" name="address2"  size="30%" /></td>
                           <td><b>Phone no</b></td>
                     <td colspan="3"><input type="text" name="mob_no"  size="30%" /></td>
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
     rs1.close();
     stat1.close();
        conn1.close();  
     

%>
 
  
     </body>
</html>


    <%
} 
 }
catch(Exception e)
{e.printStackTrace();
}


%>


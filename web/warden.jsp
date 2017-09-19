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
       <form name="myform" method="post" action="warden.jsp">
            <center> 
             <h1 style="alignment-center"><b>WARDEN</b></h1><br>
              <a href="logout.jsp">Logout</a> <br>
            <h5 style="alignment-left"><a href="homepage.jsp">Home Page</a></h5>
              </center>
            <br><br> 
           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit"  value="Notification" name="noti"/>  
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   
<input type="text" placeholder="Student_ID" name="search_id4" />     
<input type="submit"  value="Permit Leave" name="btn4"/>       
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
  <input type="text" placeholder="stud_id" name="search_id" />      
 <input type="submit"  value="Get Mail" name="mail1"/>  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;        
 <a href="wardenmail.jsp" onclick="return popup(this,'hello')">Send mail</a> <br><br><hr><br>
     <center>
     <%  
try
        
 {   
if (request.getParameter("noti") != null)
{
    
    
    NewClass q=new NewClass();
int flag=2;
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
  out.println("</table></body> </html>");
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
        
String str=request.getParameter("search_id");
//out.println(str);
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
else if (request.getParameter("btn4") != null)
       {
     NewClass q=new NewClass();      
String str= request.getParameter("search_id4");
//ResultSet rs=q.get_data("select sid,sname from appform where sid='"+str+"' and flags =0");
//while(rs.next())
//{
    String q1="Update appform Set flags=3 where sid='"+str+"' and flags=2"; 
int s=q.delete_data(q1);
out.println(s);
if(s>0)
{
  //  out.println("success");
    response.sendRedirect("wardenleave.jsp");
      }
else
{
    response.sendRedirect("invalid_id.jsp");
}

}    
    
 
else if(request.getParameter("btnmail") != null)
{
%>
    <html>
    <head>
        <title>Sending Mail Through JSP</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body style='background:yellow'>
        <form name="emailForm" action="warden.jsp" method="post">
            <table>
                <tr><td><b><font color="red">To:
                    </td>
                    <td><b><b><input type="text" name="mail" placeholder="Enter sender mail-id"/><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="red">Subject:
                    </td>
                    <td>
                        <input type="text" name="sub" value="regarding leave"><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="red">Message Text:
                    </td>
                    <td>
                        <textarea rows="12" cols="80" name="mess">The leave procedure has been completed and the leave has been
 granted to your ward.</textarea><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Send" name="btn1">
                    </td>
                    <td>
                        <input type="reset" value="Reset">
                    </td>
                </tr>
            </table>
            </form>
        </body>
</html>
<%   
if (request.getParameter("btn1") != null)
       {
    //Creating a result for getting status that messsage is delivered or not!
    String result;
    // Get recipient's email-ID, message & subject-line from index.html page
    final String to = request.getParameter("mail");
    final String subject = request.getParameter("sub");
    final String messg = request.getParameter("mess");
 
    // Sender's email ID and password needs to be mentioned
    final String from = "olas4bu@gmail.com";
    final String pass = "aaasaaas";
 
    // Defining the gmail host
    String host = "smtp.gmail.com";
 
    // Creating Properties object
    Properties props = new Properties();
 
    // Defining properties
    props.put("mail.smtp.ssl.enable","true");
    props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.user", from);
    props.put("mail.password", pass);
    props.put("mail.port", "587");
 
   /* props.put("mail.smtp.host", host);
    props.put("mail.transport.protocol", "smtp");
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
  //  props.put("mail.user", from);
   // props.put("mail.password", pass);
      props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
    props.put("mail.port", "587");*/
    // Authorized the Session object.
    Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(from, pass);
        }
    });
 
    try {
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                new InternetAddress(to));
        // Set Subject: header field
        message.setSubject(subject);
        // Now set the actual message
        message.setText(messg);
        // Send message
        Transport.send(message);
        result = "Your mail sent successfully....";
        out.println(result);
    } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send mail....";
   out.println(mex);
    out.println(result);}
           }
}



 }
catch(Exception e)
{e.printStackTrace();
}
 out.println("</table></body> </html>");
%>
</center>
</form>
       </body>
       </html>
<%}
%>
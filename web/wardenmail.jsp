<%-- 
    Document   : wardenmail
    Created on : Mar 31, 2017, 7:14:45 PM
    Author     : we
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Sending Mail Through JSP</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
     <body style='background: linear-gradient(to right,lightcyan,white)'> 
        <form name="emailForm" action="wardenmail.jsp" method="post">
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
                        <input type="text" name="sub" value='regarding leave'><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="red">Message Text:
                    </td>
                    <td>
                        <textarea rows="12" cols="80" name="mess">Congratulations! your ward's leave has been granted successfully.</textarea><br/>
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
  // out.println(mex);
    out.println(result);}
           }

%>



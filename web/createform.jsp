<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.awt.*" %>
<%@page import="query1.*" %>
<%
    int flags=0;
    try
{
    if (request.getParameter("submit") != null)
       {
            String srno=request.getParameter("roll");
String sid=request.getParameter("idno");
String sname=request.getParameter("stuname");
String class1=request.getParameter("class");
String hostel_name=request.getParameter("hostel");
String fthr_name=request.getParameter("fthrs");
String rsn_fr_leave=request.getParameter("reason");
String date_frm=request.getParameter("roll1");
//out.println(srno);
//out.println(request.getParameter("roll1"));

String date_to=request.getParameter("roll2");
//out.println(request.getParameter("roll2"));
String no_of_days=request.getParameter("days");
String whthr_stud_go_alone=request.getParameter("yes");
String acm_prsn=request.getParameter("acm_name");
String relation=request.getParameter("relation");
String address1=request.getParameter("address2");
String acm_ph_no=request.getParameter("mob_no");
NewClass q=new NewClass();
//String query3="select address,city from stud s,master_stud m where s.sid=m.user_id and s.sname=m.name and s.fthr_name=m.Father_name and s.class=m.class";
//
//if(query3!=null)
//{ 
  //  response.sendRedirect("vof.jsp");
//}
String query="insert into appform(sid,sname,srno,class,hostel_name,fthr_name,d_frm,d_to,no_of_days,address,rsn_fr_leave,whtr_stud_go_alone,acm_prsn,relation,acm_phno,flags) values('"+sid+"','"+sname+"',"+srno+",'"+class1+"','"+hostel_name+"','"+fthr_name+"','"+date_frm+"','"+date_to+"',"+no_of_days+",'"+address1+"' ,'"+rsn_fr_leave+"','"+whthr_stud_go_alone+"','"+acm_prsn+"','"+relation+"','"+acm_ph_no+"',"+flags+")";
//String query="insert into appform(sid,sname,srno,class,hostel_name,fthr_name) values('hgh','bchbcb',444,'gffghgh','gff','vbvhv')";
// String query1="insert into leave_desc values('"+sid+"','"+date_frm+"','"+date_to+"')";
//out.println(request.getParameter("roll2"));

       // out.println(sid+"\n");
//out.println(sname+"\n");
//out.println(srno+"\n");
//out.println(class1+"\n");
//out.println(hostel_name+"\n");
//out.println(fthr_name);
//int s1=q.insert_data(query1); 
int s=q.insert_data(query);
//out.println(s);
if(s>0)
{
 out.println("success");
    response.sendRedirect("Leaves.jsp");
      }

else

 response.sendRedirect("error.jsp");


       }
}
    
catch(Exception e)
{
    out.println(e);
    e.printStackTrace();
 }
        
        %>   
    
    



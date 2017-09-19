<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="query1.NewClass"%>
<jsp:include page="header.jsp" ></jsp:include>


<html>
    <head>
    <%-- <script type="text/javascript">
    function validation()
    {       
      window.open("vof.jsp",null,"height=100,width=100");
     }
   </script>--%>

</head>
    <body style='background: linear-gradient(to right,lightcyan,white)'>
         <a href="homepage.jsp">Home Page</a>
 <form name="myform" method="post" action="create1.jsp" >
            <center>
            <table>
                <tr>
                    <td>
                        User ID:
                    </td>
                    <td>
                        <input type="text" name="uid"  />
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <input type="password" name="psw"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        
                        <input type="submit"  value="submit" name="submit" onclick="return validation();"/>     
                    </td>
                </tr>
                <%-- <tr><td>
                    Forgot Password?
                    </td></tr>
                --%>
            </table>
            </center>            
        </form>
    </body>
</html>

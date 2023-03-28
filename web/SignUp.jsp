<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>
<%
try
{
    UUID uuid = UUID.randomUUID();
    String randomUUIDString = uuid.toString();
    ResultSet rs =null;
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminportal","root","root");
    Statement stmt=con.createStatement();
    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String pswd=request.getParameter("pswd");
    String user_type=request.getParameter("userType-radio");
    String email=request.getParameter("email");
    String mobno=request.getParameter("mobno");
    stmt.executeUpdate("insert into users values('"+randomUUIDString+"','"+fname+"','"+lname+"','"+pswd+"','"+user_type+"','"+email+"','"+mobno+"')");
//    response.sendRedirect("login.html");
    System.out.println(stmt);
    con.close();
    stmt.close();
}
catch(ClassNotFoundException e)
{
    out.println(e.getMessage());
} %>
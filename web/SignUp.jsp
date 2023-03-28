<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
try
{
ResultSet rs =null;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=    DriverManager.getConnection("jdbc:oracle:thin:@Crypto-pc:1521:XE","panda","piggy");
Statement stmt=con.createStatement();
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String pswd=request.getParameter("pswd");
String addr=request.getParameter("addr");
String email=request.getParameter("email");
String mobno=request.getParameter("mobno");
stmt.executeUpdate("insert into register values('"+fname+"','"+lname+"','"+pswd+"','"+addr+"','"+email+"','"+mobno+"')");
response.sendRedirect("login.html");
con.close();
stmt.close();
}
catch(ClassNotFoundException e)
{
out.println(e.getMessage());
} %>
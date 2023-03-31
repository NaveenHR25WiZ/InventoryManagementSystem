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
    String name=request.getParameter("name");
    String category=request.getParameter("category");
    String quantity=request.getParameter("quantity");
    String description=request.getParameter("description");

    stmt.executeUpdate("insert into products values('"+randomUUIDString+"','"+name+"','"+category+"','"+quantity+"','"+description+"')");
    response.sendRedirect("CreateProducts.html");
    
    con.close();
    stmt.close();
}
catch(ClassNotFoundException e)
{
    out.println(e.getMessage());
} %>
<%@page language="java" import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.UUID"%>
<%
try
{   
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminportal","root","root");
    String pswd=request.getParameter("pswd");
    String email=request.getParameter("email");
    
    boolean isValidUser = false;
    String fullName = null;
    
    PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
    stmt.setString(1, email);
    stmt.setString(2, pswd);
    ResultSet rs = stmt.executeQuery();
    
    if (rs.next()) {
      isValidUser = true;
      fullName = rs.getString("f_name") + " " + rs.getString("l_name");
    }    
   
    con.close();
    stmt.close();
  
    if (isValidUser) {
        // If login is successful, store user information in session and redirect to home page
        HttpSession sessionUpdate = request.getSession();
        sessionUpdate.setAttribute("email", email);
        sessionUpdate.setAttribute("fullName", fullName);
        response.sendRedirect("../Dashboard/Dashboard.html");
    } else {
        // If login fails, set an error message in the request and forward to login page
        request.setAttribute("errorMessage", "Invalid Email or Password");
        RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
        dispatcher.forward(request, response);
  }
}
catch(ClassNotFoundException e)
{
    out.println(e.getMessage());
} %>
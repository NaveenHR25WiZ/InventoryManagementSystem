<%-- JSP code --%>
<html>
<head>
    <title>Populate Drop-Down List Example</title>
</head>
<body>
    <select name="myList">
        <%-- Java code --%>
        <% 
            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Connect to the database
                String url = "jdbc:mysql://localhost/mydatabase";
                String username = "myuser";
                String password = "mypassword";
                Connection conn = DriverManager.getConnection(url, username, password);
                
                // Create a SQL statement and execute it
                String sql = "SELECT * FROM mytable";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                
                // Loop through the result set and add each item to the drop-down list
                while (rs.next()) {
                    String name = rs.getString("name");
                    out.println("<option value='" + name + "'>" + name + "</option>");
                }
                
                // Close the result set, statement, and connection
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </select>
</body>
</html>

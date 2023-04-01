<%-- JSP code --%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<String[]> data = new ArrayList<>();
    data.add(new String[] {"John", "Doe", "42"});
    data.add(new String[] {"Jane", "Doe", "35"});
    data.add(new String[] {"Bob", "Smith", "27"});
%>
<html>    
<head>
    <title>Table Example</title>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${data}" var="row">
                <tr>
                    <c:forEach items="${row}" var="cell">
                        <td>${cell}</td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

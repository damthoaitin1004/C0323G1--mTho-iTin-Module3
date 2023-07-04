<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/4/2023
  Time: 6:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<a href="UserServlet?action=us">List All Users</a>
<table border="1">
  <tr>

    <td>ID </td>
    <td>Name</td>
    <td>Email</td>
    <td>Country </td>
  </tr>
  <c:forEach var="user" items="${listName}" >
  <tr>

    <td><c:out value="${user.id}"/></td>
    <td><c:out value="${user.name}"/></td>
    <td><c:out value="${user.email}"/></td>
    <td><c:out value="${user.country}"/></td>
  </tr>
  </c:forEach>
</body>
</html>
</body>
</html>
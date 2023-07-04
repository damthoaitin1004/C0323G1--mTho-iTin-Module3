<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/4/2023
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
</head>
<body>
<center>
  <h1>User Management</h1>
  <h2>
    <a href="UserServlet?action=create">Add New User</a>
  </h2>
  <form method="post" action="UserServlet?action=searchUser">
    <div align="center">
      <label for="search">Search country of User:</label>
      <input name="search" id="search" type="text">
      <input type="submit" value="Submit">
    </div>
  </form>
  <c:if test="${result == null}">
    <h3><a href="/UserServlet?action=sortByName">Sort By Name</a></h3>
  </c:if>
  <c:if test="${result != null}">
    <h3><a href="/UserServlet">Restore Main List</a></h3>
  </c:if>
</center>
<div align="center">
  <table border="1" cellpadding="5">
    <caption><h2>List of Users</h2></caption>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    <c:forEach var="user" items="${listUser}">
      <tr>
        <td><c:out value="${user.id}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.country}"/></td>
        <td>
          <a href="/UserServlet?action=edit&id=${user.id}">Edit</a>
          <a href="/UserServlet?action=delete&id=${user.id}">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>
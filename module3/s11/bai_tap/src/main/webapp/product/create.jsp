<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/3/2023
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Create new customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<a href="/ProductServlet">Trở về danh sách</a>
<c:if test="${msg != null}">
    <c:out value="${msg}"/>
</c:if>
<form action="/ProductServlet?action=create" method="post">
    <label for="id">ID:</label>
    <input type="number" name="id" id="id">
    <label for="name">Name:</label>
    <input type="text" name="name" id="name">
    <label for="price">Price:</label>
    <input type="text" name="price" id="price">
    <label for="quantity">Quantity:</label>
    <input type="text" name="quantity" id="quantity">
    <label for="information">Information:</label>
    <input type="text" name="information" id="information">
    <input type="submit" value="Submit">
</form>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/3/2023
  Time: 5:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/ProductServlet">Trở về danh sách</a>
<table border="1">
    <tr>
        <td>STT</td>
        <td>Tên sản phẩm</td>
        <td>Giá</td>
        <td>Số lượng</td>
        <td>Thông tin </td>
    </tr>
    <c:forEach var="product" items="${listName}" varStatus="loop">
    <tr>
        <td>${loop.count}</td>
        <td><c:out value="${product.name}"/></td>
        <td><c:out value="${product.price}"/></td>
        <td><c:out value="${product.quantity}"/></td>
        <td><c:out value="${product.information}"/></td>
    </tr>
    </c:forEach>
</body>
</html>

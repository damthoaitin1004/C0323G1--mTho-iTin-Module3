<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/3/2023
  Time: 11:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/ProductServlet?action=searchName" method="post">
        <label for="searchName">Nhập tên sản phâẩm cần tìm:</label>
        <input type="text" name="searchName" id="searchName">
        <input type="submit" value="Submit">
    </form>

    <form action="/ProductServlet?action=informationProduct" method="post">
        <label for="informationProduct">Nhập id sản phẩm cần tìm:</label>
        <input type="number" name="informationProduct" id="informationProduct">
        <input type="submit" value="Submit">
    </form>
<br>
<a href="/ProductServlet?action=showFormCreate">them moi</a>

<table border="1">
    <tr>
        <td>STT</td>
        <td>Tên sản phẩm</td>
        <td>Giá</td>
        <td>Số lượng</td>
        <td>Thông tin </td>
        <td>Update</td>
        <td>Delete</td>
    </tr>
    <c:forEach var="product" items="${list}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><c:out value="${product.quantity}"/></td>
            <td><c:out value="${product.information}"/></td>
            <td><a href="/ProductServlet?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/ProductServlet?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

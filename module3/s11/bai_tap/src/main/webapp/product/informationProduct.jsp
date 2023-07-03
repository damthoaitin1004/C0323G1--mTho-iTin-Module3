<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/3/2023
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/ProductServlet">Back to product list</a>
<table border="1">
<tr>
    <td>Tên sản phẩm</td>
    <td>Giá</td>
    <td>Số lượng</td>
    <td>Thông tin </td>
</tr>

    <tr>
    <td><c:set var="productId" value="${product.name}"/>
        <c:out value="${productId}"/></td>
    <td><c:set var="productPrice" value="${product.price}" />
        <c:out value="${productPricee}"/></td>
    <td><c:set var="productQuantity" value="${product.quantity}" />
        <c:out value="${productQuantity}"/></td>
    <td><c:set var="productInformation" value="${product.information}" />
        <c:out value="${productInformation}"/></td>

    </tr>
</table>
</body>
</html>

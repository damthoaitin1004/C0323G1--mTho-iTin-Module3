<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 7/3/2023
  Time: 11:49 AM
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
<form method="post" action="/ProductServlet?action=delete&id=${product.getId()}">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Information: </td>
                <td>${requestScope["product"].getInformation()}</td>
            </tr>
            <tr>
                <td>Id


                    : </td>
                <td>${requestScope["product"].getId()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete customer"></td>
                <td><a href="/ProductServlet">Back to Product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>

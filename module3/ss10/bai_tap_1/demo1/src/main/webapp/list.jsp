<%--
  Created by IntelliJ IDEA.
  User: Acer
  Date: 6/30/2023
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
:<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1px">
  <tr>
    <th>Tên</th>
    <th>Ngày sinh</th>
    <th>Địa chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach var="customer" items="${customerList}" >
    <tr>
      <td><c:out value="${customer.name}"/></td>
      <td><c:out value="${customer.dateOfBirth}"/></td>
      <td><c:out value="${customer.address}"/> </td>
      <td style="width: 40%"><img src="${customer.img}" style="width: 40%; height: 40%"></td>
    </tr>
  </c:forEach>

</table>
</body>
</html>

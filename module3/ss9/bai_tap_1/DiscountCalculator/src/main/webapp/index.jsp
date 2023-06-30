<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<form action="/hello-servlet" method="post">
    <label><input type="text" style="width: 100px" name="product_description" id="product_description"> Product Description</label>
   <br>
    <label><input type="number" style="width: 100px" name="list_price" id="list_price">List Price</label>
   <br>
    <label><input type="number" style="width: 100px" name="discount_percent" id="discount_percent">Discount Percent</label>
    <br>
    <button name="result" type="submit">Result</button>
</form>
</body>
</html>
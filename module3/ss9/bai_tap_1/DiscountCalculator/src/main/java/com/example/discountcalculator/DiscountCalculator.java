package com.example.discountcalculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class DiscountCalculator extends HttpServlet {
    private String message;

    public void init() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        double listPrice = Double.parseDouble(request.getParameter("list_price"));
        double discountPercent = Double.parseDouble(request.getParameter("discount_percent"));
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;
        String description = request.getParameter("product_description");
        request.setAttribute("amount", discountAmount);
        request.setAttribute("price", discountPrice);
        request.setAttribute("desription", description);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request, response);

    }

    public void destroy() {
    }
}
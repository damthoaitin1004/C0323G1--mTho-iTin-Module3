package com.example.demo1;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/helloServlet")
public class HelloServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Toàn","1983-08-20","Hà Nội","https://haycafe.vn/wp-content/uploads/2022/03/Hinh-chan-dung-nam-dep-479x600.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-20","Hà Nội","https://haycafe.vn/wp-content/uploads/2022/03/Hinh-chan-dung-nam-dep-479x600.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa","1983-08-20","Hà Nội","https://haycafe.vn/wp-content/uploads/2022/03/Hinh-chan-dung-nam-dep-479x600.jpg"));
       request.setAttribute("customerList",customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/list.jsp");
        requestDispatcher.forward(request,response);
    }

    public void destroy() {
    }
}
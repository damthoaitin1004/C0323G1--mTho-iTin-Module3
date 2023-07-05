package com.example.user.controller;

import com.example.user.model.User;
import com.example.user.service.IUserService;
import com.example.user.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/UserServlet")

public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService;

    public void init() {
        userService = new UserService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertUser(request, response);
                break;
            case "edit":
                updateUser(request, response);
                break;
            case "searchUser":
                searchUser(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "sortByName":
                showSortByName(request, response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }

    private void showSortByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> listUser = userService.sortByName();
        request.setAttribute("listUser", listUser);
        String result = "sort";
        request.setAttribute("result", result);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchName = request.getParameter("search");
        List<User> listName = userService.searchName(searchName);
        System.out.println(listName);
        String msg = request.getParameter("msg");
        request.setAttribute("msg", msg);
        request.setAttribute("listName", listName);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/searchName.jsp");
        requestDispatcher.forward(request, response);

    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        User book = new User(id, name, email, country);
        try {
            userService.updateUser(book);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/edit.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
        userService.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);

        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userService.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/create.jsp");
        dispatcher.forward(request, response);
    }

}

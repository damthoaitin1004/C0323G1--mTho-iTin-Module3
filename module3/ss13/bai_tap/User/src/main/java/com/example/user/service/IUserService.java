package com.example.user.service;

import com.example.user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user) ;

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id) ;

    boolean updateUser(User user) ;
    List<User> searchName(String country);
    List<User> sortByName();
}

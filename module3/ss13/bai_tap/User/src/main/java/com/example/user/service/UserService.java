package com.example.user.service;

import com.example.user.model.User;
import com.example.user.repository.IUserRepository;
import com.example.user.repository.UserRepository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService {
    private static IUserRepository userRepository = new UserRepository();

    @Override
    public void insertUser(User user) {
        try {
            userRepository.insertUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public User selectUser(int id) {
        User user = null;
        try {
            user = userRepository.selectUser(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList = null;
        try {
            userList = userRepository.selectAllUsers();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id) {
        try {
            boolean rowDeleted = userRepository.deleteUser(id);
            return rowDeleted;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean updateUser(User user) {
       boolean rowUpdated;
        try {
             rowUpdated = userRepository.updateUser(user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowUpdated;
    }

    @Override
    public List<User> searchName(String country) {
        List<User> userList = null;
        try {
            userList = userRepository.searchName(country);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;

    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }
}

package com.example.user.repository;
import com.example.user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
     void insertUser(User user) throws SQLException;

     User selectUser(int id) throws SQLException;

     List<User> selectAllUsers() throws SQLException;

     boolean deleteUser(int id) throws SQLException;

     boolean updateUser(User user) throws SQLException;
     List<User> searchName(String name) throws SQLException;
     List<User> sortByName();

}

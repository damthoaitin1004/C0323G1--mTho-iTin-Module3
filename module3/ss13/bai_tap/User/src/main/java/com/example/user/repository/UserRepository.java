package com.example.user.repository;

import com.example.user.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {

    private static final String SELECT_ALL_USERS = "{CALL select_all()}";
    private static final String DELETE_USERS_SQL = "{CALL delete_user(?)}";
    private static final String UPDATE_USERS_SQL = "{call update_user(?,?,?,?)}";
    private static final String SEARCH_BY_COUNTRY ="{call search_by_country(?)}";
    private static final String SORT_BY_NAME = "{call sort_by_name();}";
   private static final String  SELECT_USER_BY_ID  = "{CALL get_user_by_id(?)}";
    public static   String INSERT_USERS_SQL  = "{CALL insert_user(?,?,?)}";

    public UserRepository() {

    }


    @Override
    public List<User> sortByName() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareCall(SORT_BY_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if (userList.size() != 0) {
            return userList;
        }
        return null;
    }

    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        PreparedStatement callableStatement = connection.prepareCall(INSERT_USERS_SQL);
        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getCountry());
        callableStatement.executeUpdate();
        connection.close();
    }

    @Override
    public User selectUser(int id) throws SQLException {
        User user = null;
        Connection connection = BaseRepository.getConnection();
        PreparedStatement prepareCall = connection.prepareCall(SELECT_USER_BY_ID);
        prepareCall.setInt(1, id);
        ResultSet rs = prepareCall.executeQuery();
        while (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            user = new User(id, name, email, country);
        }

        return user;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }


    @Override
    public List<User> selectAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();

        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery(SELECT_ALL_USERS);
        while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            users.add(new User(id, name, email, country));
        }
        connection.close();

        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareCall(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareCall(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public List<User> searchName(String country) throws SQLException {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        PreparedStatement preparedStatement = connection.prepareCall(SEARCH_BY_COUNTRY);
        preparedStatement.setString(1, "%" + country + "%");
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String dataCountry = resultSet.getString("country");
            userList.add(new User(id, name, email, dataCountry));
        }
        connection.close();
        if (userList.size() == 0) {
            return null;
        }
        return userList;
    }
}


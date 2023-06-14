package com.example.wwpetshop.dao;

import com.example.wwpetshop.connection.JDBCConnection;
import com.example.wwpetshop.model.User;
import com.example.wwpetshop.service.UserService;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private static final String INSERT_INTO_USER = "insert into user(name, email, password) values (?, ?, ?);";
    private static final String SELECT_USER_BY_EMAIL = "select id, name, email, password from user where email = ?;";


    public static void insertIntoUser(String name, String email, String password) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_USER)) {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean checkEmailExist(String email) {
        boolean check = false;
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            check = rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public static User checkLogin(String emailLogin, String passwordLogin) {
        User user = null;
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            preparedStatement.setString(1, emailLogin);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                long id = rs.getLong("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");

                if (BCrypt.checkpw(passwordLogin, password)) {
                    user = User.builder()
                            .id(id)
                            .name(name)
                            .email(email)
                            .password(passwordLogin)
                            .build();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static long searchUserIDByEmail(String emailRegister) {
        long userID = 0;
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            preparedStatement.setString(1, emailRegister);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                userID= rs.getLong("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userID;
    }

}

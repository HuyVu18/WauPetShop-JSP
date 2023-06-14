package com.example.wwpetshop.dao;

import com.example.wwpetshop.connection.JDBCConnection;
import com.example.wwpetshop.model.Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDAO {
    private static final String INSERT_INTO_CART = "insert into cart(user_id) values (?);";
    private static final String SELECT_USER_CART_BY_EMAIL = "select c.id, c.user_id, c.total_price from cart c join user u on u.id = c.user_id where email = ?;";


    public static void insertIntoCart(long userID) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CART)) {
            preparedStatement.setLong(1, userID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Cart selectUserCartByEmail(String emailLogin) {
        Cart userCart = null;
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_CART_BY_EMAIL)) {
            preparedStatement.setString(1, emailLogin);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                userCart = Cart.builder()
                        .id(rs.getLong("id"))
                        .userID(rs.getLong("user_id"))
                        .totalPrice(rs.getLong("total_price"))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userCart;
    }
}

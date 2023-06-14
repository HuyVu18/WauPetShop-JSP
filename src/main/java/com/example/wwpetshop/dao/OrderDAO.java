package com.example.wwpetshop.dao;

import com.example.wwpetshop.connection.JDBCConnection;
import com.example.wwpetshop.model.Cart;
import com.example.wwpetshop.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class OrderDAO {
    private static final String SELECT_ORDER_BY_USERID = "select id, total_price, order_date from `order` where user_id = ?;";
    private static final String INSERT_INTO_ORDER = "insert into `order`(id, user_id, total_price) values (?, ?, ?);";



    public static void insertIntoOrder(String id, long userID, long totalPrice) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_ORDER)) {
            preparedStatement.setString(1, id);
            preparedStatement.setLong(2, userID);
            preparedStatement.setLong(3, totalPrice);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<Order> selectOrderByUseriD(long userID) {
        List<Order> orderList = new ArrayList<>();
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BY_USERID)) {
            preparedStatement.setLong(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                orderList.add(Order.builder()
                                .id(rs.getString("id"))
                                .totalPrice(rs.getLong("total_price"))
                                .orderDate(rs.getTimestamp("order_date").toLocalDateTime())
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }


}

package com.example.wwpetshop.dao;

import com.example.wwpetshop.connection.JDBCConnection;
import com.example.wwpetshop.model.OrderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO {
    private static final String SELECT_ORDER_DETAIL = "select order_id, product_name, quantity from order_detail od join `order` o on o.id = od.order_id where user_id = ?";
    private static final String INSERT_INTO_ORDER_DETAIL = "insert into order_detail(order_id, product_id, product_name, quantity, sub_price) VALUES (?, ?, ?, ?, ?);";

    public static void insertIntoOrderDetail(String orderID, long productID, String productName, long quantity, long subPrice) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_ORDER_DETAIL)) {
            preparedStatement.setString(1, orderID);
            preparedStatement.setLong(2, productID);
            preparedStatement.setString(3, productName);
            preparedStatement.setLong(4, quantity);
            preparedStatement.setLong(5, subPrice);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<OrderDetail> selectOrderDetailByUserID(long userID) {
        List<OrderDetail> orderDetailList = new ArrayList<>();
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_DETAIL)) {
            preparedStatement.setLong(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                orderDetailList.add(OrderDetail.builder()
                        .orderID(rs.getString("order_id"))
                        .productName(rs.getString("product_name"))
                        .quantity(rs.getLong("quantity"))
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderDetailList;
    }
}

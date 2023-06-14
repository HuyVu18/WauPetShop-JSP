package com.example.wwpetshop.dao;

import com.example.wwpetshop.connection.JDBCConnection;
import com.example.wwpetshop.model.CartLine;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartLineDAO {
    private static final String INSERT_INTO_CART_LINE = "insert into cart_line(cart_id, product_id, quantity, sub_price) values (?, ?, ?, ?);";
    private static final String SELECT_CART_LINE_BY_USERID = "select cl.id, p.id, p.img_url, p.name, p.type, cl.quantity, cl.sub_price from cart_line cl "
            + "join cart c on c.id = cl.cart_id "
            + "join user u on u.id = c.user_id "
            + "join product p on p.id = cl.product_id "
            + "where u.id = ? and cl.is_deleted = 0;";
    private static final String DELETE_CART_LINE_BY_ID = "update cart_line set is_deleted = 1 where id = ?;";
    private static final String DELETE_ALL_CART_LINE = "update cart_line set is_deleted = 1 where cart_id = ?;";


    public static void insertIntoCartLine(long cartID, long productID, long quantity, long subPrice) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_CART_LINE)) {
            preparedStatement.setLong(1, cartID);
            preparedStatement.setLong(2, productID);
            preparedStatement.setLong(3, quantity);
            preparedStatement.setLong(4, subPrice);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static List<CartLine> createCartLineByUserID(long userID) {
        List<CartLine> cartLines = new ArrayList<>();
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CART_LINE_BY_USERID)) {
            preparedStatement.setLong(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                cartLines.add(CartLine.builder()
                        .id(rs.getLong("cl.id"))
                        .productID(rs.getLong("p.id"))
                        .productImgURL(rs.getString("img_url"))
                        .productName(rs.getString("name"))
                        .productType(rs.getString("type"))
                        .productQuantity(rs.getLong("quantity"))
                        .subPrice(rs.getLong("sub_price"))
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartLines;
    }

    public static void deleteCartLine(long cardLineID) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART_LINE_BY_ID)) {
            preparedStatement.setLong(1, cardLineID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void deleteAllCartLine(long cardID) {
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ALL_CART_LINE)) {
            preparedStatement.setLong(1, cardID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

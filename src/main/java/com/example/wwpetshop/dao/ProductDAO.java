package com.example.wwpetshop.dao;

import com.example.wwpetshop.connection.JDBCConnection;
import com.example.wwpetshop.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final String SELECT_PRODUCT_BY_CATEGORYID = "select id, category_id, name, type, price, img_url from product;";


    public static List<Product> createProductList() {
        List<Product> productList = new ArrayList<>();
        try (Connection connection = JDBCConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_CATEGORYID)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                productList.add(Product.builder()
                        .id(rs.getLong("id"))
                        .categoryID(rs.getLong("category_id"))
                        .name(rs.getString("name"))
                        .type(rs.getString("type"))
                        .price(rs.getLong("price"))
                        .imgURL(rs.getString("img_url"))
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }
}

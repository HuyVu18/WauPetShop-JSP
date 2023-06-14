package com.example.wwpetshop.service;

import com.example.wwpetshop.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    public static List<Product> productList = new ArrayList<>();

    public static Product searchProductByID(long id){
        Product product = null;
        for (Product element : productList) {
            if (id == element.getId()) {
                product = element;
            }
        }
        return product;
    }
}

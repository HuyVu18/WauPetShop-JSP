package com.example.wwpetshop.controller;


import com.example.wwpetshop.dao.CartLineDAO;
import com.example.wwpetshop.dao.OrderDAO;
import com.example.wwpetshop.dao.OrderDetailDAO;
import com.example.wwpetshop.model.Cart;
import com.example.wwpetshop.model.CartLine;
import com.example.wwpetshop.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "cartServlet", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                delete(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "orderNow":
                createOrder(req, resp);
                break;
        }
    }

    private void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        Cart cart = (Cart)req.getSession().getAttribute("userCart");
        UUID uuid = UUID.randomUUID();
        String orderID = uuid.toString();
        OrderDAO.insertIntoOrder(orderID, user.getId(), cart.getTotalPrice());

        List<CartLine> cartLineList = CartLineDAO.createCartLineByUserID(user.getId());
        for (CartLine element : cartLineList) {
            OrderDetailDAO.insertIntoOrderDetail(orderID, element.getProductID(), element.getProductName(), element.getProductQuantity(), element.getSubPrice());
        }

        CartLineDAO.deleteAllCartLine(cart.getId());
        HomePageController.showCart(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long cartLineID = Long.parseLong(req.getParameter("cartLineID"));
        CartLineDAO.deleteCartLine(cartLineID);
        HomePageController.showCart(req, resp);
    }

}

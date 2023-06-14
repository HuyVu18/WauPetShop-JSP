package com.example.wwpetshop.controller;

import com.example.wwpetshop.dao.CartLineDAO;
import com.example.wwpetshop.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "productServlet", value = {"/product"})
public class ProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "back":
                showHomePage(req, resp);
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
            case "addToCart":
                addToCart(req, resp);
                break;

        }
    }

    private void showHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("productList", ProductService.productList);
        req.getRequestDispatcher("/WEB-INF/view/home-page/home.jsp").forward(req, resp);
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long cartID = Long.parseLong(req.getParameter("cartID"));
        long productID = Long.parseLong(req.getParameter("productID"));
        long price = Long.parseLong(req.getParameter("price"));
        long quantity = Long.parseLong(req.getParameter("quantity"));
        long subPrice = quantity * price;
        CartLineDAO.insertIntoCartLine(cartID, productID, quantity, (subPrice));
        showHomePage(req, resp);
    }
}

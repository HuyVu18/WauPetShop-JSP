package com.example.wwpetshop.controller;

import com.example.wwpetshop.dao.*;
import com.example.wwpetshop.model.*;
import com.example.wwpetshop.service.ProductService;
import com.example.wwpetshop.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userServlet", value = {"/home"})
public class HomePageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "logout":
                logout(req, resp);
                break;

            case "product":
                showProductDetail(req, resp);
                break;

            case "cart":
                showCart(req, resp);
                break;

            case "order":
                showOrder(req, resp);
                break;

            default:
                ProductService.productList = ProductDAO.createProductList();
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
            case "register":
                register(req, resp);
                break;

            case "login":
                login(req, resp);
                break;
        }
    }

    private void showHomePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("productList", ProductService.productList);
        req.getRequestDispatcher("WEB-INF/view/home-page/home.jsp").forward(req, resp);
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (!UserDAO.checkEmailExist(email)) {
            UserDAO.insertIntoUser(name, email, UserService.hashPassword(password));
            CartDAO.insertIntoCart(UserDAO.searchUserIDByEmail(email));
            req.setAttribute("registerstatus", "success");
        } else {
            req.setAttribute("registerstatus", "failed");
        }
        showHomePage(req, resp);
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailLogin = req.getParameter("email");
        String passwordLogin = req.getParameter("password");
        User user = UserDAO.checkLogin(emailLogin, passwordLogin);
        Cart userCart = CartDAO.selectUserCartByEmail(emailLogin);
        if (user != null) {
            req.getSession().setAttribute("user", user);
            req.getSession().setAttribute("userCart", userCart);

        } else {
            req.setAttribute("loginstatus", "failed");
        }
        showHomePage(req, resp);
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("user");
        req.getSession().removeAttribute("userCart");
        showHomePage(req, resp);
    }

    private void showProductDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long productID = Long.parseLong(req.getParameter("id"));
        Product product = ProductService.searchProductByID(productID);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/WEB-INF/view/product-detail/product-detail.jsp").forward(req, resp);
    }

    public static void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        Cart userCart = (Cart)req.getSession().getAttribute("userCart");
        List<CartLine> cartLineList = CartLineDAO.createCartLineByUserID(user.getId());
        long totalPrice = 0;
        for (CartLine element : cartLineList) {
            totalPrice += element.getSubPrice();
        }
        userCart.setTotalPrice(totalPrice);

        req.setAttribute("cartLineList", cartLineList);
        req.getRequestDispatcher("WEB-INF/view/shopping-cart/cart.jsp").forward(req, resp);
    }

    private static void showOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User)req.getSession().getAttribute("user");
        req.setAttribute("orderList", OrderDAO.selectOrderByUseriD(user.getId()));
        req.setAttribute("orderDetailList", OrderDetailDAO.selectOrderDetailByUserID(user.getId()));

        req.getRequestDispatcher("WEB-INF/view/order-list/order.jsp").forward(req, resp);
    }


}

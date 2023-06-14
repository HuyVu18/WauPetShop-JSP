package com.example.wwpetshop.service;

import org.mindrot.jbcrypt.BCrypt;

public class UserService {

    public static String hashPassword(String password) {
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        return hash;
    }
}

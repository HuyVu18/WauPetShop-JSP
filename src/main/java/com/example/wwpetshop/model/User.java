package com.example.wwpetshop.model;

import lombok.*;

@Builder
@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor

public class User {
    private long id;
    private String name;
    private String email;
    private String password;
}
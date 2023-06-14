package com.example.wwpetshop.model;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class Product {
    private long id;
    private long categoryID;
    private String name;
    private String type;
    private long price;
    private String imgURL;
}

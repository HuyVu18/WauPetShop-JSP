package com.example.wwpetshop.model;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class CartLine {
    private long id;
    private long productID;
    private String productImgURL;
    private String productName;
    private String productType;
    private long productQuantity;
    private long subPrice;
}

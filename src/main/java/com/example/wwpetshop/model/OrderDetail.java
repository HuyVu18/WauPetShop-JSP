package com.example.wwpetshop.model;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class OrderDetail {
    private String orderID;
    private String productName;
    private long quantity;

}

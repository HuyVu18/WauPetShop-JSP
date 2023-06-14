package com.example.wwpetshop.model;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class Cart {
    private long id;
    private long userID;
    private long totalPrice;
}

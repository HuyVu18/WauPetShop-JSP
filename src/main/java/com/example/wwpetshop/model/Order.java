package com.example.wwpetshop.model;

import lombok.*;

import java.time.LocalDateTime;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class Order {
    private String id;
    private long totalPrice;
    private LocalDateTime orderDate;
}

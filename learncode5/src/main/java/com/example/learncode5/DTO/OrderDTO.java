package com.example.learncode5.DTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderDTO {
    private Long id;
    private String orderCode;
    private String customerName;
    private String orderType; // "sale" or "purchase"
    private Double totalPrice;

}
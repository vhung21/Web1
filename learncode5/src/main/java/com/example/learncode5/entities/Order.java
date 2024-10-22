package com.example.learncode5.entities;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "customer_order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_code", nullable = false, length = 300)
    private String orderCode;

    @Column(name = "customer_name", nullable = false, length = 300)
    private String customerName;

    @Column(name = "order_type", nullable = false)
    private String orderType; // "sale" for selling order, "purchase" for purchase order

    @Column(name = "total_price", nullable = false)
    private Double totalPrice;

    public Order() {
    }
    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderCode='" + orderCode + '\'' +
                ", customerName='" + customerName + '\'' +
                ", orderType='" + orderType + '\'' +
                ", totalPrice=" + totalPrice +
                '}';
    }
}

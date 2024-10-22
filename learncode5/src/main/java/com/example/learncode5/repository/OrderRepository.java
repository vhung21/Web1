package com.example.learncode5.repository;

import com.example.learncode5.entities.Order;
import com.example.learncode5.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Optional<Order> findById(long id);

    boolean existsByOrderCode(String orderCode);
}

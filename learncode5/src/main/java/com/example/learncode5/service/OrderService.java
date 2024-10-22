package com.example.learncode5.service;

import com.example.learncode5.DTO.OrderDTO;
import com.example.learncode5.entities.Order;
import com.example.learncode5.mapper.Mapper;
import com.example.learncode5.payload.Response.ResponseObject;
import com.example.learncode5.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@Transactional
public class OrderService {
    private final OrderRepository orderRepository;
    private final Mapper mapper;

    @Autowired
    public OrderService(OrderRepository orderRepository, Mapper mapper) {
        this.orderRepository = orderRepository;
        this.mapper = mapper;
    }

    public ResponseEntity<ResponseObject> getListOrder() {
        try {
            List<Order> orderList = orderRepository.findAll();
            List<OrderDTO> orderDTOList = new ArrayList<>();
            for (Order order : orderList) {
                orderDTOList.add(mapper.orderToOrderDTO(order));
            }
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("success", "", orderDTOList));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while fetching order list", null));
        }
    }

    public ResponseEntity<ResponseObject> addOrder(OrderDTO orderDTO) {
        try {
            Order order = new Order();
            order.setOrderCode(orderDTO.getOrderCode());
            order.setCustomerName(orderDTO.getCustomerName());
            order.setOrderType(orderDTO.getOrderType());
            order.setTotalPrice(orderDTO.getTotalPrice());

            Order savedOrder = orderRepository.save(order);
            return ResponseEntity.ok(new ResponseObject("success", "", mapper.orderToOrderDTO(savedOrder)));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while adding order", null));
        }
    }

    public ResponseEntity<ResponseObject> getOrderById(Long id) {
        try {
            Optional<Order> order = orderRepository.findById(id);
            return order.map(value -> ResponseEntity.ok(new ResponseObject("success", "Get order successfully", mapper.orderToOrderDTO(value))))
                    .orElseGet(() -> ResponseEntity.badRequest().body(new ResponseObject("failed", "Order id not exist", id)));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while fetching order by id", id));
        }
    }

    public ResponseEntity<ResponseObject> editOrder(Long id, OrderDTO orderDTO) {
        try {
            Optional<Order> existingOrder = orderRepository.findById(id);
            if (existingOrder.isEmpty()) {
                return ResponseEntity.badRequest().body(new ResponseObject("failed", "Order id not exist", id));
            }

            Order orderToUpdate = existingOrder.get();
            orderToUpdate.setOrderCode(orderDTO.getOrderCode());
            orderToUpdate.setCustomerName(orderDTO.getCustomerName());
            orderToUpdate.setOrderType(orderDTO.getOrderType());
            orderToUpdate.setTotalPrice(orderDTO.getTotalPrice());
            orderRepository.save(orderToUpdate);

            return ResponseEntity.ok(new ResponseObject("success", "", mapper.orderToOrderDTO(orderToUpdate)));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while updating order", id));
        }
    }

    public ResponseEntity<ResponseObject> deleteOrder(Long id) {
        try {
            Optional<Order> order = orderRepository.findById(id);
            if (order.isEmpty()) {
                return ResponseEntity.badRequest().body(new ResponseObject("failed", "Order id not exist", id));
            }
            orderRepository.deleteById(id);
            return ResponseEntity.ok(new ResponseObject("success", "Deleted successfully", mapper.orderToOrderDTO(order.get())));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while deleting order", id));
        }
    }
}

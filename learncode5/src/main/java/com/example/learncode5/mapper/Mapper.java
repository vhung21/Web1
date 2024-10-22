package com.example.learncode5.mapper;

import com.example.learncode5.DTO.*;
import com.example.learncode5.entities.Customer;
import com.example.learncode5.entities.Order;
import com.example.learncode5.entities.Product;
import com.example.learncode5.entities.User;
import org.springframework.stereotype.Component;

@Component
public class Mapper {
    public UserDTO userToUserDTO(User user) {
        return new UserDTO(user);
    }

    public ProductDTO productToProductDTO(Product product) {
        ProductDTO dto = new ProductDTO(product);
        dto.setId(product.getId());
        dto.setProductName(product.getProductName());
        dto.setProductCode(product.getProductCode());
        dto.setManufacturer(product.getManufacturer());
        dto.setQuantity(product.getQuantity());
        dto.setPrice(product.getPrice());
        dto.setAddedBy(product.getAddedBy());

        // Mapping Category
        if (product.getCategory() != null) {
            CategoryDTO categoryDTO = new CategoryDTO();
            categoryDTO.setId((long) Math.toIntExact(product.getCategory().getId()));
            categoryDTO.setCategoryName(product.getCategory().getCategoryName());
            dto.setCategory(categoryDTO);
        }
        return dto;
    }


    public CustomerDTO customerToCustomerDTO(Customer customer) {
        CustomerDTO dto = new CustomerDTO();
        dto.setId(customer.getId());
        dto.setName(customer.getName());
        dto.setEmail(customer.getEmail());
        dto.setPhoneNumber(customer.getPhoneNumber());
        dto.setAddress(customer.getAddress());
        return dto;
    }

    public Customer customerDTOToCustomer(CustomerDTO dto) {
        Customer customer = new Customer();
        customer.setId(dto.getId());
        customer.setName(dto.getName());
        customer.setEmail(dto.getEmail());
        customer.setPhoneNumber(dto.getPhoneNumber());
        customer.setAddress(dto.getAddress());
        return customer;
    }

    public OrderDTO orderToOrderDTO(Order order) {
        OrderDTO dto = new OrderDTO();
        dto.setId(order.getId());
        dto.setOrderCode(order.getOrderCode());
        dto.setCustomerName(order.getCustomerName());
        dto.setOrderType(order.getOrderType());
        dto.setTotalPrice(order.getTotalPrice());
        return dto;
    }
}

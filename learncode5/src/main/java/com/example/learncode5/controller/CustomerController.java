package com.example.learncode5.controller;

import com.example.learncode5.DTO.CustomerDTO;
import com.example.learncode5.payload.Response.ResponseObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/customer")
public class CustomerController {

    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    // Lấy danh sách khách hàng
    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN') || hasAuthority('USER')")
    public ResponseEntity<ResponseObject> getListCustomer() {
        return customerService.getCustomerList();
    }

    // Thêm khách hàng
    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<ResponseObject> addCustomer(@RequestBody com.example.learncode5.controller.CustomerDTO customerDTO) {
        return customerService.addCustomer(customerDTO);
    }

    // Lấy chi tiết khách hàng
    @GetMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN') || hasAuthority('USER')")
    public ResponseEntity<ResponseObject> getCustomerDetail(@PathVariable Long id) {
        return customerService.getCustomerById(id);
    }

    // Chỉnh sửa thông tin khách hàng
    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<ResponseObject> updateCustomer(@PathVariable Long id, @RequestBody CustomerDTO customerDTO) {
        customerDTO.setId(id); // Gán ID cho DTO
        return customerService.updateCustomer(customerDTO);
    }

    // Xóa khách hàng
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<ResponseObject> deleteCustomer(@PathVariable Long id) {
        return customerService.deleteCustomer(id);
    }
}

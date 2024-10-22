package com.example.learncode5.service;

import com.example.learncode5.DTO.CustomerDTO;
import com.example.learncode5.entities.Customer;
import com.example.learncode5.mapper.Mapper;
import com.example.learncode5.payload.Response.ResponseObject;
import com.example.learncode5.repository.CustomerRepository;
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
public class CustomerService {
    private final CustomerRepository customerRepository;
    private final Mapper mapper;

    @Autowired
    public CustomerService(CustomerRepository customerRepository, Mapper mapper) {
        this.customerRepository = customerRepository;
        this.mapper = mapper;
    }

    public ResponseEntity<ResponseObject> getCustomerList() {
        try {
            List<Customer> customerList = customerRepository.findAll();
            List<CustomerDTO> customerDTOList = new ArrayList<>();
            for (Customer customer : customerList) {
                customerDTOList.add(mapper.customerToCustomerDTO(customer)); // Giả định bạn đã tạo phương thức mapper cho Customer
            }
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("success", "", customerDTOList));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while fetching customer list", null));
        }
    }

    public ResponseEntity<ResponseObject> getCustomerById(Long id) {
        try {
            Optional<Customer> customer = customerRepository.findById(id);
            return customer.map(value -> ResponseEntity.ok(new ResponseObject("success", "Get customer successfully", mapper.customerToCustomerDTO(value))))
                    .orElseGet(() -> ResponseEntity.badRequest().body(new ResponseObject("failed", "Customer id not exist", id)));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while fetching customer by id", id));
        }
    }

    public ResponseEntity<ResponseObject> deleteCustomer(Long id) {
        try {
            Optional<Customer> customer = customerRepository.findById(id);
            if (customer.isEmpty()) {
                return ResponseEntity.badRequest().body(new ResponseObject("failed", "Customer id not exist", id));
            }
            customerRepository.deleteById(id);
            return ResponseEntity.ok(new ResponseObject("success", "Deleted successfully", mapper.customerToCustomerDTO(customer.get())));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while deleting customer", id));
        }
    }

    public ResponseEntity<ResponseObject> updateCustomer(Long id, CustomerDTO customerDTO) {
        try {
            Optional<Customer> existingCustomer = customerRepository.findById(id);
            if (existingCustomer.isEmpty()) {
                return ResponseEntity.badRequest().body(new ResponseObject("failed", "Customer id not exist", id));
            }

            Customer customerToUpdate = existingCustomer.get();
            customerToUpdate.setName(customerDTO.getName());
            customerToUpdate.setEmail(customerDTO.getEmail());
            customerToUpdate.setPhoneNumber(customerDTO.getPhoneNumber());
            customerToUpdate.setAddress(customerDTO.getAddress());
            customerRepository.save(customerToUpdate);

            return ResponseEntity.ok(new ResponseObject("success", "", mapper.customerToCustomerDTO(customerToUpdate)));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while updating customer", id));
        }
    }

    public ResponseEntity<ResponseObject> addCustomer(CustomerDTO customerDTO) {
        try {
            Customer customer = new Customer();
            customer.setName(customerDTO.getName());
            customer.setEmail(customerDTO.getEmail());
            customer.setPhoneNumber(customerDTO.getPhoneNumber());
            customer.setAddress(customerDTO.getAddress());

            Customer savedCustomer = customerRepository.save(customer);
            return ResponseEntity.ok(new ResponseObject("success", "", mapper.customerToCustomerDTO(savedCustomer)));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ResponseObject("failed", "An error occurred while adding customer", null));
        }
    }
}

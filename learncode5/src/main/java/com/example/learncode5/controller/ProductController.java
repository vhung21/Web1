package com.example.learncode5.controller;

import com.example.learncode5.DTO.ProductDTO;
import com.example.learncode5.payload.Response.ResponseObject;
import com.example.learncode5.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/product")
public class ProductController {

    private final ProductService productService;

    @Autowired
    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // Lấy danh sách sản phẩm
    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN') || hasAuthority('USER')")
    public ResponseEntity<ResponseObject> getProductList() {
        return productService.getProductList();
    }

    // Xóa sản phẩm theo ID
    @DeleteMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<ResponseObject> delete(@PathVariable long id) {
        return productService.deleteProductById(id);
    }

    // Lấy thông tin sản phẩm theo tên
    @GetMapping("/{product_name}")
    @PreAuthorize("hasAuthority('ADMIN') || hasAuthority('USER')")
    public ResponseEntity<ResponseObject> get(@PathVariable String product_name) {
        return productService.getProductByProductName(product_name);
    }

    // Cập nhật thông tin sản phẩm
    @PutMapping("/{id}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<ResponseObject> update(@PathVariable long id, @RequestBody ProductDTO productDTO) {
        productDTO.setId(id);
        return productService.updateProduct(productDTO, productDTO.getCategory().getId());
    }

    // Thêm sản phẩm mới
    @PostMapping("/add")
    @PreAuthorize("hasAuthority('ADMIN')")
    public ResponseEntity<ResponseObject> addProduct(@RequestBody ProductDTO productDTO) {
        return productService.addProduct(productDTO, productDTO.getCategory().getId());
    }
}

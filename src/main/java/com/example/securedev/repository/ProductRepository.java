package com.example.secureDevops.repository;

import com.example.secureDevops.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
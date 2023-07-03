package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductRepository {
    void add(Product product);
    void remove(Product product);
    List<Product> getAll();
    List<Product> searchName(String name);
    Product getById(int id);
    void update(int id,Product product);
}

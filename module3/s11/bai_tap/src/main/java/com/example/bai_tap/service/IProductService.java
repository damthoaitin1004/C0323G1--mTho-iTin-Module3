package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showList();
    void save(Product product);
    void delete(Product product);
     Product getById(int code);
    void update(int id, Product product);
    List<Product> showListName(String name);


}

package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showList();
    void save(String name,int price,int quantity,String information);
    void delete(int id);
     Product getById(int id);
    void update(int id, Product product);
    List<Product> showListName(String name);


}

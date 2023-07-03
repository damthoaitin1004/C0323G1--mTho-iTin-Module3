package com.example.bai_tap.service;

import com.example.bai_tap.model.Product;
import com.example.bai_tap.repository.IProductRepository;
import com.example.bai_tap.repository.Repository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new Repository() {
    };

    @Override
    public List<Product> showList() {
        return iProductRepository.getAll();
    }

    @Override
    public void save(Product product) {
      iProductRepository.add(product);
    }

    @Override
    public void delete(Product product) {
        iProductRepository.remove(product);
    }
    public Product getById(int code){
        List<Product> productList = iProductRepository.getAll();
        for (Product p: productList) {
            if (p.getId()==code){
                return p;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public List<Product> showListName(String name) {
        List<Product> productsName = iProductRepository.searchName(name);
        return productsName;
    }
}

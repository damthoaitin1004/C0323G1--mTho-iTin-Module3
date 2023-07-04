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
    public void save(String name,int price,int quantity,String information) {
         List<Product> productList = iProductRepository.getAll();
         int newId =1;
        for (Product p:productList) {
            if (p.getId()==newId){newId++;}
        }
        Product newProduct = new Product(newId,name,price,quantity,information);
      iProductRepository.add(newProduct);
    }

    @Override
    public void delete(int id) {
        iProductRepository.remove(id);
    }
    public Product getById(int id){
        return iProductRepository.getById(id);
    }

    @Override
    public void update(int id, Product product) {
        iProductRepository.update(id,product);

    }

    @Override
    public List<Product> showListName(String name) {
        List<Product> productsName = iProductRepository.searchName(name);
        return productsName;
    }
}

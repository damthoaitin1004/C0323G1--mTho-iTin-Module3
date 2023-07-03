package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.ArrayList;
import java.util.List;

public class Repository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
       productList.add(new Product(1,"banh deo",40000,100,"Rất ngon"));
       productList.add(new Product(2,"banh beo",40000,100,"Rất ngon"));
       productList.add(new Product(3,"keo keo",40000,100,"Rất ngon"));
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void remove(Product product) {
        productList.remove(product);
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public List<Product> searchName(String name) {
        List<Product> productSearch = new ArrayList<>();
        for (Product p : productList) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                productSearch.add(p);
            }
        }
        if (productSearch.size() == 0) {
            return null;
        } else {
            return productSearch;
        }
    }


    @Override
    public Product getById(int code) {
        for (Product p : productList) {
            if (p.getId()==(code)) {
                return p;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
    }


}

package com.example.bai_tap.repository;

import com.example.bai_tap.model.Product;

import java.util.*;

public class Repository implements IProductRepository {
    private static Map<Integer, Product> productList = new HashMap<>();
    static {
        productList.put(1, new Product(1, "banh deo", 40000, 100, "Rất ngon"));
        productList.put(2, new Product(2, "banh beo", 40000, 100, "Rất ngon"));
        productList.put(3, new Product(3, "keo keo", 40000, 100, "Rất ngon"));
    }

    @Override
    public void add(Product product) {
        productList.put(product.getId(), product);
    }

    @Override
    public void remove(int id) {

        productList.remove(id);
    }

    @Override
    public List<Product> getAll() {
        return new ArrayList<>(productList.values());
    }

    @Override
    public List<Product> searchName(String name) {
        List<Product> productsArrList = getAll();
        List<Product> productSearch = new ArrayList<>();
        for (Product p : productsArrList) {
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
        for (Product product : productList.values()) {
            if (product.getId() == code) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void update(int id, Product product) {
      productList.put(id,product);
    }


}

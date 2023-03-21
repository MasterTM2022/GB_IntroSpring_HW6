package ru.gb.perov.Homework6.DAO;

import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.Data.Product;

import java.util.List;

@Service
public interface ProductDao {

    Product findById(Long id);
//    List<Product> findAll();
//    void deleteById(Long id);
//    Product save(Product product);
//    void add(String title, double cost);
}

package ru.gb.perov.Homework6.DAO;


import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.Data.Customer;
import ru.gb.perov.Homework6.Data.Product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public interface OrderStringDAO {
    List<Product> findProductsByCustomerId(Long idCustomer) throws SQLException;

    List<Customer> findCustomersByProductsId(Long idProduct) throws SQLException;

    Map<Product, ArrayList<Double>> findProductsByCustomerIdWithPrices(Long idCustomer) throws SQLException;
}

package ru.gb.perov.Homework6.DAO;

import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.Data.Order;

import java.sql.SQLException;
import java.util.List;
@Service
public interface OrderDao {
    List<Order> findOrdersByCustomerId(Long idCustomer) throws SQLException;

    List<Order> findOrderByProductId(Long idProduct);
}

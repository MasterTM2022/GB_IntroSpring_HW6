package ru.gb.perov.Homework6.DAO;

import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.Data.Customer;
import ru.gb.perov.Homework6.Data.Product;

@Service
public interface CustomerDao {

    Customer findById(Long id);
}

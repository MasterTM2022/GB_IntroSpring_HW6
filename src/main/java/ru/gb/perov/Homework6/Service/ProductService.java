package ru.gb.perov.Homework6.Service;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.DAO.ProductDao;
import ru.gb.perov.Homework6.Data.Order;
import ru.gb.perov.Homework6.Data.OrderString;
import ru.gb.perov.Homework6.Data.Product;
import ru.gb.perov.Homework6.SessionFactoryUtils;

import java.util.List;

@Component
@Service
public class ProductService implements ProductDao {
    @Autowired
    private SessionFactoryUtils sessionFactoryUtils;

    public ProductService(SessionFactoryUtils sessionFactoryUtils, OrderService orderService) {
        this.sessionFactoryUtils = sessionFactoryUtils;
    }


    @Override
    public Product findById(Long id) {
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            Product product = session.get(Product.class, id);

            session.getTransaction().commit();
            return product;
        } catch (Exception e) {
            System.out.println("Product with id=" + id + " not found.");
            return null;
        }
    }
}

package ru.gb.perov.Homework6.Service;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.DAO.OrderDao;
import ru.gb.perov.Homework6.Data.Customer;
import ru.gb.perov.Homework6.Data.Order;
import ru.gb.perov.Homework6.Data.Product;
import ru.gb.perov.Homework6.SessionFactoryUtils;

import java.sql.SQLException;
import java.util.List;


@Component
@Service
public class OrderService implements OrderDao {
    @Autowired
    private SessionFactoryUtils sessionFactoryUtils;
    @Autowired
    private CustomerService customerService;    //injection are needed only for info in console
    @Autowired
    private ProductService productService;      //injection are needed only for info in console


    public OrderService(SessionFactoryUtils sessionFactoryUtils) {
        this.sessionFactoryUtils = sessionFactoryUtils;
    }

    @Override
    public List<Order> findOrdersByCustomerId(Long idCustomer) throws SQLException {
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            List<Order> orders = session.createQuery("SELECT o FROM Order o WHERE o.customer=" + idCustomer).getResultList();

            session.getTransaction().commit();

            System.out.println("\n============findOrdersByCustomerId=" + idCustomer + " (" + customerService.findById(idCustomer) + ")");
            orders.forEach(System.out::println);
            return orders;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Order> findOrderByProductId(Long idProduct) {
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            List<Order> orders = session.createQuery("SELECT c FROM Order c WHERE c.=" + idProduct).getResultList();

            session.getTransaction().commit();

            System.out.println("============findOrderByProductId=" + idProduct + " (" + productService.findById(idProduct) + ")");
            orders.forEach(System.out::println);
            return orders;
        } catch (Exception e) {
            return null;
        }
    }

    public OrderService() {
    }
}

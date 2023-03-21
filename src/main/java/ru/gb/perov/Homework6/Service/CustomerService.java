package ru.gb.perov.Homework6.Service;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import ru.gb.perov.Homework6.DAO.CustomerDao;
import ru.gb.perov.Homework6.Data.Customer;
import ru.gb.perov.Homework6.Data.Product;
import ru.gb.perov.Homework6.SessionFactoryUtils;

@Component
public class CustomerService implements CustomerDao {
    @Autowired
    private SessionFactoryUtils sessionFactoryUtils;

    public CustomerService(SessionFactoryUtils sessionFactoryUtils) {
        this.sessionFactoryUtils = sessionFactoryUtils;
    }

    @Override
    public Customer findById(Long id) {
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            Customer customer = session.get(Customer.class, id);

            session.getTransaction().commit();
            return customer;
        } catch (Exception e) {
            System.out.println("Customer with id=" + id + " not found.");
            return null;
        }
    }
}

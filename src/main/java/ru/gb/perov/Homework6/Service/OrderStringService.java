package ru.gb.perov.Homework6.Service;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import ru.gb.perov.Homework6.DAO.OrderStringDAO;
import ru.gb.perov.Homework6.Data.Customer;
import ru.gb.perov.Homework6.Data.Order;
import ru.gb.perov.Homework6.Data.OrderString;
import ru.gb.perov.Homework6.Data.Product;
import ru.gb.perov.Homework6.SessionFactoryUtils;

import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

@Component
@Service
public class OrderStringService implements OrderStringDAO {
    @Autowired
    private SessionFactoryUtils sessionFactoryUtils;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private ProductService productService;

    @Override
    public List<Product> findProductsByCustomerId(Long idCustomer) throws SQLException {
        List<Order> orders = orderService.findOrdersByCustomerId(idCustomer);
        List<Product> products = new ArrayList<>();
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            for (Order o : orders) {
                products.addAll((Collection<? extends Product>) session.createQuery("SELECT DISTINCT p.product FROM OrderString p WHERE p.order=" + o.getId()).getResultList());
            }

            session.getTransaction().commit();
        }

        products = products.stream().distinct().collect(Collectors.toList());
        System.out.println("\n==========findProductsByCustomerId=" + idCustomer + " (" + customerService.findById(idCustomer) + ")");
        products.forEach(System.out::println);
        return products;

    }

    @Override
    public List<Customer> findCustomersByProductsId(Long idProduct) {
        List<Order> orders = new ArrayList<>();
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            orders.addAll((Collection<? extends Order>) session.createQuery("SELECT DISTINCT os.order FROM OrderString os WHERE os.product=" + idProduct).getResultList());

            session.getTransaction().commit();
        }

        List<Customer> customers = new ArrayList<>();
        for (Order o : orders) {
            customers.add(o.getCustomer());
        }
        customers = customers.stream().distinct().collect(Collectors.toList());
        System.out.println("\n==========findCustomersByProductsId=" + idProduct + " (" + productService.findById(idProduct) + ")");
        customers.forEach(System.out::println);
        return customers;
    }

    @Override
    public Map<Product, ArrayList<Double>> findProductsByCustomerIdWithPrices(Long idCustomer) throws SQLException {
        List<Order> orders = orderService.findOrdersByCustomerId(idCustomer);
        List<OrderString> os = new ArrayList<>();
        try (Session session = sessionFactoryUtils.getSession()) {
            session.beginTransaction();

            for (Order o : orders) {
                os.addAll((Collection<? extends OrderString>) session.createQuery("SELECT os FROM OrderString os WHERE os.order=" + o.getId()).getResultList());
            }

            session.getTransaction().commit();
        }

        Map<Product, ArrayList<Double>> productsWithPrices = new HashMap<>();
        for (OrderString o : os) {
            ArrayList<Double> prices = new ArrayList<>();
            if (productsWithPrices.containsKey(o.getProduct())) {
                prices.addAll(productsWithPrices.get(o.getProduct()));
            }
            prices.add(o.getOrderStringPrice());
            productsWithPrices.put(o.getProduct(), prices);
        }
        System.out.println("\n==========findProductsByCustomerIdWithPrices=" + idCustomer + " (" + customerService.findById(idCustomer) + ")");
        productsWithPrices.forEach((key, value) -> System.out.println(key + ": " + value));
        return productsWithPrices;
    }

    public OrderStringService() {
    }
}

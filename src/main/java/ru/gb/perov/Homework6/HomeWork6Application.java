package ru.gb.perov.Homework6;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import ru.gb.perov.Homework6.Data.Customer;
import ru.gb.perov.Homework6.Data.Order;
import ru.gb.perov.Homework6.Data.OrderString;
import ru.gb.perov.Homework6.Data.Product;
import ru.gb.perov.Homework6.Service.OrderStringService;

import java.sql.SQLException;

@ComponentScan("ru.gb.perov.Homework6")
public class HomeWork6Application {

    public static void main(String[] args) throws SQLException {

        SessionFactoryUtils sessionFactoryUtils = new SessionFactoryUtils();
        SessionFactoryUtils.init();
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext("ru.gb.perov.Homework6");

        OrderStringService orderStringService = context.getBean(OrderStringService.class);
        orderStringService.findProductsByCustomerId(6L);
        orderStringService.findCustomersByProductsId(5L);
        orderStringService.findProductsByCustomerIdWithPrices(2L);

//        Product product = context.getBean(Product.class);
//        Customer customer = context.getBean(Customer.class);
//        Order order = context.getBean(Order.class);
//        OrderString orderString = context.getBean(OrderString.class);
//        try (Session session = sessionFactoryUtils.getSession()) {
//            session.beginTransaction();
//            product = session.get(Product.class, 1L);
//            customer = session.get(Customer.class, 2L);
//            order = session.get(Order.class, 5L);
//            orderString = session.get(OrderString.class, 105l);//
//            session.getTransaction().commit();
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//        System.out.println(product.toString());
//        System.out.println(customer.toString());
//        System.out.println(order.toString());
//        System.out.println(orderString.toString());

        sessionFactoryUtils.shutdown();
        context.close();
    }
}
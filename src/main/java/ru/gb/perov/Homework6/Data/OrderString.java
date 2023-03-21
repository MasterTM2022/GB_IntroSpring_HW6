package ru.gb.perov.Homework6.Data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.persistence.*;

@Component
@Entity
@Table(name = "orders_strings")
public class OrderString {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "order_string_price")
    private double orderStringPrice;

    @ManyToOne
    @JoinColumn(name="product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name="order_id")
    private Order order;

    public OrderString() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public double getOrderStringPrice() {
        return orderStringPrice;
    }

    public void setOrderStringPrice(double ordeStringPrice) {
        this.orderStringPrice = ordeStringPrice;
    }

    public Product getProduct() {
        return product;
    }

    public Order getOrder() {
        return order;
    }

    @Override
    public String toString() {
        return "OrdersString{" +
                "id=" + id +
                ", ordeStringPrice=" + orderStringPrice +
                ", product=" + product +
                ", order=" + order +
                '}';
    }
}

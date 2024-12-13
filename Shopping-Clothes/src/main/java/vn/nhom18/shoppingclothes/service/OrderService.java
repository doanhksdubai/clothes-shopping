package vn.nhom18.shoppingclothes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.nhom18.shoppingclothes.domain.Order;
import vn.nhom18.shoppingclothes.domain.OrderDetail;
import vn.nhom18.shoppingclothes.repository.OrderDetailRepository;
import vn.nhom18.shoppingclothes.repository.OrderRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

     // Lấy danh sách đơn hàng của người dùng (có phân trang)
     public Page<Order> getOrdersByUserId(long userId, Pageable pageable) {
        return orderRepository.findByUserId(userId, pageable);
    }

    // Lấy thông tin chi tiết của một đơn hàng theo orderId
    public Order getOrderById(long orderId, long userId) {
        // Retrieve order by orderId and userId to ensure that the user can only view their own orders
        return orderRepository.findByIdAndUserId(orderId, userId);
    }
    // Lấy chi tiết đơn hàng (order details) theo orderId
    public List<OrderDetail> getOrderDetailsByOrderId(long orderId) {
        // Retrieve all order details by orderId
        return orderDetailRepository.findByOrderId(orderId);
    }
}

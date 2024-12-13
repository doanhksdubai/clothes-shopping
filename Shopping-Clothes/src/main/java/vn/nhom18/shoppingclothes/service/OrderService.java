package vn.nhom18.shoppingclothes.service;

import java.util.List;
<<<<<<< HEAD

=======
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
>>>>>>> f16b0516171905ff2eb2705076d62df5de2cc437
import org.springframework.stereotype.Service;

import vn.nhom18.shoppingclothes.domain.Order;
import vn.nhom18.shoppingclothes.domain.OrderDetail;
import vn.nhom18.shoppingclothes.repository.OrderDetailRepository;
import vn.nhom18.shoppingclothes.repository.OrderRepository;
<<<<<<< HEAD
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
=======

>>>>>>> f16b0516171905ff2eb2705076d62df5de2cc437
@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

<<<<<<< HEAD
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
=======
    public Page<Order> getOrdersByPage(int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return this.orderRepository.findAll(pageable);
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public void updateOrder(Order order) {
        Optional<Order> orderOptional = this.fetchOrderById(order.getId());
        if (orderOptional.isPresent()) {
            Order currentOrder = orderOptional.get();
            currentOrder.setStatus(order.getStatus());
            this.orderRepository.save(currentOrder);
        }
    }

    public void deleteOrderById(long id) {
        // delete order detail
        Optional<Order> orderOptional = this.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> orderDetails = order.getOrderDetails();
            for (OrderDetail orderDetail : orderDetails) {
                this.orderDetailRepository.deleteById(orderDetail.getId());
            }
        }

        this.orderRepository.deleteById(id);
>>>>>>> f16b0516171905ff2eb2705076d62df5de2cc437
    }
}

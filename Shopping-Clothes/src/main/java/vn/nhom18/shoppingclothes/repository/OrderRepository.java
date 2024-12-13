package vn.nhom18.shoppingclothes.repository;

import vn.nhom18.shoppingclothes.domain.Order;
import vn.nhom18.shoppingclothes.domain.User;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    // lấy tổng đơn hàng theo ngày
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE DATE(order_date) = CURRENT_DATE", nativeQuery = true)
    double getTotalPriceByToday();

    // lấy tổng đơn hàng theo tháng
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE MONTH(order_date) = MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE)", nativeQuery = true)
    double getTotalPriceByMonth();

    // lấy tổng đơn hàng theo năm
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE YEAR(order_date) = YEAR(CURRENT_DATE)", nativeQuery = true)
    double getTotalPriceByYear();

    // lấy tổng đơn hàng theo tuần
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM orders WHERE MONTH(order_date) = weekday(order_date) = weekday(CURRENT_DATE) AND  MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE)", nativeQuery = true)
    double getTotalPriceByWeek();

    // lấy đơn hàng theo các ngày trong tuần
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM shopping.orders WHERE weekday(order_date) = :dayOfWeek AND MONTH(order_date) = MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE)", nativeQuery = true)
    double totalPriceByDayOfWeek(int dayOfWeek);

    // lấy đơn hàng theo các ngày trong tháng
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM shopping.orders WHERE DAY(order_date) = :day AND MONTH(order_date) = MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE)", nativeQuery = true)
    double totalPriceByDayOfMonth(int day);

    // lấy đơn hàng theo các tháng trong năm
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM shopping.orders WHERE MONTH(order_date) = :month AND YEAR(order_date) = YEAR(CURRENT_DATE)", nativeQuery = true)
    double totalPriceByMonthOfYear(int month);

    // lấy đơn hàng theo các năm
    @Query(value = "SELECT COALESCE(SUM(total_price), 0) FROM shopping.orders WHERE YEAR(order_date) = :year", nativeQuery = true)
    double totalPriceBy10Year(int year);

    // lấy đơn hàng gần nhất theo ngày
    @Query(value = "SELECT * FROM shopping.orders WHERE DATE(order_date) = CURRENT_DATE ORDER BY order_date DESC LIMIT 5", nativeQuery = true)
    List<Order> getCurrentOrderByDay();

    // lấy đơn hàng gần nhất theo tháng
    @Query(value = "SELECT * FROM shopping.orders WHERE MONTH(order_date) = MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE)   ORDER BY order_date DESC LIMIT 5", nativeQuery = true)
    List<Order> getCurrentOrderByMonth();

    // lấy đơn hàng gần nhất theo tuần
    @Query(value = "SELECT * FROM shopping.orders WHERE weekday(order_date) = weekday(CURRENT_DATE) AND MONTH(order_date) =  MONTH(CURRENT_DATE) AND YEAR(order_date) = YEAR(CURRENT_DATE) ORDER BY order_date DESC LIMIT 5", nativeQuery = true)
    List<Order> getCurrentOrderByWeek();

    // lấy đơn hàng gần nhất theo năm
    @Query(value = "SELECT * FROM shopping.orders WHERE YEAR(order_date) = YEAR(CURRENT_DATE) ORDER BY order_date DESC LIMIT 5", nativeQuery = true)
    List<Order> getCurrentOrderByYear();
}

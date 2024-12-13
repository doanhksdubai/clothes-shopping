package vn.nhom18.shoppingclothes.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import vn.nhom18.shoppingclothes.domain.Product;
import vn.nhom18.shoppingclothes.domain.ProductDetail;
import vn.nhom18.shoppingclothes.repository.ProductDetailRepository;
import vn.nhom18.shoppingclothes.repository.ProductRepository;

@Controller
public class HomeController {

    private final ProductRepository productRepository;
    private final ProductDetailRepository productDetailRepository;

    public HomeController(ProductRepository productRepository, ProductDetailRepository productDetailRepository) {
        this.productRepository = productRepository;
        this.productDetailRepository = productDetailRepository;
    }

    @GetMapping("/")
    public String showHomePage(Model model) {

        List<Product> products = productRepository.findAll();

        model.addAttribute("products", products);

        return "user/homepage";
    }

    @GetMapping("/product/detail")
    public String showProductDetail(@RequestParam("id") Long productId, Model model) {

        Product product = productRepository.findById(productId).orElse(null);
        if (product == null) {
            return "error/404";
        }

        List<ProductDetail> productDetails = product.getProductDetails() != null ? product.getProductDetails()
                : new ArrayList<>();

        Map<String, Long> stockMap = new HashMap<>();
        for (ProductDetail detail : productDetails) {
            if (detail.getSize() != null && detail.getColor() != null) {
                String key = detail.getSize().getId() + "_" + detail.getColor().getId();
                stockMap.put(key, detail.getQuantity());
            }
        }

        ObjectMapper objectMapper = new ObjectMapper();
        String stockMapJson = "";
        try {
            stockMapJson = objectMapper.writeValueAsString(stockMap);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("product", product);
        model.addAttribute("sizes", product.getUniqueSizes());
        model.addAttribute("colors", product.getUniqueColors());
        model.addAttribute("stockMap", stockMapJson);
        return "user/product-detail";
    }
}

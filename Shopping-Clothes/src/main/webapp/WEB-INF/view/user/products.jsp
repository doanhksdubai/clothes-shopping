<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sản phẩm</title>
            <!-- Google Fonts -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

            <!-- FontAwesome Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
            <!-- Icon Font Stylesheet -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />

            <!-- Libraries Stylesheet -->
            <link href="${pageContext.request.contextPath}/lib-user/lightbox/css/lightbox.min.css" rel="stylesheet" />
            <link href="${pageContext.request.contextPath}/lib-user/owlcarousel/assets/owl.carousel.min.css"
                rel="stylesheet" />
            <link href="${pageContext.request.contextPath}/lib-user/owlcarousel/assets/owl.theme.default.min.css"
                rel="stylesheet">
            <!-- Customized Bootstrap Stylesheet -->
            <link href="${pageContext.request.contextPath}/css-user/bootstrap.min.css" rel="stylesheet" />

            <!-- Template Stylesheet -->
            <link href="${pageContext.request.contextPath}/css-user/style.css" rel="stylesheet" />
        </head>

        <body>
            <jsp:include page="/WEB-INF/view/user/layout/header.jsp" />

            <!-- Main Content -->
            <div class="container-products" style="margin-top: 130px;">
                <div class="container py-5">
                    <div class="row">
                        <!-- Sidebar Lọc sản phẩm -->
                        <div class="col-md-3">
                            <div class="sidebar">
                                <h5>Lọc theo giá</h5>
                                <form action="${pageContext.request.contextPath}/products" method="get">
                                    <div class="mb-3">
                                        <label for="minPrice" class="form-label">Giá từ</label>
                                        <input type="number" name="minPrice" class="form-control" id="minPrice"
                                            value="${param.minPrice}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="maxPrice" class="form-label">Giá đến</label>
                                        <input type="number" name="maxPrice" class="form-control" id="maxPrice"
                                            value="${param.maxPrice}">
                                    </div>
                                    <div class="mb-3">
                                        <label for="priceSort" class="form-label">Sắp xếp theo giá</label>
                                        <select name="priceSort" class="form-select">
                                            <option value="asc" ${param.priceSort=='asc' ? 'selected' : '' }>Từ thấp đến
                                                cao
                                            </option>
                                            <option value="desc" ${param.priceSort=='desc' ? 'selected' : '' }>Từ cao
                                                đến
                                                thấp</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Lọc</button>
                                </form>
                            </div>
                        </div>


                        <!-- Danh sách sản phẩm -->
                        <div class="col-md-9">
                            <h2 class="text-center mb-4">Danh sách Sản phẩm</h2>
                            <div class="row">
                                <c:forEach var="product" items="${products}">
                                    <div class="col-md-4 mb-4">
                                        <div class="card">
                                            <img src="${pageContext.request.contextPath}${product.image}"
                                                class="card-img-top" alt="${product.name}">
                                            <div class="card-body">
                                                <h5 class="card-title">${product.name}</h5>
                                                <p class="card-text">${product.shortDesc}</p>
                                                <p class="card-text">${product.price} đ</p>
                                                <a href="${pageContext.request.contextPath}/product/detail?id=${product.id}"
                                                    class="btn btn-primary">Xem chi tiết</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/view/user/layout/footer.jsp" />

            <!-- JavaScript Libraries -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/easing/easing.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/waypoints/waypoints.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/lightbox/js/lightbox.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/owlcarousel/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/js-user/main.js"></script>
        </body>

        </html>
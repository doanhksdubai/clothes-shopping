<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Danh mục sản phẩm</title>

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
            <!-- Custom CSS -->
            <style>
                body {
                    font-family: 'Roboto', sans-serif;
                    background-color: #f8f9fa;
                    margin: 0;
                    padding: 0;
                }

                .container-category {
                    display: flex;
                    justify-content: space-between;
                    /* Thêm khoảng cách giữa sidebar và content */
                    margin-top: 160px;
                    max-width: 100%;

                }

                .content-category {
                    flex: 1;
                    margin-left: 20px;
                    padding: 20px;
                    background-color: #ffffff;
                    border-radius: 10px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    max-width: 100%;
                    /* Giới hạn chiều rộng của content */
                }

                .sidebar {
                    flex: 0 0 250px;
                    background-color: #ffffff;
                    border: 1px solid #ddd;
                    padding: 15px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    border-radius: 10px;
                    height: fit-content;
                    position: sticky;
                    top: 20px;
                }


                .sidebar h3 {
                    font-size: 20px;
                    font-weight: 700;
                    text-align: center;
                    margin-bottom: 15px;
                }

                .sidebar .toggle-btn {
                    display: flex;
                    justify-content: center;
                    margin-bottom: 10px;
                    cursor: pointer;
                    background-color: #007bff;
                    color: white;
                    padding: 10px;
                    border: none;
                    border-radius: 5px;
                    font-size: 16px;
                    transition: background-color 0.3s ease;
                }

                .sidebar .toggle-btn:hover {
                    background-color: #0056b3;
                }

                .list-group-item {
                    background: #ffffff;
                    border: 1px solid #ddd;
                    border-radius: 8px;
                    margin-bottom: 10px;
                    transition: 0.3s ease;
                    display: flex;
                    align-items: center;
                    padding: 15px;
                }

                .list-group-item:hover {
                    background-color: #007bff;
                    color: white;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                    transform: translateY(-2px);
                }

                .list-group-item i {
                    margin-right: 10px;
                    font-size: 1.5em;
                    color: #007bff;
                    transition: 0.3s ease;
                }

                .list-group-item:hover i {
                    color: white;
                }

                .list-group-item-action {
                    font-weight: 500;
                    font-size: 18px;
                }



                footer {
                    text-align: center;
                    margin-top: 50px;
                    padding: 20px;
                    background-color: #f1f1f1;
                    color: #333;
                }

                /* Thêm màu cho danh mục đang chọn */
                .list-group-item.active {
                    background-color: #007bff;
                    color: white;
                }

                .list-group-item.active:hover {
                    background-color: #0056b3;
                    color: white;
                }

                /* Thu nhỏ phần sản phẩm */
                .card {
                    max-width: 300px;
                    /* Giảm kích thước của card */
                    margin: 0 auto;
                    /* Căn giữa card */
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    border-radius: 8px;
                }

                .card-img-top {
                    max-height: 400px;
                    /* Giảm kích thước của hình ảnh */
                    object-fit: cover;
                    /* Đảm bảo hình ảnh không bị méo */
                }

                .card-body {
                    padding: 10px;
                }

                .card-title {
                    font-size: 16px;
                    /* Giảm kích thước tiêu đề */
                    font-weight: 600;
                }

                .card-text {
                    font-size: 14px;
                    /* Giảm kích thước mô tả */
                }
            </style>
        </head>

        <body>
            <!-- Header Include -->
            <jsp:include page="/WEB-INF/view/user/layout/header.jsp" />

            <div class="container-category">
                <!-- Sidebar -->
                <div class="sidebar">
                    <button class="toggle-btn" id="toggle-btn"><i class="fas fa-bars"></i> Thu gọn</button>
                    <div class="list-group" id="category-list">
                        <c:forEach var="category" items="${categories}">
                            <a href="${pageContext.request.contextPath}/categories/${category.id}/products?page=0"
                                class="list-group-item list-group-item-action ${category.id == category.id ? 'active' : ''}">
                                <i class="fas fa-folder"></i> ${category.name}
                            </a>
                        </c:forEach>
                    </div>

                </div>

                <!-- Main Content -->
                <div class="content-category">
                    <h2>Sản phẩm trong danh mục: ${category.name}</h2>
                    <c:if test="${not empty products}">
                        <div class="row">
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-3 mb-4">
                                    <div class="card">
                                        <img src="${product.image}" class="card-img-top" alt="${product.name}">
                                        <div class="card-body">
                                            <h5 class="card-title">${product.name}</h5>
                                            <p class="card-text">${product.shortDesc}</p>
                                            <p class="card-text"><strong>${product.price} VNĐ</strong></p>
                                            <a href="${pageContext.request.contextPath}/products/${product.id}"
                                                class="btn btn-primary">Xem chi tiết</a>

                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                                        <a class="page-link"
                                            href="${pageContext.request.contextPath}/categories/${category.id}/products?page=${i}">${i
                                            + 1}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </c:if>
                    <c:if test="${empty products}">
                        <p>Không có sản phẩm trong danh mục này.</p>
                    </c:if>
                </div>


            </div>

            <!-- Footer -->
            <jsp:include page="/WEB-INF/view/user/layout/footer.jsp" />
            <!-- JavaScript Libraries -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/easing/easing.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/waypoints/waypoints.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/lightbox/js/lightbox.min.js"></script>
            <script src="${pageContext.request.contextPath}/lib-user/owlcarousel/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/js-user/main.js"></script>

            <!-- JavaScript -->
            <script>
                const toggleBtn = document.getElementById('toggle-btn');
                const categoryList = document.getElementById('category-list');

                toggleBtn.addEventListener('click', () => {
                    if (categoryList.style.display === 'none') {
                        categoryList.style.display = 'block';
                        toggleBtn.innerHTML = '<i class="fas fa-bars"></i> Thu gọn';
                    } else {
                        categoryList.style.display = 'none';
                        toggleBtn.innerHTML = '<i class="fas fa-bars"></i> Hiện danh mục';
                    }
                });
            </script>
        </body>

        </html>
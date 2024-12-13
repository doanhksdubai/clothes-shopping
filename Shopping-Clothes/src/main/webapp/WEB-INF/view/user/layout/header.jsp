<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Spinner Start -->
    <div id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center">
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <!-- Navbar start -->
    <div class="container-fluid fixed-top">
      <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
          <div class="top-info ps-2">
            <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i>
              <a href="#" class="text-white">132 Nguyên Xá, Cầu Diễn</a></small>
            <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#"
                class="text-white">doanhvipnvn@gmail.com</a></small>
          </div>
        </div>
      </div>
      <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
          <a style="display: flex" href="${pageContext.request.contextPath}/homepage" class="navbar-brand">
            <img style="height:50px; width: 50px; border-radius: 50%; margin-right: 20px"
              src="${pageContext.request.contextPath}/images/steaven_logo.webp" class="img-fluid" alt="Logo Steamen" />
            <h1 class="text-primary display-6">Steaven</h1>
          </a>

          <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse">
            <span class="fa fa-bars text-primary"></span>
          </button>
          <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
            <div class="navbar-nav mx-auto">
              <!-- Sửa link "Trang chủ" để dẫn đến /homepage -->
              <a href="${pageContext.request.contextPath}/" class="nav-item nav-link">Trang chủ</a>
              <!-- Sửa link "Danh Mục Sản Phẩm" để dẫn đến /categories -->
              <a href="${pageContext.request.contextPath}/categories" class="nav-item nav-link">Danh Mục Sản Phẩm</a>
              <a href="${pageContext.request.contextPath}/products" class="nav-item nav-link">Sản phẩm</a>

              <a href="/cart" class="nav-item nav-link">Giỏ hàng</a>
              <a href="contact.html" class="nav-item nav-link">Liên hệ</a>
            </div>

            <div class="d-flex m-3 me-0">
              <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4"
                data-bs-toggle="modal" data-bs-target="#searchModal">
                <i class="fas fa-search text-primary"></i>
              </button>

              <c:if test="${not empty pageContext.request.userPrincipal}">


                <a href="/cart" class="position-relative me-4 my-auto">
                  <i class="fa fa-shopping-bag fa-2x"></i>
                  <span id="cartQuantity"
                    class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1"
                    style="top: -5px; left: 15px; height: 20px; min-width: 20px;">
                    ${sessionScope.sum}
                  </span>
                </a>

                <div class="dropdown my-auto">
                  <a href="#" class="dropdown" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
                    aria-expanded="false" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-user fa-2x"></i>
                  </a>

                  <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                    <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                      <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                        src="/images/products/1732193890952-anh_sp.jpg" />
                      <div class="text-center my-3">
                        <c:out value="${sessionScope.name}" />
                      </div>
                    </li>

                    <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>

                    <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                    <li>
                      <hr class="dropdown-divider">
                    </li>
                    <li>
                      <form method="post" action="/logout">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button class="dropdown-item">Đăng xuất</button>
                      </form>
                    </li>
                  </ul>
                </div>
              </c:if>
              <c:if test="${ empty pageContext.request.userPrincipal}">
                <a href="/login" class="position-relative me-4 my-auto">
                  Đăng nhập

                </a>
              </c:if>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <!-- Navbar End -->

    <!-- Modal Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Search by keyword
            </h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body d-flex align-items-center">
            <div class="input-group w-75 mx-auto d-flex">
              <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1" />
              <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Single Page Header End -->
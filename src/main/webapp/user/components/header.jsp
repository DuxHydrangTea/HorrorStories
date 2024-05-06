<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header class="tm-header" id="tm-header">
        <div class="tm-header-wrapper">
            <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="tm-site-header">
                <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-ghost fa-2x"></i></div>            
                <h1 class="text-center">Kể Chuyện Kinh Dị</h1>
            </div>
            <nav class="tm-nav" id="tm-nav">            
                <ul>
                    <li class="tm-nav-item active"><a href="index.jsp" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Trang chủ
                    </a></li>
                    
                    <li class="tm-nav-item"><a href="liststory.jsp?idcate=0" class="tm-nav-link">
                        <i class="fas fa-list"></i>
                        Danh sách chuyện
                    </a></li>
                  
                    <li class="tm-nav-item"><a href="/TruyenMa/user/history.jsp?days=0" class="tm-nav-link">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        Lịch sử 
                    </a></li>
                    <li class="tm-nav-item"><a href="setupseri.jsp" class="tm-nav-link">
                        <i class="fas fa-pen"></i>
                        Viết bài
                    </a></li>
                      <%
					if((String) session.getAttribute("username") == null){
					%>
                    <li class="tm-nav-item"><a href="/TruyenMa/user/login.jsp" class="tm-nav-link">
                        <i class="far fa-user"></i>
                        Đăng nhập
                    </a></li>
                    <%
                    }
					else{
						%>
						<li class="tm-nav-item"><a href="/TruyenMa/user/info.jsp" class="tm-nav-link">
                        <i class="far fa-user"></i>
                        Tài khoản
                    </a></li>
						<li class="tm-nav-item"><a href="/TruyenMa/user/logout.jsp" class="tm-nav-link">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Đăng xuất
                    </a></li>
						<%
					}
                    %>
                </ul>
            </nav>
            <div class="tm-mb-65">
                <a rel="nofollow" href="/TruyenMa/admin/index.jsp" class="tm-social-link">
                    <i class="fab fa-facebook tm-social-icon"></i>
                </a>
                <a href="https://twitter.com" class="tm-social-link">
                    <i class="fab fa-twitter tm-social-icon"></i>
                </a>
                <a href="https://instagram.com" class="tm-social-link">
                    <i class="fab fa-instagram tm-social-icon"></i>
                </a>
                <a href="https://linkedin.com" class="tm-social-link">
                    <i class="fab fa-linkedin tm-social-icon"></i>
                </a>
            </div>
            <p class="tm-mb-80 pr-5 text-white">
                Xtra Blog is a multi-purpose HTML template from TemplateMo website. Left side is a sticky menu bar. Right side content will scroll up and down.
            </p>
        </div>
    </header>
   
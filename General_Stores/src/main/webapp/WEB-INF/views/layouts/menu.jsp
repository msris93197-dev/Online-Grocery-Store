<div class="store-header">
<!-- header-bottom-->
    <div class="header-bot">
        <div class="container">
            <div class="row header-bot_inner_wthreeinfo_header_mid">
                <!-- logo -->
                <div class="col-md-3 logo_agile mb-4">
                    <h1 class="text-center">
                        <a href="${pageContext.request.contextPath}/home" class="font-weight-bold font-italic" style="font-size: 60px;">
                            <i class="fas fa-shopping-basket brand-mark" aria-hidden="true"></i>&nbsp;Pantrix
                        </a>
                    </h1><span class="brand-caption">Everyday pantry essentials</span>
<!-- 					&emsp;&emsp;&emsp;&emsp;<i class="fas fa-phone" style="color:var(--ink);font-size:14px;"></i>&nbsp;<a style="font-size:14px;" href="tel:+91 9920887594">+91 992 088 7594 Order Now</a> -->
                </div>
                <!-- //logo -->
                <!-- header-bot -->
                <div class="col-md-9 header mt-4 mb-md-0 mb-4">
                    <div class="row">
                        <!-- search -->
                        <div class="col-10 agileits_search">
                            <form class="form-inline" action="/product/search" method="post">
                                <i class="fas fa-search search-field-icon" aria-hidden="true"></i>
                                <input class="form-control mr-sm-2" type="search" name="keyword" placeholder="Search your pantry favourites" aria-label="Search" required>
                                <button class="btn my-2 my-sm-3" type="submit">Search</button>
                            </form>
                        </div>
                        <!-- //search -->
                        <!-- cart details -->
                        <div class="col-2 top_nav_right text-center mt-sm-3 mt-2"><a class="header-action" href="${pageContext.request.contextPath}/customer/login"><i class="far fa-user" aria-hidden="true"></i><span>Account</span></a>
                            <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                                <form action="#" method="post" class="last">
                                    <input type="hidden" name="cmd" value="_cart">
                                    <input type="hidden" name="display" value="1">
                                    <button class="btn w3view-cart" aria-label="Open cart" type="submit" name="submit" value="">
                                        <i class="fas fa-shopping-basket" aria-hidden="true"></i><span class="cart-count" data-cart-count hidden></span>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <!-- //cart details -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- shop locator (popup) -->
    <!-- //header-bottom -->
<!-- navigation -->
    <div class="navbar-inner">
        <div class="container">
            <nav aria-label="Main navigation" class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto text-center mr-xl-5">
                        <li class="nav-item active mr-lg-2 mb-lg-0 mb-2">
                            <a class="nav-link" href="${pageContext.request.contextPath}/home">Home
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                            <a class="nav-link" href="${pageContext.request.contextPath}/product/all">All Products</a>
                        </li>
                        <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                            <a class="nav-link" href="${pageContext.request.contextPath}/about">About Store</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/contact">Contact Us</a>
                        </li>
                        <li class="nav-item mr-lg-2 mb-lg-0 mb-2">
                            <a class="nav-link" href="${pageContext.request.contextPath}/customer/login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/customer/register">Register</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <!-- //navigation -->
</div>
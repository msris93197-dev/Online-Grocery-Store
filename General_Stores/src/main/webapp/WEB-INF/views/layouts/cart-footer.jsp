<footer class="store-footer"><div class="container footer-inner">
  <div><div class="footer-brand">Pantrix</div><p>Your pantry, delivered.</p></div>
  <div class="footer-values"><span><i class="fas fa-leaf" aria-hidden="true"></i>Everyday pantry essentials</span><span><i class="fas fa-shopping-basket" aria-hidden="true"></i>Easy shopping</span><span><i class="far fa-thumbs-up" aria-hidden="true"></i>Great value</span></div>
</div></footer>
<div class="copy-right py-3"><div class="container"><p class="text-center">&copy; Pantrix. All rights reserved.</p></div></div>
<script src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
    <!-- //jquery -->
    <!-- nav smooth scroll -->
    <script>
        $(document).ready(function () {
            $(".dropdown").hover(
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function () {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
    <!-- //nav smooth scroll -->

    <!-- popup modal (for location)-->
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.js"></script>
    <script>
        $(document).ready(function () {
            $('.popup-with-zoom-anim').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });

        });
    </script>
    <!-- //popup modal (for location)-->

    <!-- cart-js -->
    <script src="${pageContext.request.contextPath}/js/minicart.js"></script>
    <script>
        paypals.minicarts.render(); //use only unique class names other than paypals.minicarts.Also Replace same class name in css and minicart.min.js

        paypals.minicarts.cart.on('checkout', function (evt) {
            var items = this.items(),
                len = items.length,
                total = 0,
                i;

            // Count the number of each item in the cart
            for (i = 0; i < len; i++) {
                total += items[i].get('quantity');
            }

// 			if (total < 3) {
// 				alert('The minimum order quantity is 3. Please add more to your shopping cart before checking out');
// 				evt.preventDefault();
// 			}
        });
    </script>
    <!-- //cart-js -->
    <!-- //password-script -->

    <!-- scroll seller -->
    <script src="${pageContext.request.contextPath}/js/scroll.js"></script>
    <!-- //scroll seller -->

    <!-- smoothscroll -->
    <script src="${pageContext.request.contextPath}/js/SmoothScroll.min.js"></script>
    <!-- //smoothscroll -->

    <!-- start-smooth-scrolling -->
    <script src="${pageContext.request.contextPath}/js/move-top.js"></script>
    <script src="${pageContext.request.contextPath}/js/easing.js"></script>
    <script>
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 1000);
            });
        });
    </script>
    <!-- //end-smooth-scrolling -->

    <!-- smooth-scrolling-of-move-up -->
    <script>
        $(document).ready(function () {
            /*
            var defaults = {
                containerID: 'toTop', // fading element id
                containerHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear'
            };
            */
            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });
    </script>
    <!-- //smooth-scrolling-of-move-up -->

    <!-- for bootstrap working -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <!-- //for bootstrap working -->
    <!-- //js-files -->
<script src="${pageContext.request.contextPath}/js/theme.js"></script>

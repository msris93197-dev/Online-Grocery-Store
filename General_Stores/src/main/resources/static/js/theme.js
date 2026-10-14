/* Presentation-only enhancements. Existing form and cart handlers remain authoritative. */
(function () {
  'use strict';
  function ready() {
    var content = document.querySelector('.ads-grid, .privacy, .contact, .welcome, .fourzerofour, .container.h-100, .banner-bootom-w3-agileits');
    if (content) {
      content.id = content.id || 'main-content';
      content.setAttribute('role', 'main');
      content.setAttribute('tabindex', '-1');
      var skip = document.createElement('a');
      skip.className = 'skip-link'; skip.href = '#' + content.id; skip.textContent = 'Skip to content';
      document.body.insertBefore(skip, document.body.firstChild);
    }
    // Bootstrap owns click, touch and keyboard dropdown interaction.
    if (window.jQuery) {
      window.jQuery('.dropdown').off('mouseenter mouseleave');
    }
    // Preserve navigation URLs and identify the current page without hard-coded active states.
    var links = document.querySelectorAll('.navbar-nav .nav-link[href]');
    Array.prototype.forEach.call(links, function (link) {
      if (link.getAttribute('href') === '#') return;
      var current = link.pathname === window.location.pathname;
      link.parentElement.classList.toggle('active', current);
      if (current) link.setAttribute('aria-current', 'page');
      else link.removeAttribute('aria-current');
      var legacy = link.querySelector('.sr-only');
      if (legacy && !current) legacy.hidden = true;
    });
    var minicart = window.paypals && window.paypals.minicarts;
    if (minicart && minicart.cart) {
      function updateCount() {
        var total = minicart.cart.items().reduce(function (sum, item) { return sum + (Number(item.get('quantity')) || 0); }, 0);
        Array.prototype.forEach.call(document.querySelectorAll('[data-cart-count]'), function (badge) {
          badge.textContent = total; badge.hidden = !total;
          badge.setAttribute('aria-label', total + ' items in current basket');
        });
        var dialog = document.getElementById('PPminicarts');
        if (dialog) {
          dialog.setAttribute('role', 'dialog'); dialog.setAttribute('aria-label', 'Your shopping basket');
          var close = dialog.querySelector('.minicarts-closer');
          if (close) close.setAttribute('aria-label', 'Close basket');
          Array.prototype.forEach.call(dialog.querySelectorAll('.minicarts-quantity'), function (input) { input.setAttribute('aria-label', 'Item quantity'); });
          Array.prototype.forEach.call(dialog.querySelectorAll('.minicarts-remove'), function (button) { button.setAttribute('aria-label', 'Remove item'); });
        }
      }
      updateCount();
      minicart.cart.on('add', updateCount);
      minicart.cart.on('remove', updateCount);
      minicart.cart.on('change', updateCount);
      // Quantity changes redraw the legacy cart; observe its DOM to update accessible labels.
      var dialog = document.getElementById('PPminicarts');
      if (dialog && window.MutationObserver) {
        new MutationObserver(function (records) {
          if (records.some(function (r) { return r.type === 'childList'; })) {
            // Do not observe label attribute changes or badge text outside this dialog.
            updateCount();
          }
        }).observe(dialog, { childList: true, subtree: true });
      }
      document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') minicart.view.hide();
      });
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', ready);
  else ready();
}());

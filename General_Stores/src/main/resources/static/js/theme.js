/* Minicart count and accessibility annotations; legacy cart handling remains authoritative. */
(function () {
  'use strict';
  function ready() {
    var minicart = window.paypals && window.paypals.minicarts;
    if (minicart && minicart.cart) {
      function updateCount() {
        var total = minicart.cart.items().reduce(function (sum, item) { return sum + (Number(item.get('quantity')) || 0); }, 0);
        Array.prototype.forEach.call(document.querySelectorAll('[data-cart-count]'), function (badge) {
          badge.textContent = total; badge.hidden = false;
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

/* Shell behavior is independent of legacy form submission and minicart interception. */
(function () {
  'use strict';
  function initShell() {
    var body = document.body, main = document.getElementById('main-content');
    var sidebar = document.getElementById('app-sidebar'), toggle = document.querySelector('.sidebar-toggle');
    var backdrop = document.querySelector('.sidebar-backdrop'), desktop = window.matchMedia('(min-width: 1200px)');
    var profile = document.querySelector('.profile-toggle'), menu = document.querySelector('.profile-links');
    var inerted = [], skeletonTimer;
    function focusables(element) {
      return Array.prototype.filter.call(element.querySelectorAll('a[href],button,input,select,textarea,[tabindex]'), function (el) {
        return !el.disabled && el.tabIndex >= 0 && el.getClientRects().length;
      });
    }
    function closeProfile(returnFocus) {
      if (!menu) return;
      menu.hidden = true; profile.setAttribute('aria-expanded', 'false');
      if (returnFocus) profile.focus();
    }
    function setDrawer(open, returnFocus) {
      body.classList.toggle('drawer-open', open);
      backdrop.hidden = !open;
      toggle.setAttribute('aria-expanded', String(open));
      sidebar.inert = !open && !desktop.matches;
      if (open) {
        closeProfile(false);
        sidebar.setAttribute('role', 'dialog'); sidebar.setAttribute('aria-modal', 'true');
        inerted = Array.prototype.filter.call(body.children, function (el) {
          return el !== sidebar && el !== backdrop && !el.inert && !/^(SCRIPT|STYLE)$/.test(el.tagName);
        });
        inerted.forEach(function (el) { el.inert = true; });
        focusables(sidebar)[0].focus();
      } else {
        sidebar.removeAttribute('role'); sidebar.removeAttribute('aria-modal');
        inerted.forEach(function (el) { el.inert = false; }); inerted = [];
        if (returnFocus) toggle.focus();
      }
    }
    function syncSidebar() {
      setDrawer(false, false);
      var collapsed = false;
      try { collapsed = localStorage.getItem('pantrix-sidebar-collapsed') === 'true'; } catch (e) { /* Storage may be disabled. */ }
      body.classList.toggle('sidebar-collapsed', desktop.matches && collapsed);
      document.documentElement.classList.remove('sidebar-precollapsed');
      toggle.setAttribute('aria-expanded', String(desktop.matches && !collapsed));
      sidebar.inert = !desktop.matches;
    }
    if (sidebar && toggle && backdrop) {
      syncSidebar();
      toggle.addEventListener('click', function () {
        if (desktop.matches) {
          var collapsed = body.classList.toggle('sidebar-collapsed');
          toggle.setAttribute('aria-expanded', String(!collapsed));
          try { localStorage.setItem('pantrix-sidebar-collapsed', String(collapsed)); } catch (e) { /* Optional preference. */ }
        } else setDrawer(!body.classList.contains('drawer-open'), true);
      });
      backdrop.addEventListener('click', function () { setDrawer(false, true); });
      sidebar.querySelector('.drawer-close').addEventListener('click', function () { setDrawer(false, true); });
      sidebar.addEventListener('click', function (event) { if (event.target.closest('a') && !desktop.matches) setDrawer(false, true); });
      if (desktop.addEventListener) desktop.addEventListener('change', syncSidebar);
      else desktop.addListener(syncSidebar);
      Array.prototype.forEach.call(sidebar.querySelectorAll('a'), function (link) {
        link.title = link.textContent.trim();
        var path = location.pathname.replace(/\/$/, ''), target = link.pathname.replace(/\/$/, '');
        var active = path === target || (target.endsWith('/product/all') && /\/(products\/\d+|product\/productdetails|product\/search)$/.test(path)) || (target.endsWith('/admin/product/view') && /\/admin\/product\/edit\/[^/]+$/.test(path)) || (target.endsWith('/cart/my-cart') && /\/cart\/(checkout|order\/checkout)$/.test(path));
        if (active) link.setAttribute('aria-current', 'page');
      });
    }
    if (profile && menu) {
      profile.addEventListener('click', function () { menu.hidden = !menu.hidden; profile.setAttribute('aria-expanded', String(!menu.hidden)); });
      profile.addEventListener('keydown', function (event) {
        if (event.key === 'ArrowDown') { event.preventDefault(); menu.hidden = false; profile.setAttribute('aria-expanded', 'true'); focusables(menu)[0].focus(); }
      });
      menu.addEventListener('keydown', function (event) {
        if (event.key !== 'ArrowDown' && event.key !== 'ArrowUp' && event.key !== 'Home' && event.key !== 'End') return;
        event.preventDefault(); var links = focusables(menu), index = links.indexOf(document.activeElement);
        if (event.key === 'Home') index = 0;
        else if (event.key === 'End') index = links.length - 1;
        else index = (index + (event.key === 'ArrowDown' ? 1 : -1) + links.length) % links.length;
        links[index].focus();
      });
      document.addEventListener('click', function (event) { if (!event.target.closest('.profile-control')) closeProfile(false); });
      document.addEventListener('focusin', function (event) { if (!event.target.closest('.profile-control')) closeProfile(false); });
    }
    document.addEventListener('keydown', function (event) {
      if (event.key === 'Escape') {
        if (body.classList.contains('drawer-open')) setDrawer(false, true);
        else if (menu && !menu.hidden) closeProfile(true);
      }
      if (event.key === 'Tab' && body.classList.contains('drawer-open')) {
        var list = focusables(sidebar), first = list[0], last = list[list.length - 1];
        if (event.shiftKey && document.activeElement === first) { event.preventDefault(); last.focus(); }
        else if (!event.shiftKey && document.activeElement === last) { event.preventDefault(); first.focus(); }
      }
    });
    Array.prototype.forEach.call(document.querySelectorAll('[data-back]'), function (link) {
      link.addEventListener('click', function (event) {
        try {
          if (document.referrer && new URL(document.referrer).origin === location.origin && history.length > 1) {
            event.preventDefault(); history.back();
          }
        } catch (e) { /* The href is the parent fallback. */ }
      });
    });
    Array.prototype.forEach.call(document.querySelectorAll('[data-quantity-step]'), function (button) {
      button.addEventListener('click', function () {
        var input = button.closest('form').querySelector('[name="quantity"]');
        var amount = Number(input.value) || 1;
        input.value = Math.max(Number(input.min) || 1, Math.floor(amount) + Number(button.dataset.quantityStep));
        input.dispatchEvent(new Event('change', { bubbles: true }));
      });
    });
    // Reserve image dimensions first, then reveal cached and newly loaded images alike.
    body.classList.add('images-enhanced');
    Array.prototype.forEach.call(document.querySelectorAll('img.product-image'), function (img) {
      var tile = img.closest('.image-tile');
      if (!tile) { tile = document.createElement('span'); tile.className = 'image-tile compact-image-tile'; img.parentNode.insertBefore(tile, img); tile.appendChild(img); }
      function loaded() { tile.classList.add('image-ready'); tile.classList.remove('image-error'); }
      function failed() {
        tile.classList.add('image-error'); tile.classList.remove('image-ready');
        if (!tile.querySelector('.image-placeholder')) {
          var icon = document.createElement('i'); icon.className = 'fas fa-shopping-basket image-placeholder';
          icon.setAttribute('role', 'img'); icon.setAttribute('aria-label', 'Product image unavailable'); tile.appendChild(icon);
        }
      }
      img.addEventListener('load', loaded); img.addEventListener('error', failed);
      if (img.complete) { if (img.naturalWidth) loaded(); else failed(); }
    });
    var topbar = document.querySelector('.app-topbar');
    function scrollShadow() { if (topbar) topbar.classList.toggle('scrolled', window.scrollY > 8); }
    window.addEventListener('scroll', scrollShadow, { passive: true }); scrollShadow();
    var minicart = window.paypals && window.paypals.minicarts;
    var cartButton = document.querySelector('[data-open-cart]');
    if (cartButton && minicart) cartButton.addEventListener('click', function () { minicart.view.show(); });
    if (minicart && minicart.cart) minicart.cart.on('add', function () {
      Array.prototype.forEach.call(document.querySelectorAll('[data-cart-count]'), function (badge) {
        badge.classList.remove('bump'); void badge.offsetWidth; badge.classList.add('bump');
        badge.addEventListener('animationend', function end() { badge.classList.remove('bump'); badge.removeEventListener('animationend', end); });
      });
    });
    function resetSkeleton() {
      clearTimeout(skeletonTimer);
      var old = document.querySelector('.navigation-skeleton'); if (old) old.remove();
      if (main) { main.removeAttribute('aria-busy'); main.classList.remove('navigation-loading'); }
    }
    function showSkeleton(url) {
      if (!main || url.origin !== location.origin) return;
      var details = /\/product\/productdetails$/.test(url.pathname);
      if (!details && !/\/(product\/(all|search)|products\/\d+)$/.test(url.pathname)) return;
      resetSkeleton();
      var overlay = document.createElement('div'); overlay.className = 'navigation-skeleton';
      overlay.setAttribute('role', 'status'); overlay.setAttribute('aria-live', 'polite');
      var label = document.createElement('span'); label.className = 'sr-only'; label.textContent = 'Loading products'; overlay.appendChild(label);
      var title = document.createElement('div'); title.className = 'skeleton-block skeleton-title'; title.setAttribute('aria-hidden', 'true'); overlay.appendChild(title);
      var grid = document.createElement('div'); grid.className = details ? 'navigation-skeleton-details' : 'navigation-skeleton-grid'; grid.setAttribute('aria-hidden', 'true');
      for (var i = 0; i < (details ? 2 : 6); i++) { var block = document.createElement('div'); block.className = 'skeleton-block'; grid.appendChild(block); }
      overlay.appendChild(grid); main.appendChild(overlay); main.setAttribute('aria-busy', 'true'); main.classList.add('navigation-loading');
      overlay.style.top = Math.max(0, window.scrollY - main.offsetTop) + 'px';
      skeletonTimer = setTimeout(resetSkeleton, 10000); // Failed or cancelled navigation must not leave a cover behind.
    }
    document.addEventListener('click', function (event) {
      var link = event.target.closest('a[href]');
      if (!link || event.defaultPrevented || event.button !== 0 || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey || link.hasAttribute('download') || (link.target && link.target !== '_self') || link.hasAttribute('data-back')) return;
      var url = new URL(link.href, location.href);
      if (url.pathname === location.pathname && url.search === location.search) return;
      showSkeleton(url);
    });
    document.addEventListener('submit', function (event) {
      if (!event.defaultPrevented && event.target.matches('.shell-search')) showSkeleton(new URL(event.target.action, location.href));
    });
    window.addEventListener('pageshow', function () { resetSkeleton(); if (sidebar) syncSidebar(); closeProfile(false); });
    window.addEventListener('pagehide', resetSkeleton);
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initShell);
  else initShell();
}());

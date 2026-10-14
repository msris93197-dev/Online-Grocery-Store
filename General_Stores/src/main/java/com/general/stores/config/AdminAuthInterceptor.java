package com.general.stores.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

/**
 * Blocks every /admin/** request unless an admin is logged in (session attribute "aemail").
 * Public admin routes (login, forgot password, logout) are excluded in ResourceConfig.
 */
public class AdminAuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("aemail") != null) {
			return true;
		}
		response.sendRedirect(request.getContextPath() + "/admin/login");
		return false;
	}
}

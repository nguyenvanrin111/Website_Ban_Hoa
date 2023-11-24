/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Account;

/**
 *
 * @author admin
 */
@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/admin-*"})
public class AuthorizationFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        //Kiem tra dang nhap
        Account account = (Account) session.getAttribute("account");

        if (account != null && account.getRole().equals(Account.ADMIN)) {
            chain.doFilter(request, response);
            return;
        }
//        req.setAttribute("error", "You are not permission");
//        req.getRequestDispatcher("login.jsp").forward(request, response);
          res.sendRedirect("login.jsp");
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {

    }

}

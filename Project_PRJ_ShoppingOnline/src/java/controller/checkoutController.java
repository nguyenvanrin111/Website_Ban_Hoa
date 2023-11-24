/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import context.SendMail;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ShippingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modal.Cart;
import modal.Order;
import modal.Security;
import modal.Shipping;

/**
 *
 * @author admin
 */
public class checkoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new LinkedHashMap<>();
            }

            //Tinh tong tien
            double totalMoney = 0;
            for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
                Integer productId = entry.getKey();
                Cart cart = entry.getValue();

                totalMoney += cart.getQuantity() * cart.getProduct().getPrice();
            }
            request.setAttribute("totalMoney", totalMoney);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String note = request.getParameter("note");

        //Luu vao database
        //LuuShipping
        Shipping shipping = Shipping.builder()
                .name(name)
                .phone(phone)
                .address(address)
                .build();
        int shippingId = new ShippingDAO().createReturnId(shipping);//Tra ve id tu tang cua ban ghi vua luu vao DB
        //Luu Order
        HttpSession session = request.getSession();
        Map<Integer, Cart> carts = (Map<Integer, Cart>) session.getAttribute("carts");
        if (carts == null) {
            carts = new LinkedHashMap<>();
        }

        //Tinh tong tien
        double totalPrice = 0;
        for (Map.Entry<Integer, Cart> entry : carts.entrySet()) {
            Integer productId = entry.getKey();
            Cart cart = entry.getValue();

            totalPrice += cart.getQuantity() * cart.getProduct().getPrice();
        }

        Order order = Order.builder()
                .accountId(1)
                .totalPrice(totalPrice)
                .note(note)
                .shippingId(shippingId)
                .build();
        int orderId = new OrderDAO().createReturnId(order);
        //Luu OrderDetail

        new OrderDetailDAO().saveCart(orderId, carts);

        session.removeAttribute("carts");

        response.sendRedirect("thanks");
        String SUBJECT = "Your order has been successfully placed ";
        String MESSAGEREGISTER = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "<meta charset=\"UTF-8\">\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Account has been created successfully </h3>\n"
                + "    <div>Full Name : "+name+"</div>\n"
                + "    <div>Phone : "+phone+"</div>\n"
                + "    <div>Address : "+address+"</div>\n"
                + "    <div>Total Price : "+totalPrice+"</div>\n"
                + "    <h3 style=\"color: blue;\">Thank you very much!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";;
        SendMail.send(email, SUBJECT, MESSAGEREGISTER, Security.EMAIL, Security.PASSWORD);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

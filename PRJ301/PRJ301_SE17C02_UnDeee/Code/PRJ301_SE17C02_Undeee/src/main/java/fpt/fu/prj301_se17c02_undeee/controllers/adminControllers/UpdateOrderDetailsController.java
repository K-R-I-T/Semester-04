/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fpt.fu.prj301_se17c02_undeee.controllers.adminControllers;

import fpt.fu.prj301_se17c02_undeee.models.OrderDto;
import fpt.fu.prj301_se17c02_undeee.services.OrdersServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
@WebServlet(name = "UpdateOrderDetailsController", urlPatterns = {"/update-orderDetails"})
public class UpdateOrderDetailsController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateOrderDetailsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateOrderDetailsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.sendRedirect("./");
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
        String id = request.getParameter("id");
        String[] AllOrderDetailsId = request.getParameterValues("AllOrderDetailsId");

        OrdersServices orderService = new OrdersServices();

        double total_price = 0.0;

        for (String orderDetailsId : AllOrderDetailsId) {
            String product_id = request.getParameter("product_" + orderDetailsId);
            String size_id = request.getParameter("size_" + orderDetailsId);
            String quantity = request.getParameter("quantity_" + orderDetailsId);

            orderService.updateOrderDetails(Integer.parseInt(product_id), Integer.parseInt(size_id), Integer.parseInt(quantity), Integer.parseInt(orderDetailsId));
        }
        List<OrderDto> orderList = orderService.getOrderDetailsByOrderId(Integer.parseInt(id));
        for (OrderDto order : orderList) {
            total_price += order.getProduct().getPrice() * order.getSize().getPercent() * order.getOrderDetail().getQuantity();
        }
        DecimalFormat decimalFormat = new DecimalFormat("#.###");
        String formattedPrice = decimalFormat.format(total_price);
        String status = request.getParameter("status");
        if (status != null) {
            orderService.updateOrders(status, Double.parseDouble(formattedPrice), Integer.parseInt(id));
            response.sendRedirect("./view-orders?updateSuccess=true");
        } else {
            response.sendRedirect("./view-orders?updateSuccess=false");
        }

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

<%-- 
    Document   : customerViewOrders
    Created on : Dec 3, 2023, 7:29:35 PM
    Author     : dell
--%>

<%@page import="fpt.fu.prj301_se17c02_undeee.models.Paging"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fpt.fu.prj301_se17c02_undeee.models.OrderDto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp" %>
<%    Paging paging = (Paging) request.getAttribute("paging");
    List<OrderDto> orderList = paging.getO();
    //List<OrderDto> orderList = (List) request.getAttribute("orderList");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    double numPage = Math.ceil((double) paging.getTotal() / (double) paging.getPerPage());
    System.out.println("Total: " + paging.getTotal());
    System.out.println("PerPage: " + paging.getPerPage());
    String pageInstant = request.getParameter("page");
    int numPageInstant = 1;
    if (pageInstant != null) {
        numPageInstant = Integer.parseInt(pageInstant);
    }
    System.out.println("numPage: " + numPage);
    System.out.println("numPageInstant: " + numPageInstant);
%>
<div class="container mt-5 padding-top-100">
    <h2>Order History</h2>
    <div class="row">
        <% for (OrderDto order : orderList) {
                Date created_at = order.getOrder().getCreated_at();
                String formattedDate = dateFormat.format(created_at);
        %>
        <div class="card mb-3">
            <div class="card-body">
                <button class="btn btn-link" onclick="showDetails('<%= order.getOrder().getId()%>')">Show Details</button>
                <div class="row">
                    <div class="col-md-3">
                        <img src="views/layout/logo.jpg" alt="Product Image" class="img-fluid">
                    </div>
                    <div class="col-md-9">
                        <h5 class="card-title">Order ID: <%= order.getOrder().getId()%></h5>
                        <p class="card-text">Total Price: <%= order.getOrder().getTotal_price()%></p>
                        <p class="card-text">Status: <%= order.getOrder().getStatus()%></p>
                        <p class="card-text">Created At: <%= formattedDate%></p>
                    </div>
                </div>

                <form id="detailsForm_<%= order.getOrder().getId()%>" style="display: none;">
                    <h4>Order Details</h4>
                    <p class="card-text">Address: <%= order.getAddress().getAddress_detail()%></p>
                    <%
                        for (OrderDto orderDetail : order.getOrderDetailList()) {
                    %>
                    <div class="row">
                        <div class="col-md-3">
                            <img src="./views/products/<%= orderDetail.getProduct().getImage()%>" alt="Product Image" class="img-fluid">
                        </div>
                        <div class="col-md-9">
                            <p class="card-text">Quantity: <%= orderDetail.getOrderDetail().getQuantity()%></p>
                            <p class="card-text">Size: <%= orderDetail.getSize().getName()%></p>
                        </div>
                    </div>
                    <% }%>

                    <button class="btn btn-link" onclick="hideDetails('<%= order.getOrder().getId()%>')">Hide Details</button>
                </form>
            </div>
        </div>
        <% }%>
    </div>

    <div class="row">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="<%if (numPageInstant > 1) {%>./order-history?page=<%= numPageInstant - 1%><%}%>" tabindex="-1">Previous</a>
                </li>
                <% for (int i = 0; i < numPage; i++) {%>
                <li class="page-item">
                    <a class="page-link" href="./order-history?page=<%= i + 1%>"><%= i + 1%></a>
                </li>
                <%}%>
                <li class="page-item">
                    <a class="page-link" href="<%if (numPageInstant < numPage) {%>./order-history?page=<%= numPageInstant + 1%><%}%>">Next</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<%@include file="layout/footer.jsp" %>
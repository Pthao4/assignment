
package controller;

import dao.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class updateCart extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateCart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateCart at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Cập nhật số lượng sản phẩm trong cơ sở dữ liệu
        CartDAO cartDAO = new CartDAO(); // Đây là lớp để thao tác với cơ sở dữ liệu
        cartDAO.updateProductQuantity(productId, quantity);

        // Tính tổng tiền giỏ hàng
        int totalAmount = cartDAO.totalAmount(request.getParameter("uid")); // Tính lại tổng giá trị giỏ hàng

        // Gửi lại tổng tiền về cho client
        response.getWriter().write(String.valueOf(totalAmount));
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

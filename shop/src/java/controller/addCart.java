
package controller;

import dao.CartDAO;
import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Cart;

public class addCart extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addCart</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCart at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CartDAO cdao = new CartDAO();
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        String uid = request.getParameter("uid");
        String pid = request.getParameter("pid");
        String quantity = request.getParameter("quantity");
        cdao.addToCart(new Cart(udao.getUser(uid), pdao.getProductById(pid), Integer.parseInt(quantity)));
        request.setAttribute("user", udao.getUser(uid));
        response.sendRedirect("home?uid=" + uid);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CartDAO cdao = new CartDAO();
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        String uid = request.getParameter("uid");
        String pid = request.getParameter("pid");
        String quantity = request.getParameter("quantity");
        cdao.addToCart(new Cart(udao.getUser(uid), pdao.getProductById(pid), Integer.parseInt(quantity)));
        request.setAttribute("user", udao.getUser(uid));
        response.sendRedirect("pdetail?uid=" + uid +"&pid=" +pid);
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

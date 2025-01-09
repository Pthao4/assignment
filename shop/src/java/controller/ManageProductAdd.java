/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.SupperlierDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;

public class ManageProductAdd extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManageProductAdd</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManageProductAdd at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        SupperlierDAO sdao = new SupperlierDAO();

        request.setAttribute("clist", cdao.getAllCategory());
        request.setAttribute("slist", sdao.getAllSupperliers());

        String uid = request.getParameter("uid");

        request.setAttribute("user", udao.getUser(uid));

        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        SupperlierDAO sdao = new SupperlierDAO();

        String uid = request.getParameter("uid");

        request.setAttribute("user", udao.getUser(uid));

        Product p = new Product();
        
        p.setName(request.getParameter("ProductName"));
        p.setPrice(Integer.parseInt(request.getParameter("UnitPrice")));
        p.setSupplier(sdao.getSupplierByID(Integer.parseInt(request.getParameter("SupplierID"))));
        p.setCategory(cdao.getCategoryById(Integer.parseInt(request.getParameter("CategoryID"))));
        p.setInStock(Integer.parseInt(request.getParameter("UnitsInStock")));
        p.setImg(request.getParameter("Image"));
        p.setDescribe(request.getParameter("Describe"));
        
        pdao.addProduct(p);
        
        response.sendRedirect("manageproductshow?uid=" + uid);
    }

    /*
    UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        CategoryDAO cdao = new CategoryDAO();
        SupperlierDAO sdao = new SupperlierDAO();
        
        String uid = request.getParameter("uid");
        String pid = request.getParameter("pid");
        
        Product p = pdao.getProductById(pid);
        
        p.setName(request.getParameter("ProductName"));
        p.setPrice(Integer.parseInt(request.getParameter("UnitPrice")));
        p.setSupplier(sdao.getSupplierByID(Integer.parseInt(request.getParameter("SupplierID"))));
        p.setCategory(cdao.getCategoryById(Integer.parseInt(request.getParameter("CategoryID"))));
        p.setInStock(Integer.parseInt(request.getParameter("UnitsInStock")));
        p.setImg(request.getParameter("Image"));
        p.setDescribe(request.getParameter("Describe"));
        
        pdao.updateProduct(p);
        
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.CartDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Cart;

public class ProductShowControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductShowControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductShowControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        CategoryDAO cdao = new CategoryDAO();
        ProductDAO pdao = new ProductDAO();
        String indexString = request.getParameter("index");
        String cidString = request.getParameter("cid");
        String s = request.getParameter("s");
        int index;
        if (indexString == null || indexString.isEmpty()) {
            index = 1;
        } else {
            index = Integer.parseInt(request.getParameter("index"));
        }

        if ((s == null || s.isEmpty())) {
            if (cidString == null || cidString.isEmpty()) {
                int numberProduct = pdao.totalProduct();
                int endPage = numberProduct / 8;
                if (endPage % 8 != 0) {
                    endPage++;
                }
                request.setAttribute("plist", pdao.paginationAllProduct(index));
                request.setAttribute("endPage", endPage);
            } else {
                // phân loại theo loại son không search
                int numberProduct = pdao.numProductOfCategory(cidString);
                int endPage = numberProduct / 8;
                if (endPage % 8 != 0) {
                    endPage++;
                }
                request.setAttribute("cid", cidString);
                request.setAttribute("plist", pdao.paginationCategory(index, cidString));
                request.setAttribute("endPage", endPage);
            }
        } else {
            if (cidString == null || cidString.isEmpty()) {
                int numberProduct = pdao.numResultSearch(s);
                int endPage = numberProduct / 8;
                if (endPage % 8 != 0) {
                    endPage++;
                }
                request.setAttribute("numsearch", numberProduct + " result for search '" + s + "'");
                request.setAttribute("plist", pdao.paginationSearch(index, s));
                request.setAttribute("endPage", endPage);
                request.setAttribute("s", s);
            } else {
//                phân loại theo loại son của tìm kiếm
                int numberProduct = pdao.numResultSearchByCategory(cidString, s);
                int endPage = (numberProduct + 7) / 8;
                request.setAttribute("s", s);
                request.setAttribute("cid", cidString);
                request.setAttribute("numsearch", numberProduct + " result(s) for search: '" + s + "' in category");
                request.setAttribute("plist", pdao.paginationSearchByCategory(index, cidString, s));
                request.setAttribute("endPage", endPage);
            }
        }
        request.setAttribute("user", udao.getUser(request.getParameter("uid")));
        request.setAttribute("index", index);
        request.setAttribute("clist", cdao.getAllCategory());
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("addtocart");
        String username = request.getParameter("uid");
        CartDAO cdao = new CartDAO();
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        cdao.addToCart(new Cart(udao.getUser(username), pdao.getProductById(pid), 1));
        response.sendRedirect("pshow?uid=" + username + "&index=1");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}


package controller;

import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.Product;

public class ProductDetailControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO udao = new UserDAO();
        String user = request.getParameter("uid");
        
        if (user == null || user.isEmpty()) {
            response.getWriter().println("uid is missing or empty!");
            return;
        }
        request.setAttribute("user", udao.getUser(user));
        
        ProductDAO pdao = new ProductDAO();
        String pid = request.getParameter("pid");
        if (pid == null || pid.isEmpty()) {
            response.getWriter().println("PID is missing or empty!");
            return;
        }

        Product product = pdao.getProductById(pid);
        if (product == null) {
            response.getWriter().println("Product not found with ID: " + pid);
            return;
        }

        request.setAttribute("product", product);

        ArrayList<Product> samelist = pdao.sameCategory(product.getCategory().getId());
        if (samelist == null || samelist.isEmpty()) {
            response.getWriter().println("No related products found.");
            return;
        }
        request.setAttribute("samelist", samelist);
        request.getRequestDispatcher("productdetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

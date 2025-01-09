package controller;

import dao.ProductDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

@MultipartConfig
public class RegisterControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signupControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signupControl at " + request.getContextPath() + "</h1>");
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
        UserDAO udao = new UserDAO();

        // Gọi phương thức lưu dữ liệu vào cơ sở dữ liệu
        String userName = request.getParameter("username");
        String fullName = request.getParameter("fullname");
        String password = request.getParameter("password");
        int roleID = 2; // Chuyển đổi từ chuỗi sang int
        String email = request.getParameter("email");
        String birthDay = request.getParameter("birthday");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        if (udao.checkUserNameDuplicate(userName)) {
            request.setAttribute("exist", "UserName exist!");
            request.getRequestDispatcher("login").forward(request, response);
        } else {
            // Gọi phương thức insertUser để chèn dữ liệu vào cơ sở dữ liệu
            udao.insert(new User(userName, fullName, password, address, phone, email, "images/users/none.jpg", birthDay, roleID));
            // Chuyển hướng về trang thành công hoặc thông báo
        response.sendRedirect("signup-success.jsp");
        }

        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

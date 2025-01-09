
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.User;

public class authenticUserControl extends HttpServlet {
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet authenticUserControl</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet authenticUserControl at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
        UserDAO udao = new UserDAO();
        User user = udao.getUser(uid);
        if(user.getPhone().equalsIgnoreCase(phone) && user.getEmail().equalsIgnoreCase(email)){
            request.setAttribute("uid", uid);
            request.getRequestDispatcher("changepass.jsp").forward(request, response);
        }
        else{
            response.sendRedirect("answerAuthenticate.jsp");
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

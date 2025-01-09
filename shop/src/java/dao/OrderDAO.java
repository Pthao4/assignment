package dao;

import DBContext.DBContext;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import models.Cart;
import models.Order;

public class OrderDAO extends DBContext {

    public void addNewOrder(String userName) {
        CartDAO cdao = new CartDAO();
        ProductDAO pdao = new ProductDAO();
        try {
            String sql1 = "insert into Orders(Date, UserName, TotalMoney, [status]) values\n"
                    + "(?, ?, ?, ?);";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setString(1, LocalDate.now().toString());
            ps1.setString(2, userName);
            ps1.setInt(3, cdao.totalAmount(userName));
            ps1.setInt(4, 0);
            ps1.executeUpdate();
        } catch (SQLException e) {
        }

        try {
            String sql2 = "SELECT Top 1 [OrderID] FROM [dbo].[Orders] ORDER BY [OrderID] DESC";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            ResultSet rs = st2.executeQuery();
            if (rs.next()) {
                int oID = rs.getInt(1);
                ArrayList<Cart> list = cdao.getAllCartByUserName(userName);
                for (Cart cart : list) {
                    String sql3 = "insert into OrderDetails(OrderID, ProductID, Quantity, UnitPrice) values\n"
                            + "(?, ?, ?, ?);";
                    PreparedStatement ps3 = connection.prepareStatement(sql3);
                    ps3.setInt(1, oID);
                    ps3.setInt(2, cart.getProduct().getId());
                    ps3.setInt(3, cart.getQuantity());
                    ps3.setInt(4, cart.getProduct().getPrice());
                    pdao.updateQuantitySold(cart.getQuantity(), cart.getProduct().getId());
                    pdao.updateUnitsInStock(cart.getQuantity(), cart.getProduct().getId());
                    ps3.executeUpdate();
                }
            }
        } catch (Exception e) {
        }
    }

    public Order getLastOrder() {
        UserDAO udao = new UserDAO();
        String sql = "select top 1 * from Orders order by OrderID desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1), LocalDate.parse(rs.getString(2)),
                        udao.getUser(rs.getString(3)), rs.getInt(4), rs.getInt(5));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public Order getOrderByID(int id) {
        UserDAO udao = new UserDAO();
        String sql = "select * from Orders where OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(rs.getInt(1), LocalDate.parse(rs.getString(2)),
                        udao.getUser(rs.getString(3)), rs.getInt(4), rs.getInt(5));
            }
        } catch (SQLException e) {
        }
        return null;
    }
}

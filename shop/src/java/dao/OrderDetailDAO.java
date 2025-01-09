package dao;

import DBContext.DBContext;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.OrderDetail;

public class OrderDetailDAO extends DBContext {

    public ArrayList<OrderDetail> getAllDetailByOid(int oid) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        String sql = "select * from OrderDetails where OrderID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, oid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(odao.getOrderByID(rs.getInt(1)),
                        pdao.getProductById(rs.getString(2)), rs.getInt(3), rs.getInt(4)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public static void main(String[] args) {
        OrderDetailDAO od = new OrderDetailDAO();
        OrderDAO odao = new OrderDAO();

        ArrayList<OrderDetail> list = od.getAllDetailByOid(odao.getLastOrder().getId());
        
        for (OrderDetail orderDetail : list) {
            System.out.println(orderDetail.toString());
        }
    }
}

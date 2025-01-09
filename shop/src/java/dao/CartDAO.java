package dao;

import DBContext.DBContext;
import java.util.ArrayList;
import models.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.Product;

public class CartDAO extends DBContext {

    UserDAO udao = new UserDAO();
    ProductDAO pdao = new ProductDAO();

    public ArrayList<Cart> getAllCart() {
        ArrayList<Cart> list = new ArrayList<>();
        String sql = "select [UserName], ProductID, quantity from Cart";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(udao.getUser(rs.getString(1)), pdao.getProductById(String.valueOf(rs.getInt(2))), rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Cart> getAllCartByUserName(String uname) {
        ArrayList<Cart> list = new ArrayList<>();
        String sql = "select [UserName], ProductID, quantity from Cart where UserName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(udao.getUser(rs.getString(1)), pdao.getProductById(String.valueOf(rs.getInt(2))), rs.getInt(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void addToCart(Cart x) {
        Cart check = getProductInCart(x.getProduct().getId(), x.getUser().getUserName());
        if (check == null) {
            String sql = "insert into Cart([UserName], ProductID, quantity) values(?, ?, ?);";
            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, x.getUser().getUserName());
                ps.setInt(2, x.getProduct().getId());
                ps.setInt(3, x.getQuantity());
                ps.executeUpdate();
            } catch (SQLException e) {
            }
        } else {
            updateProductQuantity(x.getProduct().getId(), check.getQuantity() + x.getQuantity());
        }

    }

    public int countItemsInCart(String uname) {
        String sql = "select count(*) from Cart where UserName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int totalAmount(String uname) {
        ArrayList<Cart> list = getAllCartByUserName(uname);
        int total = 0;
        for (Cart cart : list) {
            total += cart.getQuantity() * cart.getProduct().getPrice();
        }
        return total;
    }

//    //---------------
    public void updateProductQuantity(int productId, int quantity) {
        try {
            String query = "UPDATE Cart SET quantity = ? WHERE productId = ?";
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setInt(1, quantity);
            pst.setInt(2, productId);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //--------------
    public void removeProduct(int productId, String uid) {
        String sql = "DELETE FROM Cart WHERE ProductID = ? AND UserName = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            stmt.setString(2, uid);
            stmt.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Cart getProductInCart(int productId, String uid) {
        String sql = "SELECT * FROM Cart WHERE ProductID = ? AND UserName = ?";
        try (
                PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            stmt.setString(2, uid);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                return new Cart(udao.getUser(rs.getString(1)), pdao.getProductById(String.valueOf(rs.getInt(2))), rs.getInt(3));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    // check out
    public void removeAllProductByUserName(String uname) {
        String sql = "DELETE FROM Cart WHERE UserName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkNumberInstock(String uname) {
        ArrayList<Cart> list = getAllCartByUserName(uname);
        for (Cart cart : list) {
            if (cart.getProduct().getInStock() < cart.getQuantity()) {
                return false;
            }
        }
        return true;
    }

    public boolean processCheckout(String uname) {
        OrderDAO odao = new OrderDAO();
        ProductDAO pdao = new ProductDAO();
        if (checkNumberInstock(uname)) {
            odao.addNewOrder(uname);
            removeAllProductByUserName(uname);
            return true;
        }
        else{
            return false;
        }
    }

    public static void main(String[] args) {
        CartDAO cdao = new CartDAO();
        UserDAO udao = new UserDAO();
        ProductDAO pdao = new ProductDAO();
        cdao.addToCart(new Cart(udao.getUser("User1"), pdao.getProductById("2"), 1));
        ArrayList<Cart> list = cdao.getAllCart();
        for (Cart cart : list) {
            System.out.println(cart.toString());
        }
    }
}

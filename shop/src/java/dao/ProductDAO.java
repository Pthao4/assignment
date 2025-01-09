package dao;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import models.Product;

public class ProductDAO extends DBContext {

    SupperlierDAO sdao = new SupperlierDAO();
    CategoryDAO cdao = new CategoryDAO();

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products where [status] = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Product getProductById(String id) {
        String sql = "select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products where ProductID = ? and [status] = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<Product> bestSaller5() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 5 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where [status] = 1\n"
                + "order by QuantitySold desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> lastProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 5 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where [status] = 1\n"
                + "order by releaseDate desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> goodRate() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 5 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where [status] = 1\n"
                + "order by StarRating desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> sameCategory(int cid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select top 4 ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where CategoryID = ? and [status] = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> searchListByName(String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where ProductName like ? and [status] = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,  search);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int totalProduct() {
        String sql = "select count(*) from Products where [status] = 1";
        int answer = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                answer = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return answer;
    }

    public ArrayList<Product> paginationAllProduct(int index) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Products\n"
                + "where [status] = 1\n"
                + "order by ProductID\n"
                + "OFFSET ((? - 1) * 8) ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int numResultSearch(String search) {
        String sql = "select count(ProductID) from Products where ProductName like ? and [status] = 1";
        int answer = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,search);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                answer = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return answer;
    }

    public ArrayList<Product> paginationSearch(int index, String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where ProductName like ? and [status] = 1\n"
                + "order by ProductID\n"
                + "OFFSET ((? - 1) * 8) ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,search);
            ps.setInt(2, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int numProductOfCategory(String cid) {
        String sql = "select count(ProductID) from Products where CategoryID = ? and [status] = 1";
        int answer = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                answer = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return answer;
    }

    public ArrayList<Product> paginationCategory(int index, String cid) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where CategoryID = ? and [status] = 1\n"
                + "order by ProductID\n"
                + "OFFSET ((? - 1) * 8) ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ps.setInt(2, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int numResultSearchByCategory(String cid, String search) {
        String sql = "select count(ProductID) from Products where CategoryID = ? and ProductName like ? and [status] = 1";
        int answer = 0;
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ps.setString(2, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                answer = rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return answer;
    }

    public ArrayList<Product> paginationSearchByCategory(int index, String cid, String search) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select ProductID, ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, StarRating, [image], describe, releaseDate, [status]  from Products\n"
                + "where CategoryID = ? and ProductName like ? and [status] = 1\n"
                + "order by ProductID\n"
                + "OFFSET ((? - 1) * 8) ROWS\n"
                + "FETCH NEXT 8 ROWS ONLY";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cid);
            ps.setString(2, search);
            ps.setInt(3, index);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2),
                        sdao.getSupplierByID(rs.getInt(3)),
                        cdao.getCategoryById(rs.getInt(4)),
                        rs.getInt(5), rs.getInt(6),
                        rs.getInt(7), rs.getFloat(8), rs.getString(9),
                        rs.getString(10), rs.getDate(11).toLocalDate(), rs.getInt(12)));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public void updateQuantitySold(int quantitySold, int pid) {
        String sql = "update Products set QuantitySold = QuantitySold + ? where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantitySold);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateUnitsInStock(int quantitySold, int pid) {
        String sql = "update Products set UnitsInStock = UnitsInStock - ?  where ProductID=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantitySold);
            ps.setInt(2, pid);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // update edit product
    public void updateProduct(Product p) {
        String sql = "update Products set\n"
                + "ProductName = ?, \n"
                + "UnitPrice = ?, \n"
                + "SupplierID = ?,\n"
                + "CategoryID = ?, \n"
                + "UnitsInStock = ?, \n"
                + "[image] = ?,\n"
                + "describe = ? \n"
                + "where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getPrice());
            ps.setInt(3, p.getSupplier().getId());
            ps.setInt(4, p.getCategory().getId());
            ps.setInt(5, p.getInStock());
            ps.setString(6, p.getImg());
            ps.setString(7, p.getDescribe());
            ps.setInt(8, p.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }

    }

    // delete product
    public void deleteProduct(Product p) {
        String sql = "update Products set [status] = 0 where ProductID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, p.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    // add product
    public void addProduct(Product p) {
        String sql = "insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, \n"
                + "StarRating, [image], describe, releaseDate, [status]) values\n"
                + "(?, ?, ?, \n"
                + "?, ?, 0, 4.7, ?, ?,"
                + "?, 1\n"
                + ");";
        LocalDate date = LocalDate.now();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setInt(2, p.getSupplier().getId());
            ps.setInt(3, p.getCategory().getId());
            ps.setInt(4, p.getPrice());
            ps.setInt(5, p.getInStock());
            ps.setString(6, p.getImg());
            ps.setString(7, p.getDescribe());
            ps.setString(8, date.toString());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        ProductDAO sdao = new ProductDAO();
        ArrayList<Product> list = sdao.paginationSearchByCategory(1, "2", "th");
        for (Product supplier : list) {
            System.out.println("-----------------");
            System.out.println(supplier.toString());
        }

        System.out.println("-----------------");
        System.out.println(sdao.numResultSearchByCategory("2", "th"));
    }
}

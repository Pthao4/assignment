
package dao;

import DBContext.DBContext;
import java.util.ArrayList;
import models.Supplier;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SupperlierDAO extends DBContext{
    public ArrayList<Supplier> getAllSupperliers(){
        ArrayList<Supplier> list = new ArrayList<>();
        String sql = "select SupplierID, CompanyName, ContactName, Country, Phone, HomePage from Suppliers";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(
                        new Supplier(rs.getInt(1), rs.getString(2), 
                                rs.getString(3),rs.getString(4), 
                                rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Supplier getSupplierByID(int id){
        String sql = "select SupplierID, CompanyName, ContactName, Country, Phone, HomePage from Suppliers where SupplierID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return 
                        new Supplier(rs.getInt(1), rs.getString(2), 
                                rs.getString(3),rs.getString(4), 
                                rs.getString(5), rs.getString(6));
            }
        } catch (SQLException e) {
        }
        return null;
    }
        
    public static void main(String[] args) {
        SupperlierDAO sdao = new SupperlierDAO();
        ArrayList<Supplier> list = sdao.getAllSupperliers();
        for (Supplier supplier : list) {
            System.out.println(supplier.toString());
        }
        
        System.out.println("-----------------");
        System.out.println(sdao.getSupplierByID(2));
    }
}


package dao;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import models.Category;

public class CategoryDAO extends DBContext{
    public ArrayList<Category> getAllCategory(){
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select CategoryID, CategoryName, [Description] from Categories";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Category getCategoryById(int id){
        String sql = "select CategoryID, CategoryName, [Description] from Categories where CategoryID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    public static void main(String[] args) {
        CategoryDAO sdao = new CategoryDAO();
        ArrayList<Category> list = sdao.getAllCategory();
        for (Category supplier : list) {
            System.out.println(supplier.toString());
        }
        
        System.out.println("-----------------");
        System.out.println(sdao.getCategoryById(2));
    }
}

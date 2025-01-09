package dao;

import DBContext.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import models.User;

public class UserDAO extends DBContext {

    public ArrayList<User> getAllUsers() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from Users WHERE [status] = 1 order by roleId asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<User> getAllUsersNoAdmin() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from Users WHERE [status] = 1 and RoleID = 2 order by roleId asc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public User check(String username, String password) {
        String sql = "SELECT * FROM Users WHERE userName = ? and password = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getUser(String username) {
        String sql = "select*from Users where username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public int checkAccountAdmin(String userName) {
        String sql = "select * from Users where [userName]=? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {

        }
        return 0;
    }

    public boolean checkUserNameDuplicate(String username) {
        String sql = "SELECT * FROM Users WHERE userName = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID"));
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void updateImage(String image, String userName) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET \n"
                + "      [Image] = ?\n"
                + " WHERE userName = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, image);
            st.setString(2, userName);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insert(User c) {
        String sql = "insert into Users(UserName, FullName, [Password], RoleID, "
                + "[Image], [Email], BirthDay, [Address], Phone, [status]) values\n"
                + "(?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, c.getUserName());
            st.setString(2, c.getFullName());
            st.setString(3, c.getPassword());
            st.setInt(4, c.getRoleID());
            st.setString(5, c.getImage());
            st.setString(6, c.getEmail());
            st.setString(7, c.getBirthdate());
            st.setString(8, c.getAddress());
            st.setString(9, c.getPhone());
            st.setInt(10, 1);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changePassword(User s) {
        String sql = "Update Users set password = ? where username = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, s.getPassword());
            st.setString(2, s.getUserName());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public ArrayList<User> searchUserByName(String search) {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select UserName, FullName, [Password], RoleID, [Image], [Email], BirthDay, [Address], Phone, [status] from Users\n"
                + "where UserName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add( 
                new User(rs.getString("userName"), rs.getString("fullName"), rs.getString("password"),
                        rs.getString("address"), rs.getString("phone"), rs.getString("email"), 
                        rs.getString("Image"), rs.getString("BirthDay"), rs.getInt("roleID")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public void becomeAdmin(String uname){
        String sql = "update Users set RoleID = 1 where UserName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, uname);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteUser(String userName){
        String sql = "update Users set [status] = 0 where UserName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, userName);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public static void main(String[] args) {
        UserDAO udao = new UserDAO();
//        udao.changePassword(new User("nam863", "Nguyễn Văn Nam", "123", "Hà Nội", "01111111111", "nam862@gmail.com", "", "2004-09-14", 0));
        ArrayList<User> list = udao.searchUserByName("pt");
        for (User user : list) {
            System.out.println(user.toString());
        }

        udao.becomeAdmin("TuanAnh");
    }
}

package models;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

public class User {
     private String userName, fullName, password, address, phone, image, email;
    private int roleID;
    private String birthdate;
    
    public User() {
    }

    public User(String userName, String fullName, String password, String address, String phone, String email, String image, String birthdate, int roleID) {
        this.userName = userName;
        this.fullName = fullName;
        this.password = password;
        this.address = address;
        this.phone = phone;
        this.birthdate = birthdate;
        this.email = email;
        this.roleID = roleID;
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(String birthdate) {
        this.birthdate = birthdate;
    }

    
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String formatBirthDate(){
        DateTimeFormatter dt = DateTimeFormatter.ofPattern("dd/MM/yyy", Locale.US);
        LocalDate l = LocalDate.parse(birthdate);
        return l.format(dt).toString();
    }
        
    @Override
    public String toString() {
        return "User{" + "userName=" + userName + ", fullName=" + fullName + ", password=" + password + ", address=" + address + ", phone=" + phone + ", image=" + image + ", email=" + email + ", roleID=" + roleID + ", birthdate=" + birthdate + '}';
    }
    
    
}

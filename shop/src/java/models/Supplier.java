
package models;

public class Supplier {
    private int id;
    private String companyName;
    private String contactName;
    private String country;
    private String phone;
    private String homePage;

    public Supplier() {
    }

    public Supplier(int id, String companyName, String contactName, String country, String phone, String homePage) {
        this.id = id;
        this.companyName = companyName;
        this.contactName = contactName;
        this.country = country;
        this.phone = phone;
        this.homePage = homePage;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHomePage() {
        return homePage;
    }

    public void setHomePage(String homePage) {
        this.homePage = homePage;
    }

    @Override
    public String toString() {
        return "Supplier{" + "id=" + id + ", companyName=" + companyName + ", contactName=" + contactName + ", country=" + country + ", phone=" + phone + ", homePage=" + homePage + '}';
    }
    
    
    
}


package models;

import java.time.LocalDate;

public class Product {
    private int id;
    private String name;
    private Supplier supplier;
    private Category category;
    private int price;
    private int inStock;
    private int qSold;
    private float startRating;
    private String img;
    private String describe;
    private LocalDate releaseDate;
    private int status;
    
    public Product() {
    }

    public Product(int id, String name, Supplier supplier, Category category, int price, int inStock, int qSold, float startRating, String img, String describe, LocalDate releaseDate, int status) {
        this.id = id;
        this.name = name;
        this.supplier = supplier;
        this.category = category;
        this.price = price;
        this.inStock = inStock;
        this.qSold = qSold;
        this.startRating = startRating;
        this.img = img;
        this.describe = describe;
        this.releaseDate = releaseDate;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getInStock() {
        return inStock;
    }

    public void setInStock(int inStock) {
        this.inStock = inStock;
    }

    public int getqSold() {
        return qSold;
    }

    public void setqSold(int qSold) {
        this.qSold = qSold;
    }

    public float getStartRating() {
        return startRating;
    }

    public void setStartRating(float startRating) {
        this.startRating = startRating;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" + "id=" + id + ", name=" + name + ", supplier=" + supplier + ", category=" + category + ", price=" + price + ", inStock=" + inStock + ", qSold=" + qSold + ", startRating=" + startRating + ", img=" + img + ", describe=" + describe + ", releaseDate=" + releaseDate + ", status=" + status + '}';
    }

    

    
    
}
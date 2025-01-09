
package models;

public class OrderDetail {
    private Order order;
    private Product product;
    private int quantity;
    private int unitprice;

    public OrderDetail() {
    }

    public OrderDetail(Order order, Product product, int quantity, int unitprice) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.unitprice = unitprice;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(int unitprice) {
        this.unitprice = unitprice;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "order=" + order + ", product=" + product + ", quantity=" + quantity + ", unitprice=" + unitprice + '}';
    }

    
    
    
}
